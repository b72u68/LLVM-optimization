(* CS443, Fall 2022 *)
(* Project 5 *)
(* My Dinh *)

open LLVM.Ast
open LLVM.Utils
open LLVM.SSA

module VMap = LLVM.Typecheck.LLVarmap

module ExpDataflow = Dataflow.Make
                       (struct type t = var end)
                       (struct type t = inst
                               let compare a b =
                                 (* This may not do the right thing, but it'll
                                  * do something, which is good enough to just
                                  * treat the set like a list *)
                                 if a < b then -1 else
                                   if a = b then 0 else 1
                        end)

module DFG = ExpDataflow.DFG
module ExpSet = ExpDataflow.FSet

(** === Convenience functions === **)
(* You may or may not need these depending on what optimizations you
 * implement, but you should look through them and know what's available! *)

(* Return true iff t1 and t2 are equal types *)
let rec types_eq (t1: typ) (t2: typ) : bool =
  match (t1, t2) with
  | (TInteger i1, TInteger i2) -> i1 = i2
  | (TPointer t1, TPointer t2) | (TArray t1, TArray t2) -> types_eq t1 t2
  | (TFunction (r1, args1), TFunction (r2, args2)) ->
     types_eq r1 r2 &&
       List.fold_left2
         (fun b at1 at2 -> b && types_eq at1 at2)
         true
         args1
         args2
  | (TVoid, TVoid) -> true
  | (TStruct s1, TStruct s2) -> s1 = s2
  | _ -> false

(* If i is "a = e1", this will return Some d for the first instruction
 * "d = e2" in fs where e1 = e2.
 * Equality is determined by inst_rhs_eq.
 * Returns None if there is no matching instruction in fs.
 *)
let get_dest_of_matching_exp (i: inst) (fs: ExpSet.t) : var option =
  let val_eq v1 v2 =
    match (v1, v2) with
    | (Const n1, Const n2) -> n1 = n2
    | (Var n1, Var n2) -> compare_var n1 n2 = 0
    | _ -> false
  in
  let inst_rhs_eq i1 i2 =
    match (i1, i2) with
    | (ISet (_, _, v1), ISet (_, _, v2)) -> val_eq v1 v2
    | (IBinop (_, b1, _, v11, v12), IBinop (_, b2, _, v21, v22)) ->
       val_eq v11 v21 && val_eq v12 v22 && b1 = b2
    | (ICmp (_, b1, _, v11, v12), ICmp (_, b2, _, v21, v22)) ->
       val_eq v11 v21 && val_eq v12 v22 && b1 = b2
    | (ICast (_, c1, _, v1, t1), ICast (_, c2, _, v2, t2)) ->
       c1 = c2 && types_eq t1 t2 && val_eq v1 v2
    | (IGetElementPtr (_, _, v1, inds1), IGetElementPtr (_, _, v2, inds2)) ->
       compare_var v1 v2 = 0 &&
         List.fold_left2
           (fun b (_, v1) (_, v2) -> b && val_eq v1 v2)
           true
           inds1
           inds2
    | (ILoad (_, _, v1), ILoad (_, _, v2)) ->
       (* This is OK as long as stores kill any loads *)
       compare_var v1 v2 = 0
    | _ -> false
  in
  ExpSet.fold
    (fun i2 a ->
      if inst_rhs_eq i i2 then
        match LLVM.Utils.def_inst i2 with
        | d::_ -> Some d
        | _ -> a
      else a)
    fs
    None

(* Get the type of a variable giving the LLVM typing context *)
let get_type_of_var (ts: typ LLVM.Typecheck.LLVarmap.t) (v: var) =
  VMap.find (LLVM.SSA.base_var v) ts

(* Perform substitutions on every value in a list of LLVM instructions.
* rep_val will be called on every value operand and the returned value will be
* used in its place. This is also done on variable operands
* (e.g. f in "call ty f(args)"), but variable operands will only be replaced
* if the replacement is also a variable.
* This is sort of like "map" on LLVM function bodies. *)
let sub_body (rep_val: value -> value) (body: inst list) : inst list =
  List.map
    (fun i ->
      match i with
      | ISet (d, t, v) -> ISet (d, t, rep_val v)
      | IBinop (d, b, t, v1, v2) -> IBinop (d, b, t, rep_val v1, rep_val v2)
      | ICmp (d, c, t, v1, v2) -> ICmp (d, c, t, rep_val v1, rep_val v2)
      | ICast (d, ct, t, v, t2) -> ICast (d, ct, t, rep_val v, t2)
      | IRet (Some (t, v)) -> IRet (Some (t, rep_val v))
      | ICall (v1, t, v2, args) ->
         ICall (v1, t,
                (match rep_val (Var v2) with
                 | Var v2' -> v2'
                 | _ -> v2),
                List.map (fun (t, v) -> (t, rep_val v)) args)
      | IGetElementPtr (v1, t, v2, inds) ->
         IGetElementPtr
           (v1, t,
            (match rep_val (Var v2) with
            | Var v2' -> v2'
            | _ -> v2),
            List.map (fun (t, v) -> (t, rep_val v)) inds)
      | ILoad (d, t, v) -> ILoad (d, t,
                                  (match rep_val (Var v) with
                                   | Var v' -> v'
                                   | _ -> v))
      | IStore (t, vl, v) -> IStore (t, rep_val vl,
                                     (match rep_val (Var v) with
                                      | Var v' -> v'
                                      | _ -> v))
      | IPhi (d, t, preds) ->
         IPhi (d, t, List.map (fun (l, v) -> (l, rep_val v)) preds)
      | _ -> i
    )
    body

(* Returns true iff f contains no calls to other functions. *)
let can_inline (f: func) : bool =
  not (List.exists (function ICall _ -> true | _ -> false)
         (Array.to_list f.f_body))

(* An instruction that does nothing. May be helpful sometimes.
 * Of course, this should be eliminated by DCE. *)
let noop_inst = ISet (new_temp(), TInteger 32, Const 0)


(* Common Subexpression Elimination *)
let cse_gen n =
    match n with
    | ISet (_, ty, _)
        | IBinop (_, _, ty, _, _)
        | ICmp (_, _, ty, _, _)
        | ICast (_, _, _, _, ty)
        | IPhi (_, ty, _) ->
                (match ty with
                | TInteger _ -> ExpSet.singleton n
                | _ -> ExpSet.empty)
    | _ -> ExpSet.empty

let cse_kill n fs =
    let defs = def_inst n in
    if List.length defs = 0 then fs
    else
        let a = List.nth defs 0 in
        ExpSet.filter (fun i -> not (List.mem a (use_inst i))) fs

let cse (fn: string) (body: inst list) : inst list =
    let ((cfg, entry_node), nodes) = DFG.cfg_of_insts fn body in
    let (in_fs, out_fs) = ExpDataflow.compute cfg cse_gen cse_kill true true in
    let rec cse_rec nodes =
        match nodes with
        | [] -> []
        | node::t ->
                let i = DFG.G.get_data node in
                match i with
                | ISet (d, ty, _)
                    | IBinop (d, _, ty, _, _)
                    | ICmp (d, _, ty, _, _)
                    | ICast (d, _, _, _, ty)
                    | IGetElementPtr (d, ty, _, _)
                    | ILoad (d, ty, _) ->
                            let in_set = ExpDataflow.NodeMap.find node in_fs in
                            let d_rep_opt = get_dest_of_matching_exp i in_set in
                            (match d_rep_opt with
                            | Some d_rep -> (ISet (d, ty, Var d_rep))::(cse_rec t)
                            | None -> i::(cse_rec t))
                | _ -> i::(cse_rec t)
    in
    cse_rec nodes


(* Constant/Var Propagation *)
module VarMap = Map.Make(String)

let find_replace_value (m: value VarMap.t) (vv: value) : value =
    try
        match vv with
        | Var (Local v) -> VarMap.find v m
        | _ -> vv
     with Not_found -> vv

let propagation (il: inst list) : inst list =
    let rec propagation_rec (m: value VarMap.t) (il: inst list) =
        match il with
        | [] -> []
        | i::t ->
                match i with
                | ICast (Local d, cty, ty1, vv, ty2) ->
                        let vv_rep = find_replace_value m vv in
                        if types_eq ty1 ty2 then
                            (ICast (Local d, cty, ty1, vv_rep, ty2))::(propagation_rec (VarMap.add d vv_rep m) t)
                        else
                            (ICast (Local d, cty, ty1, vv_rep, ty2))::(propagation_rec m t)
                | ISet (Local d, ty, vv) ->
                        let vv_rep = find_replace_value m vv in
                        (ISet (Local d, ty, vv_rep))::(propagation_rec (VarMap.add d vv_rep m) t)
                | IBinop (d, op, ty, vv1, vv2) ->
                        let vv1_rep = find_replace_value m vv1 in
                        let vv2_rep = find_replace_value m vv2 in
                        (IBinop (d, op, ty, vv1_rep, vv2_rep))::(propagation_rec m t)
                | ICmp (d, op, ty, vv1, vv2) ->
                        let vv1_rep = find_replace_value m vv1 in
                        let vv2_rep = find_replace_value m vv2 in
                        (ICmp (d, op, ty, vv1_rep, vv2_rep))::(propagation_rec m t)
                | ICondBr (vv, l1, l2) ->
                        let s_rep = find_replace_value m vv in
                        (ICondBr (s_rep, l1, l2))::(propagation_rec m t)
                | ICall (d, ty, fptr, args) ->
                        let fptr_rep = find_replace_value m (Var fptr) in
                        let args_rep = List.map (fun (ty, vv) -> (ty, find_replace_value m vv)) args in
                        (match fptr_rep with
                        | Var fptrv -> (ICall (d, ty, fptrv, args_rep))::(propagation_rec m t)
                        | _ -> failwith "Expected a var value for function")
                | IRet (Some (ty, vv)) ->
                        let vv_rep = find_replace_value m vv in
                        (IRet (Some (ty, vv_rep)))::(propagation_rec m t)
                | _ -> i::(propagation_rec m t)
    in
    propagation_rec (VarMap.empty) il


(* Constant Folding *)
let bool_of_int (n: int) : bool = n <> 0

let int_of_bool (b: bool) : int = if b then 1 else 0

let rec constant_folding (il: inst list) : inst list =
    il |> List.map
        (fun i ->
            match i with
            | IBinop (d, op, ty, Const n1, Const n2) ->
                    let f =
                        (match op with
                        | BAdd -> (+)
                        | BSub -> (-)
                        | BMul -> ( * )
                        | BDiv -> (/)
                        | BAnd -> (land)
                        | BOr -> (lor)
                        | BXor -> (lxor))
                    in
                    ISet (d, ty, Const (f n1 n2))
            | ICmp (d, op, ty, Const n1, Const n2) ->
                    let f =
                        (match op with
                        | CEq -> (=)
                        | CNe -> (<>)
                        | CSGt -> (>)
                        | CSGe -> (>=)
                        | CSLt -> (<)
                        | CSLe -> (<=))
                    in
                    ISet (d, ty, Const (int_of_bool (f n1 n2)))
            | ICondBr (Const n, l1, l2) -> if (bool_of_int n) then IBr l1 else IBr l2
            | _ -> i)


(* Dead Code Elimination *)
let elim_dead (il: inst list) : inst list =
    let uses = List.concat (List.map use_inst il) in
    let rec elim_rec (il: inst list) =
        match il with
        | [] -> []
        | i::t ->
                let defs = def_inst i in
                if List.length defs = 0 then i::(elim_rec t)
                else
                    let d = List.nth defs 0 in
                    if List.mem d uses then i::(elim_rec t)
                    else elim_rec t
    in
    elim_rec il


(* Function Inlining *)
let sub_body_label (body: inst list) (target_lbl: label) (new_lbl: label) : inst list =
    let get_rep_label (l: label) = if l = target_lbl then new_lbl else l in
    body |> List.map
        (fun i ->
            match i with
            | IBr l -> IBr (get_rep_label l)
            | ICondBr (vv, l1, l2) -> ICondBr (vv, get_rep_label l1, get_rep_label l2)
            | IPhi (d, ty, preds) ->
                    let preds = List.map (fun (l, v) -> (get_rep_label l, v)) preds in
                    IPhi (d, ty, preds)
            | _ -> i)

let alpha_conversion (il: inst list) : inst list =
    let rep_val (target: value) (result: value) (v: value) =
        if v = target then result else v
    in
    let rec alpha_rec (hd_il: inst list) (tl_il: inst list) : inst list =
        match tl_il with
        | [] -> hd_il
        | i::t ->
                match i with
                | ISet (d, ty, v) ->
                        let d_rep = new_temp () in
                        let h = sub_body (rep_val (Var d) (Var d_rep)) hd_il in
                        let t = sub_body (rep_val (Var d) (Var d_rep)) t in
                        alpha_rec (h @ [ISet (d_rep, ty, v)]) t
                | IBinop (d, b, ty, v1, v2) ->
                        let d_rep = new_temp () in
                        let h = sub_body (rep_val (Var d) (Var d_rep)) hd_il in
                        let t = sub_body (rep_val (Var d) (Var d_rep)) t in
                        alpha_rec (h @ [IBinop (d_rep, b, ty, v1, v2)]) t
                | ICmp (d, c, ty, v1, v2) ->
                        let d_rep = new_temp () in
                        let h = sub_body (rep_val (Var d) (Var d_rep)) hd_il in
                        let t = sub_body (rep_val (Var d) (Var d_rep)) t in
                        alpha_rec (h @ [ICmp (d, c, ty, v1, v2)]) t
                | ICast (d, ct, ty, v, t2) ->
                        let d_rep = new_temp () in
                        let h = sub_body (rep_val (Var d) (Var d_rep)) hd_il in
                        let t = sub_body (rep_val (Var d) (Var d_rep)) t in
                        alpha_rec (h @ [ICast (d, ct, ty, v, t2)]) t
                | ICall (d, ty, fn, args) ->
                        let d_rep = new_temp () in
                        let h = sub_body (rep_val (Var d) (Var d_rep)) hd_il in
                        let t = sub_body (rep_val (Var d) (Var d_rep)) t in
                        alpha_rec (h @ [ICall (d_rep, ty, fn, args)]) t
                | IGetElementPtr (d, ty, v, indices) ->
                        let d_rep = new_temp () in
                        let h = sub_body (rep_val (Var d) (Var d_rep)) hd_il in
                        let t = sub_body (rep_val (Var d) (Var d_rep)) t in
                        alpha_rec (h @ [IGetElementPtr (d_rep, ty, v, indices)]) t
                | ILoad (d, ty, v) ->
                        let d_rep = new_temp () in
                        let h = sub_body (rep_val (Var d) (Var d_rep)) hd_il in
                        let t = sub_body (rep_val (Var d) (Var d_rep)) t in
                        alpha_rec (h @ [ILoad (d_rep, ty, v)]) t
                | IAlloca (d, ty, n) ->
                        let d_rep = new_temp () in
                        let h = sub_body (rep_val (Var d) (Var d_rep)) hd_il in
                        let t = sub_body (rep_val (Var d) (Var d_rep)) t in
                        alpha_rec (h @ [IAlloca (d_rep, ty, n)]) t
                | IPhi (d, ty, preds) ->
                        let d_rep = new_temp () in
                        let h = sub_body (rep_val (Var d) (Var d_rep)) hd_il in
                        let t = sub_body (rep_val (Var d) (Var d_rep)) t in
                        alpha_rec (h @ [IPhi (d_rep, ty, preds)]) t
                | ILabel l ->
                        let l_rep = new_label () in
                        let h = sub_body_label hd_il l l_rep in
                        let t = sub_body_label t l l_rep in
                        alpha_rec (h @ [ILabel l_rep]) t
                | _ -> alpha_rec (hd_il @ [i]) t
    in
    alpha_rec [] il

let analyze_block (il: inst list) : (label list) * (inst list) =
    let rec anal_rec (il: inst list) (body: inst list ) =
        match il with
        | [] -> ([], [])
        | i::t ->
                match i with
                | IBr l -> ([l], body @ [i])
                | ICondBr (_, l1, l2) -> ([l1; l2], body @ [i])
                | IRet _ -> ([], body @ [i])
                | _ -> anal_rec t (body @ [i])
    in
    anal_rec il []

let rec get_preds (il: inst list) (succlabel: label) =
    match il with
    | [] -> []
    | i::t ->
            match i with
            | ILabel l ->
                    let (succlabels, labelblock) = analyze_block t in
                    if List.mem succlabel succlabels then (l, labelblock)::(get_preds t succlabel)
                    else get_preds t succlabel
            | _ -> get_preds t succlabel

let fix_phi (f_args: (typ * string) list) (body: inst list) : inst list =
    let args = List.map (fun (_, v) -> Var (Local v)) f_args in
    let rec fix_rec (hd_il: inst list) (tl_il: inst list) (curlblopt: label option) =
        match tl_il with
        | [] -> hd_il
        | i::t ->
                match i with
                | ILabel l -> fix_rec (hd_il @ [i]) t (Some l)
                | IPhi (d, ty, preds) ->
                        (match curlblopt with
                        | Some curlbl ->
                                let hd_preds = get_preds hd_il curlbl in
                                let tl_preds = get_preds t curlbl in
                                let predsactual = hd_preds @ tl_preds in
                                let predsactual_lbls = List.map fst predsactual in
                                let preds =
                                    List.map
                                        (fun (predlbl, predvar) ->
                                            if List.mem predlbl predsactual_lbls then (predlbl, predvar)
                                            else
                                                if List.mem predvar args then
                                                    let pos_predsactual =
                                                        List.filter
                                                            (fun predactual ->
                                                                let defs = List.concat (List.map def_inst (snd predactual)) in
                                                                let defs_value = List.map (fun def -> Var def) defs in
                                                                not (List.exists (fun pred -> List.mem (snd pred) defs_value) preds))
                                                        predsactual
                                                    in
                                                    if List.length pos_predsactual <> 1 then failwith "Expected 1 possible label to replace in phi function"
                                                    else (fst (List.nth pos_predsactual 0), predvar)
                                                else
                                                    let lbl_rep =
                                                        try
                                                            fst (List.find
                                                                (fun predactual ->
                                                                    let defs = List.concat (List.map def_inst (snd predactual)) in
                                                                    let defs_value = List.map (fun def -> Var def) defs in
                                                                    List.mem predvar defs_value)
                                                                predsactual)
                                                        with Not_found -> predlbl
                                                    in (lbl_rep, predvar))
                                    preds
                                in fix_rec (hd_il @ [IPhi (d, ty, preds)]) t curlblopt
                        | None -> failwith "Cannot find label of the current block")
                | _ -> fix_rec (hd_il @ [i]) t curlblopt
    in
    fix_rec [] body None

let inline_return_inst (body: inst list) (donelbl: label) =
    let rec inline_rec (il: inst list) (curlbl: label option) (body_rep: inst list) (phi_preds: (label * value) list) =
        match il with
        | [] -> (body_rep, phi_preds)
        | i::t ->
                match i with
                | ILabel l -> inline_rec t (Some l) (body_rep @ [i]) phi_preds
                | IRet (Some (ty, vv)) ->
                        let d_rep = new_temp () in
                        (match curlbl with
                        | Some l ->
                            inline_rec
                                t
                                curlbl
                                (body_rep @ [ISet (d_rep, ty, vv)] @ [IBr donelbl])
                                (phi_preds @ [(l, Var d_rep)])
                        | None -> failwith "Cannot find label of the current block")
                | _ -> inline_rec t curlbl (body_rep @ [i]) phi_preds
    in
    inline_rec body None [] []

let inline_body (prog: func list) (f: func) : inst list =
    let rec inline_rec (body: inst list) =
        match body with
        | [] -> []
        | i::t ->
                match i with
                | ICall (d, ty, Global fname, args) ->
                        (try
                            let f_rep = List.find (fun f -> f.f_name = fname) prog in
                            if not (can_inline f_rep) then i::(inline_rec t)
                            else
                                let argmap = List.combine f_rep.f_args args in
                                let body_rep =
                                    List.fold_left
                                        (fun body ((_, arg), (_, subarg_val)) ->
                                            sub_body
                                                (fun vv ->
                                                    match vv with
                                                    | Var (Local v) -> if v = arg then subarg_val else vv
                                                    | _ -> vv)
                                                body)
                                        (Array.to_list f_rep.f_body)
                                        argmap
                                in
                                let body_rep_alpha = alpha_conversion body_rep in
                                let done_lbl = new_label () in
                                (* Replace return instruction to set value to destination *)
                                let (body_rep_return, dest_phi_preds) =
                                    inline_return_inst body_rep_alpha done_lbl
                                in
                                match body_rep_return with
                                | [] -> inline_rec t
                                | (ILabel l)::_ ->
                                        if List.length dest_phi_preds = 1 then
                                            let pred = List.nth dest_phi_preds 0 in
                                            [IBr l] @ (body_rep_return) @ [ILabel done_lbl] @ [ISet (d, ty, snd pred)] @ (inline_rec t)
                                        else
                                            [IBr l] @ (body_rep_return) @ [ILabel done_lbl] @ [IPhi (d, ty, dest_phi_preds)] @ (inline_rec t)
                                | _ -> failwith "Expected ILabel instruction"
                        with Not_found -> i::(inline_rec t))
                | _ -> i::(inline_rec t)
    in
    inline_rec (Array.to_list f.f_body)
    |> fix_phi (f.f_args)

let function_inline (prog: func list) =
    List.map
        (fun f ->
            make_func
                f.f_name
                f.f_ret
                f.f_args
                (inline_body prog f))
        prog


(* Unreachable Code Elimination *)
let rec use_labels (il: inst list) : label list  =
    match il with
    | [] -> []
    | i::t ->
            match i with
            | IBr l -> [l] @ (use_labels t)
            | ICondBr (_, l1, l2) -> [l1; l2] @ (use_labels t)
            | _ -> use_labels t

let print_value (vv: value) =
    match vv with
    | Var (Local v) | Var (Global v) -> print_endline v
    | Const n -> print_int n

let rec replace_label_in_phi (il: inst list) (lbl: label) (nlbl: label option) : inst list =
    match il with
    | [] -> []
    | i::t ->
            match i with
            | IPhi (d, ty, preds) ->
                    let preds =
                        match nlbl with
                        | Some nl -> List.map (fun (l, vv) -> if l = lbl then (nl, vv) else (l, vv)) preds
                        | None -> List.remove_assoc lbl preds
                    in
                    if List.length preds = 1 then
                        let (l, vv) = List.nth preds 0 in
                        (ISet (d, ty, vv))::(replace_label_in_phi t lbl nlbl)
                    else
                        (IPhi (d, ty, preds))::(replace_label_in_phi t lbl nlbl)
            | _ -> i::(replace_label_in_phi t lbl nlbl)

let rec remove_label_block (il: inst list) : inst list =
    match il with
    | [] -> []
    | i::t ->
            match i with
            | IBr _ | ICondBr _ | IRet _ -> t
            | _ -> remove_label_block t

let elim_unreachable (il: inst list) : inst list =
    let use = use_labels il in
    let rec elim_rec (hd_il: inst list) (tl_il: inst list) =
        match tl_il with
        | [] -> hd_il
        | i::t ->
                match i with
                | ILabel l ->
                        if not (List.mem l use) then
                            let h = replace_label_in_phi hd_il l None in
                            let t = remove_label_block t in
                            let t = replace_label_in_phi t l None in
                            elim_rec h t
                        else elim_rec (hd_il @ [i]) t
                | _ -> elim_rec (hd_il @ [i]) t
    in
    (* Skip the label of function body *)
    match il with
    | [] -> []
    | (ILabel _ as i)::t -> elim_rec [i] t
    | _ -> failwith "Expected ILabel instruction"


(* Merge code block *)
let rec label_block (il: inst list) (lbl: label) : inst list =
    let rec collect (il: inst list) =
        match il with
        | [] -> []
        | i::t ->
                match i with
                | IBr _ | ICondBr _ | IRet _ -> [i]
                | _ -> i::(collect t)
    in
    match il with
    | [] -> []
    | (ILabel l)::t ->
            if l <> lbl then label_block t lbl
            else collect t
    | _::t -> label_block t lbl

let merge_blocks (il: inst list) : inst list =
    let use = use_labels il in
    let rec merge_rec (hd_il: inst list) (tl_il: inst list) (curlbl: label) =
        match tl_il with
        | [] -> hd_il
        | i::t ->
                match i with
                | ILabel l -> merge_rec (hd_il @ [i]) t l
                | IBr l ->
                        let count_uses =
                            List.fold_left
                                (fun acc lbl -> if l = lbl then acc + 1 else acc)
                                0
                                use
                        in
                        if count_uses = 1 then
                            (* get code block of the label and move it to the position of IBr *)
                            let block = (label_block hd_il l) @ (label_block tl_il l) in
                            (* Replace label in phi function in previous instructions *)
                            let h = replace_label_in_phi hd_il l (Some curlbl) in
                            (* Replace label in phi function in next instructions *)
                            let t = replace_label_in_phi t l (Some curlbl) in
                            merge_rec (h @ block) t curlbl
                        else merge_rec (hd_il @ [i]) t curlbl
                | _ -> merge_rec (hd_il @ [i]) t curlbl
    in
    (* Skip the label of function body *)
    match il with
    | [] -> []
    | (ILabel l as i)::t -> merge_rec [i] t l
    | _ -> failwith "Expected ILabel instruction"


(* Optimization *)
let opt_body ts fname body =
    let rec opt_body_rec body =
        let old_body = body in
        let body =
            body
            |> propagation
            |> cse fname
            |> constant_folding
            |> elim_dead
            |> elim_unreachable
            |> merge_blocks
        in
        if body <> old_body then opt_body_rec body
        else body
    in opt_body_rec body

let opt_func ts f =
  make_func
    f.f_name
    f.f_ret
    f.f_args
    (opt_body ts f.f_name (Array.to_list f.f_body))

let opt ts prog =
    (*let prog = List.map (opt_func ts) prog in*)
    let rec opt_rec prog =
        let old_prog = prog in
        let prog =
            prog
            |> List.map (opt_func ts)
            |> function_inline
        in
        if prog <> old_prog then opt_rec prog
        else prog
    in opt_rec prog
