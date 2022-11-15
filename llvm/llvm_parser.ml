
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | ZEXT
    | XOR
    | TYP
    | TVOID
    | TSTRUCT of (
# 51 "llvm_parser.mly"
       (string)
# 15 "llvm_parser.ml"
  )
    | TRUNC
    | TO
    | TINT of (
# 63 "llvm_parser.mly"
       (int)
# 22 "llvm_parser.ml"
  )
    | SUB
    | STORE
    | STAR
    | RSQ
    | RPAREN
    | RET
    | RBRACE
    | PTRTOINT
    | PHI
    | OR
    | NULL
    | MUL
    | LVAR of (
# 49 "llvm_parser.mly"
       (string)
# 39 "llvm_parser.ml"
  )
    | LSQ
    | LPAREN
    | LOAD
    | LBRACE
    | LABEL
    | KEYWORD of (
# 48 "llvm_parser.mly"
       (string)
# 49 "llvm_parser.ml"
  )
    | INTTOPTR
    | ICMP
    | GVAR of (
# 50 "llvm_parser.mly"
       (string)
# 56 "llvm_parser.ml"
  )
    | GETELEMENTPTR
    | EQUAL
    | EOF
    | DIV
    | DEFINE
    | DECLARE
    | CONST of (
# 52 "llvm_parser.mly"
       (int)
# 67 "llvm_parser.ml"
  )
    | COMMA
    | COLON
    | CALL
    | BR
    | BITCAST
    | AND
    | ALLOCA
    | ADD
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState162
  | MenhirState160
  | MenhirState157
  | MenhirState155
  | MenhirState153
  | MenhirState151
  | MenhirState147
  | MenhirState145
  | MenhirState144
  | MenhirState143
  | MenhirState142
  | MenhirState140
  | MenhirState139
  | MenhirState136
  | MenhirState135
  | MenhirState132
  | MenhirState130
  | MenhirState126
  | MenhirState121
  | MenhirState119
  | MenhirState118
  | MenhirState115
  | MenhirState111
  | MenhirState110
  | MenhirState109
  | MenhirState108
  | MenhirState106
  | MenhirState104
  | MenhirState103
  | MenhirState99
  | MenhirState98
  | MenhirState97
  | MenhirState96
  | MenhirState91
  | MenhirState85
  | MenhirState84
  | MenhirState83
  | MenhirState68
  | MenhirState65
  | MenhirState58
  | MenhirState57
  | MenhirState53
  | MenhirState52
  | MenhirState50
  | MenhirState49
  | MenhirState47
  | MenhirState43
  | MenhirState34
  | MenhirState33
  | MenhirState30
  | MenhirState29
  | MenhirState26
  | MenhirState24
  | MenhirState20
  | MenhirState17
  | MenhirState14
  | MenhirState5
  | MenhirState0

# 1 "llvm_parser.mly"
  
    open Llvm_ast
    open Lexing
    open Llvm_lexer

    exception SyntaxError

    let syn_err = Llvm_ast.syn_err SyntaxError

    let mk_args loc ops =
      List.map
	(function (t, Var (Local v)) -> (t, v)
		| (_, _) ->
		   syn_err "Argument must be local var" loc
	)
        ops

    let bop_of_s loc =
      function
      | "add" -> BAdd
      | "sub" -> BSub
      | "mul" -> BMul
      | "sdiv" -> BDiv
      | "and" -> BAnd
      | "or" -> BOr
      | "xor" -> BXor
      | _ -> syn_err "Invalid opcode" loc

    let cmp_of_s loc =
      function
      | "eq" -> CEq
      | "ne" -> CNe
      | "sgt" -> CSGt
      | "sge" -> CSGe
      | "slt" -> CSLt
      | "sle" -> CSLe
      | _ -> syn_err "Invalid comparison" loc

    let cast_of_s loc =
      function
      | "bitcast" -> CBitcast
      | "zext" -> CZext
      | "ptrtoint" -> CPtrtoint
      | "inttoptr" -> CInttoptr
      | _ -> syn_err "Invalid opcode" loc

# 199 "llvm_parser.ml"

let rec _menhir_error42 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 204 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_error146 : _menhir_env -> (((('ttv_tail * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 213 "llvm_parser.ml"
) * Lexing.position)) * (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 217 "llvm_parser.ml"
)) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 221 "llvm_parser.ml"
)) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 225 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_error141 : _menhir_env -> (((('ttv_tail * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 234 "llvm_parser.ml"
) * Lexing.position)) * (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 238 "llvm_parser.ml"
)) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 242 "llvm_parser.ml"
)) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 246 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_error105 : _menhir_env -> ((((('ttv_tail * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 255 "llvm_parser.ml"
) * Lexing.position))) * (
# 48 "llvm_parser.mly"
       (string)
# 259 "llvm_parser.ml"
)) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 263 "llvm_parser.ml"
)) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 267 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_error86 : _menhir_env -> ('ttv_tail * _menhir_state) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 276 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_error69 : _menhir_env -> (('ttv_tail * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 285 "llvm_parser.ml"
)) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 289 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_error51 : _menhir_env -> (('ttv_tail * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 298 "llvm_parser.ml"
)) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 302 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce38 : _menhir_env -> ('ttv_tail * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 311 "llvm_parser.ml"
)) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 315 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, (t : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 321 "llvm_parser.ml"
    ))), _endpos_v_, _, (v : (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 325 "llvm_parser.ml"
    ))) = _menhir_stack in
    let _endpos = _endpos_v_ in
    let _v : (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 331 "llvm_parser.ml"
    ) = 
# 192 "llvm_parser.mly"
                       ( (t, v) )
# 335 "llvm_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv533) = _menhir_stack in
    let (_endpos : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 344 "llvm_parser.ml"
    )) = _v in
    ((let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState121 | MenhirState43 | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv527 * Lexing.position * _menhir_state * (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 353 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error42 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | COMMA ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : 'freshtv525 * Lexing.position * _menhir_state * (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 365 "llvm_parser.ml"
              )) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | TINT _v ->
                  _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
              | TSTRUCT _v ->
                  _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
              | TVOID ->
                  _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState43
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43) : 'freshtv526)
          | RPAREN ->
              _menhir_reduce39 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error42 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv528)
    | MenhirState115 | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv531 * Lexing.position * _menhir_state * (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 391 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error114 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | COMMA ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : 'freshtv529 * Lexing.position * _menhir_state * (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 403 "llvm_parser.ml"
              )) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | TINT _v ->
                  _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
              | TSTRUCT _v ->
                  _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
              | TVOID ->
                  _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState115
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115) : 'freshtv530)
          | BR | GVAR _ | KEYWORD _ | LVAR _ | RBRACE | RET | STORE ->
              _menhir_reduce39 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error114 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv532)
    | _ ->
        _menhir_fail ()) : 'freshtv534)

and _menhir_error120 : _menhir_env -> (((('ttv_tail * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 430 "llvm_parser.ml"
) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 434 "llvm_parser.ml"
)) * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 438 "llvm_parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_cast : _menhir_env -> 'ttv_tail -> (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 447 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv523 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 455 "llvm_parser.ml"
    ) * Lexing.position)) * (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 459 "llvm_parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TINT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _v
    | TSTRUCT _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _v
    | TVOID ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState139) : 'freshtv524)

and _menhir_run127 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce48 _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run128 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 51 "llvm_parser.mly"
       (string)
# 483 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v

and _menhir_run129 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 63 "llvm_parser.mly"
       (int)
# 492 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v

and _menhir_goto_binop : _menhir_env -> 'ttv_tail -> (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 501 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv521 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 509 "llvm_parser.ml"
    ) * Lexing.position)) * (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 513 "llvm_parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TINT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _v
    | TSTRUCT _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _v
    | TVOID ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState144
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144) : 'freshtv522)

and _menhir_error76 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 532 "llvm_parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce64 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 541 "llvm_parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos_v_, _menhir_s, (v : (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 547 "llvm_parser.ml"
    )), _startpos_v_) = _menhir_stack in
    let _endpos = _endpos_v_ in
    let _v : (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 553 "llvm_parser.ml"
    ) = 
# 186 "llvm_parser.mly"
              ( Var v )
# 557 "llvm_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _endpos _menhir_s _v

and _menhir_goto_value : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 564 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv439 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 574 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 578 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        (_menhir_reduce38 _menhir_env (Obj.magic _menhir_stack) : 'freshtv440)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv443 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 586 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 590 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error51 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | COMMA ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (('freshtv441 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 602 "llvm_parser.ml"
              )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 606 "llvm_parser.ml"
              )) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | TINT _v ->
                  _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
              | TSTRUCT _v ->
                  _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
              | TVOID ->
                  _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState52
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52) : 'freshtv442)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error51 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv444)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv447 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 630 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 634 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv445 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 640 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 644 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (t : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 649 "llvm_parser.ml"
        ))), _endpos_v_, _, (v : (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 653 "llvm_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 658 "llvm_parser.ml"
        ) = 
# 144 "llvm_parser.mly"
    ( IRet (Some (t, v)) )
# 662 "llvm_parser.ml"
         in
        _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv446)) : 'freshtv448)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv473 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 670 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 674 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error69 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | COMMA ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (('freshtv471 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 686 "llvm_parser.ml"
              )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 690 "llvm_parser.ml"
              )) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | LABEL ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : ((('freshtv467 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 700 "llvm_parser.ml"
                  )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 704 "llvm_parser.ml"
                  ))) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let _tok = _menhir_env._menhir_token in
                  match _tok with
                  | LVAR _v ->
                      let (_menhir_env : _menhir_env) = _menhir_env in
                      let (_menhir_stack : (((('freshtv463 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 714 "llvm_parser.ml"
                      )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 718 "llvm_parser.ml"
                      )))) = Obj.magic _menhir_stack in
                      let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                      let (_v : (
# 49 "llvm_parser.mly"
       (string)
# 724 "llvm_parser.ml"
                      )) = _v in
                      let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
                      ((let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
                      let _menhir_env = _menhir_discard _menhir_env in
                      let _tok = _menhir_env._menhir_token in
                      match _tok with
                      | COMMA ->
                          let (_menhir_env : _menhir_env) = _menhir_env in
                          let (_menhir_stack : ((((('freshtv459 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 736 "llvm_parser.ml"
                          )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 740 "llvm_parser.ml"
                          )))) * Lexing.position * (
# 49 "llvm_parser.mly"
       (string)
# 744 "llvm_parser.ml"
                          ) * Lexing.position) = Obj.magic _menhir_stack in
                          ((let _menhir_env = _menhir_discard _menhir_env in
                          let _tok = _menhir_env._menhir_token in
                          match _tok with
                          | LABEL ->
                              let (_menhir_env : _menhir_env) = _menhir_env in
                              let (_menhir_stack : (((((('freshtv455 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 754 "llvm_parser.ml"
                              )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 758 "llvm_parser.ml"
                              )))) * Lexing.position * (
# 49 "llvm_parser.mly"
       (string)
# 762 "llvm_parser.ml"
                              ) * Lexing.position)) = Obj.magic _menhir_stack in
                              ((let _menhir_env = _menhir_discard _menhir_env in
                              let _tok = _menhir_env._menhir_token in
                              match _tok with
                              | LVAR _v ->
                                  let (_menhir_env : _menhir_env) = _menhir_env in
                                  let (_menhir_stack : ((((((('freshtv451 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 772 "llvm_parser.ml"
                                  )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 776 "llvm_parser.ml"
                                  )))) * Lexing.position * (
# 49 "llvm_parser.mly"
       (string)
# 780 "llvm_parser.ml"
                                  ) * Lexing.position))) = Obj.magic _menhir_stack in
                                  let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                                  let (_v : (
# 49 "llvm_parser.mly"
       (string)
# 786 "llvm_parser.ml"
                                  )) = _v in
                                  let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
                                  ((let _menhir_env = _menhir_discard _menhir_env in
                                  let (_menhir_env : _menhir_env) = _menhir_env in
                                  let (_menhir_stack : ((((((('freshtv449 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 794 "llvm_parser.ml"
                                  )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 798 "llvm_parser.ml"
                                  )))) * Lexing.position * (
# 49 "llvm_parser.mly"
       (string)
# 802 "llvm_parser.ml"
                                  ) * Lexing.position))) = Obj.magic _menhir_stack in
                                  let (_endpos_l2_ : Lexing.position) = _endpos in
                                  let ((l2 : (
# 49 "llvm_parser.mly"
       (string)
# 808 "llvm_parser.ml"
                                  )) : (
# 49 "llvm_parser.mly"
       (string)
# 812 "llvm_parser.ml"
                                  )) = _v in
                                  let (_startpos_l2_ : Lexing.position) = _startpos in
                                  ((let ((((_menhir_stack, _menhir_s), _, _), _endpos_v_, _, (v : (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 818 "llvm_parser.ml"
                                  ))), _endpos_l1_, (l1 : (
# 49 "llvm_parser.mly"
       (string)
# 822 "llvm_parser.ml"
                                  )), _startpos_l1_) = _menhir_stack in
                                  let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 827 "llvm_parser.ml"
                                  ) = 
# 141 "llvm_parser.mly"
    ( ICondBr (v, l1, l2)
    )
# 832 "llvm_parser.ml"
                                   in
                                  _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv450)) : 'freshtv452)
                              | _ ->
                                  assert (not _menhir_env._menhir_error);
                                  _menhir_env._menhir_error <- true;
                                  let (_menhir_env : _menhir_env) = _menhir_env in
                                  let (_menhir_stack : ((((((('freshtv453 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 842 "llvm_parser.ml"
                                  )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 846 "llvm_parser.ml"
                                  )))) * Lexing.position * (
# 49 "llvm_parser.mly"
       (string)
# 850 "llvm_parser.ml"
                                  ) * Lexing.position))) = Obj.magic _menhir_stack in
                                  ((let ((_menhir_stack, _, _menhir_s, _), _, _, _) = _menhir_stack in
                                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv454)) : 'freshtv456)
                          | _ ->
                              assert (not _menhir_env._menhir_error);
                              _menhir_env._menhir_error <- true;
                              let (_menhir_env : _menhir_env) = _menhir_env in
                              let (_menhir_stack : (((((('freshtv457 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 861 "llvm_parser.ml"
                              )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 865 "llvm_parser.ml"
                              )))) * Lexing.position * (
# 49 "llvm_parser.mly"
       (string)
# 869 "llvm_parser.ml"
                              ) * Lexing.position)) = Obj.magic _menhir_stack in
                              ((let ((_menhir_stack, _, _menhir_s, _), _, _, _) = _menhir_stack in
                              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv458)) : 'freshtv460)
                      | _ ->
                          assert (not _menhir_env._menhir_error);
                          _menhir_env._menhir_error <- true;
                          let (_menhir_env : _menhir_env) = _menhir_env in
                          let (_menhir_stack : ((((('freshtv461 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 880 "llvm_parser.ml"
                          )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 884 "llvm_parser.ml"
                          )))) * Lexing.position * (
# 49 "llvm_parser.mly"
       (string)
# 888 "llvm_parser.ml"
                          ) * Lexing.position) = Obj.magic _menhir_stack in
                          ((let ((_menhir_stack, _, _menhir_s, _), _, _, _) = _menhir_stack in
                          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv462)) : 'freshtv464)
                  | _ ->
                      assert (not _menhir_env._menhir_error);
                      _menhir_env._menhir_error <- true;
                      let (_menhir_env : _menhir_env) = _menhir_env in
                      let (_menhir_stack : (((('freshtv465 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 899 "llvm_parser.ml"
                      )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 903 "llvm_parser.ml"
                      )))) = Obj.magic _menhir_stack in
                      ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
                      _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv466)) : 'freshtv468)
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : ((('freshtv469 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 914 "llvm_parser.ml"
                  )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 918 "llvm_parser.ml"
                  ))) = Obj.magic _menhir_stack in
                  ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv470)) : 'freshtv472)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error69 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv474)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv493 * _menhir_state) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 931 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error86 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | COMMA ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ('freshtv491 * _menhir_state) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 943 "llvm_parser.ml"
              )) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | LVAR _v ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : (('freshtv487 * _menhir_state) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 953 "llvm_parser.ml"
                  ))) = Obj.magic _menhir_stack in
                  let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                  let (_v : (
# 49 "llvm_parser.mly"
       (string)
# 959 "llvm_parser.ml"
                  )) = _v in
                  let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
                  ((let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
                  let _menhir_env = _menhir_discard _menhir_env in
                  let _tok = _menhir_env._menhir_token in
                  match _tok with
                  | RSQ ->
                      let (_menhir_env : _menhir_env) = _menhir_env in
                      let (_menhir_stack : ((('freshtv483 * _menhir_state) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 971 "llvm_parser.ml"
                      ))) * Lexing.position * (
# 49 "llvm_parser.mly"
       (string)
# 975 "llvm_parser.ml"
                      ) * Lexing.position) = Obj.magic _menhir_stack in
                      ((let _menhir_env = _menhir_discard _menhir_env in
                      let (_menhir_env : _menhir_env) = _menhir_env in
                      let (_menhir_stack : ((('freshtv481 * _menhir_state) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 982 "llvm_parser.ml"
                      ))) * Lexing.position * (
# 49 "llvm_parser.mly"
       (string)
# 986 "llvm_parser.ml"
                      ) * Lexing.position) = Obj.magic _menhir_stack in
                      ((let (((_menhir_stack, _menhir_s), _endpos_v_, _, (v : (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 991 "llvm_parser.ml"
                      ))), _endpos_l_, (l : (
# 49 "llvm_parser.mly"
       (string)
# 995 "llvm_parser.ml"
                      )), _startpos_l_) = _menhir_stack in
                      let _v : (
# 80 "llvm_parser.mly"
      (Llvm_ast.label * Llvm_ast.value)
# 1000 "llvm_parser.ml"
                      ) = 
# 207 "llvm_parser.mly"
                                     ( (l, v) )
# 1004 "llvm_parser.ml"
                       in
                      let (_menhir_env : _menhir_env) = _menhir_env in
                      let (_menhir_stack : 'freshtv479) = _menhir_stack in
                      let (_menhir_s : _menhir_state) = _menhir_s in
                      let (_v : (
# 80 "llvm_parser.mly"
      (Llvm_ast.label * Llvm_ast.value)
# 1012 "llvm_parser.ml"
                      )) = _v in
                      ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
                      let (_menhir_env : _menhir_env) = _menhir_env in
                      let (_menhir_stack : 'freshtv477 * _menhir_state * (
# 80 "llvm_parser.mly"
      (Llvm_ast.label * Llvm_ast.value)
# 1019 "llvm_parser.ml"
                      )) = Obj.magic _menhir_stack in
                      ((if _menhir_env._menhir_error then
                        _menhir_error90 _menhir_env (Obj.magic _menhir_stack)
                      else
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | COMMA ->
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : 'freshtv475 * _menhir_state * (
# 80 "llvm_parser.mly"
      (Llvm_ast.label * Llvm_ast.value)
# 1031 "llvm_parser.ml"
                            )) = Obj.magic _menhir_stack in
                            ((let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            match _tok with
                            | LSQ ->
                                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState91
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91) : 'freshtv476)
                        | BR | GVAR _ | KEYWORD _ | LVAR _ | RBRACE | RET | STORE ->
                            _menhir_reduce8 _menhir_env (Obj.magic _menhir_stack)
                        | _ ->
                            (assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            _menhir_error90 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv478)) : 'freshtv480)) : 'freshtv482)) : 'freshtv484)
                  | _ ->
                      assert (not _menhir_env._menhir_error);
                      _menhir_env._menhir_error <- true;
                      let (_menhir_env : _menhir_env) = _menhir_env in
                      let (_menhir_stack : ((('freshtv485 * _menhir_state) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1055 "llvm_parser.ml"
                      ))) * Lexing.position * (
# 49 "llvm_parser.mly"
       (string)
# 1059 "llvm_parser.ml"
                      ) * Lexing.position) = Obj.magic _menhir_stack in
                      ((let ((_menhir_stack, _, _menhir_s, _), _, _, _) = _menhir_stack in
                      _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv486)) : 'freshtv488)
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : (('freshtv489 * _menhir_state) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1070 "llvm_parser.ml"
                  ))) = Obj.magic _menhir_stack in
                  ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv490)) : 'freshtv492)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error86 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv494)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv497 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1083 "llvm_parser.ml"
        ) * Lexing.position))) * (
# 48 "llvm_parser.mly"
       (string)
# 1087 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1091 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1095 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error105 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | COMMA ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ((((('freshtv495 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1107 "llvm_parser.ml"
              ) * Lexing.position))) * (
# 48 "llvm_parser.mly"
       (string)
# 1111 "llvm_parser.ml"
              )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1115 "llvm_parser.ml"
              )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1119 "llvm_parser.ml"
              )) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | CONST _v ->
                  _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState106 _v
              | GVAR _v ->
                  _menhir_run55 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState106 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | LVAR _v ->
                  _menhir_run54 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState106 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | NULL ->
                  _menhir_run59 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState106
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106) : 'freshtv496)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error105 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv498)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv501 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1145 "llvm_parser.ml"
        ) * Lexing.position))) * (
# 48 "llvm_parser.mly"
       (string)
# 1149 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1153 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1157 "llvm_parser.ml"
        ))) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1161 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv499 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1167 "llvm_parser.ml"
        ) * Lexing.position))) * (
# 48 "llvm_parser.mly"
       (string)
# 1171 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1175 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1179 "llvm_parser.ml"
        ))) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1183 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _endpos_d_, _menhir_s, (d : (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1188 "llvm_parser.ml"
        )), _startpos_d_), (c : (
# 48 "llvm_parser.mly"
       (string)
# 1192 "llvm_parser.ml"
        ))), _, (t : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1196 "llvm_parser.ml"
        ))), _endpos_v1_, _, (v1 : (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1200 "llvm_parser.ml"
        ))), _endpos_v2_, _, (v2 : (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1204 "llvm_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 1209 "llvm_parser.ml"
        ) = let _endpos = _endpos_v2_ in
        let _startpos = _startpos_d_ in
        let _loc = (_startpos, _endpos) in
        
# 147 "llvm_parser.mly"
    ( ICmp (d, cmp_of_s _loc c, t, v1, v2)
    )
# 1217 "llvm_parser.ml"
         in
        _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv500)) : 'freshtv502)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv503 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1225 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1229 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        (_menhir_reduce38 _menhir_env (Obj.magic _menhir_stack) : 'freshtv504)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv507 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1237 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1241 "llvm_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1245 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1249 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv505 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1255 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1259 "llvm_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1263 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1267 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _endpos_d_, _menhir_s, (d : (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1272 "llvm_parser.ml"
        )), _startpos_d_), _, (t : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1276 "llvm_parser.ml"
        ))), _), _, _), _endpos_v_, _, (v : (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1280 "llvm_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 1285 "llvm_parser.ml"
        ) = let _endpos = _endpos_v_ in
        let _startpos = _startpos_d_ in
        let _loc = (_startpos, _endpos) in
        
# 163 "llvm_parser.mly"
    ( match v with
      | Const n -> IAlloca (d, t, n)
      | _ -> syn_err "Invalid instruction" _loc
    )
# 1295 "llvm_parser.ml"
         in
        _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv506)) : 'freshtv508)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv511 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1303 "llvm_parser.ml"
        ) * Lexing.position)) * (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 1307 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1311 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1315 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error141 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | TO ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (((('freshtv509 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1327 "llvm_parser.ml"
              ) * Lexing.position)) * (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 1331 "llvm_parser.ml"
              )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1335 "llvm_parser.ml"
              )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1339 "llvm_parser.ml"
              )) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | TINT _v ->
                  _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _v
              | TSTRUCT _v ->
                  _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _v
              | TVOID ->
                  _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState142
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState142) : 'freshtv510)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error141 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv512)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv515 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1363 "llvm_parser.ml"
        ) * Lexing.position)) * (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 1367 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1371 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1375 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error146 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | COMMA ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (((('freshtv513 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1387 "llvm_parser.ml"
              ) * Lexing.position)) * (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 1391 "llvm_parser.ml"
              )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1395 "llvm_parser.ml"
              )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1399 "llvm_parser.ml"
              )) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | CONST _v ->
                  _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _v
              | GVAR _v ->
                  _menhir_run55 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | LVAR _v ->
                  _menhir_run54 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | NULL ->
                  _menhir_run59 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState147) : 'freshtv514)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error146 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv516)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv519 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1425 "llvm_parser.ml"
        ) * Lexing.position)) * (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 1429 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1433 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1437 "llvm_parser.ml"
        ))) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1441 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv517 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1447 "llvm_parser.ml"
        ) * Lexing.position)) * (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 1451 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1455 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1459 "llvm_parser.ml"
        ))) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1463 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _endpos_d_, _menhir_s, (d : (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1468 "llvm_parser.ml"
        )), _startpos_d_), (b : (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 1472 "llvm_parser.ml"
        ))), _, (t : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1476 "llvm_parser.ml"
        ))), _endpos_v1_, _, (v1 : (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1480 "llvm_parser.ml"
        ))), _endpos_v2_, _, (v2 : (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1484 "llvm_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 1489 "llvm_parser.ml"
        ) = 
# 134 "llvm_parser.mly"
    ( IBinop (d, b, t, v1, v2)
    )
# 1494 "llvm_parser.ml"
         in
        _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv518)) : 'freshtv520)
    | _ ->
        _menhir_fail ()

and _menhir_goto_var : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1503 "llvm_parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState145 | MenhirState140 | MenhirState104 | MenhirState85 | MenhirState68 | MenhirState50 | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv353 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1513 "llvm_parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) : 'freshtv354)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv357 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1521 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1525 "llvm_parser.ml"
        ))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1529 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1533 "llvm_parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv355 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1539 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1543 "llvm_parser.ml"
        ))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1547 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1551 "llvm_parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), _, (t : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1556 "llvm_parser.ml"
        ))), _endpos_va_, _, (va : (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 1560 "llvm_parser.ml"
        ))), _, _), _endpos_vr_, _, (vr : (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1564 "llvm_parser.ml"
        )), _startpos_vr_) = _menhir_stack in
        let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 1569 "llvm_parser.ml"
        ) = 
# 137 "llvm_parser.mly"
    ( IStore (t, va, vr)
    )
# 1574 "llvm_parser.ml"
         in
        _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv356)) : 'freshtv358)
    | MenhirState147 | MenhirState136 | MenhirState111 | MenhirState106 | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv359 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1582 "llvm_parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) : 'freshtv360)
    | MenhirState151 | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv429 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1590 "llvm_parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error76 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | EQUAL ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : 'freshtv427 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1602 "llvm_parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | ADD ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv363) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv361) = Obj.magic _menhir_stack in
                  ((let _v : (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 1616 "llvm_parser.ml"
                  ) = 
# 114 "llvm_parser.mly"
        ( BAdd)
# 1620 "llvm_parser.ml"
                   in
                  _menhir_goto_binop _menhir_env _menhir_stack _v) : 'freshtv362)) : 'freshtv364)
              | ALLOCA ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : ('freshtv365 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1628 "llvm_parser.ml"
                  ) * Lexing.position)) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let _tok = _menhir_env._menhir_token in
                  match _tok with
                  | TINT _v ->
                      _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
                  | TSTRUCT _v ->
                      _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
                  | TVOID ->
                      _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState126
                  | _ ->
                      assert (not _menhir_env._menhir_error);
                      _menhir_env._menhir_error <- true;
                      _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126) : 'freshtv366)
              | AND ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv369) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv367) = Obj.magic _menhir_stack in
                  ((let _v : (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 1652 "llvm_parser.ml"
                  ) = 
# 118 "llvm_parser.mly"
        ( BAnd )
# 1656 "llvm_parser.ml"
                   in
                  _menhir_goto_binop _menhir_env _menhir_stack _v) : 'freshtv368)) : 'freshtv370)
              | BITCAST ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv373) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv371) = Obj.magic _menhir_stack in
                  ((let _v : (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 1668 "llvm_parser.ml"
                  ) = 
# 124 "llvm_parser.mly"
            ( CBitcast )
# 1672 "llvm_parser.ml"
                   in
                  _menhir_goto_cast _menhir_env _menhir_stack _v) : 'freshtv372)) : 'freshtv374)
              | CALL ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : ('freshtv375 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1680 "llvm_parser.ml"
                  ) * Lexing.position)) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let _tok = _menhir_env._menhir_token in
                  match _tok with
                  | TINT _v ->
                      _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
                  | TSTRUCT _v ->
                      _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
                  | TVOID ->
                      _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState118
                  | _ ->
                      assert (not _menhir_env._menhir_error);
                      _menhir_env._menhir_error <- true;
                      _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118) : 'freshtv376)
              | DIV ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv379) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv377) = Obj.magic _menhir_stack in
                  ((let _v : (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 1704 "llvm_parser.ml"
                  ) = 
# 117 "llvm_parser.mly"
        ( BDiv )
# 1708 "llvm_parser.ml"
                   in
                  _menhir_goto_binop _menhir_env _menhir_stack _v) : 'freshtv378)) : 'freshtv380)
              | GETELEMENTPTR ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : ('freshtv381 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1716 "llvm_parser.ml"
                  ) * Lexing.position)) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let _tok = _menhir_env._menhir_token in
                  match _tok with
                  | TINT _v ->
                      _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
                  | TSTRUCT _v ->
                      _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
                  | TVOID ->
                      _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState108
                  | _ ->
                      assert (not _menhir_env._menhir_error);
                      _menhir_env._menhir_error <- true;
                      _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108) : 'freshtv382)
              | ICMP ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : ('freshtv387 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1736 "llvm_parser.ml"
                  ) * Lexing.position)) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let _tok = _menhir_env._menhir_token in
                  match _tok with
                  | KEYWORD _v ->
                      let (_menhir_env : _menhir_env) = _menhir_env in
                      let (_menhir_stack : (('freshtv383 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1746 "llvm_parser.ml"
                      ) * Lexing.position))) = Obj.magic _menhir_stack in
                      let (_v : (
# 48 "llvm_parser.mly"
       (string)
# 1751 "llvm_parser.ml"
                      )) = _v in
                      ((let _menhir_stack = (_menhir_stack, _v) in
                      let _menhir_env = _menhir_discard _menhir_env in
                      let _tok = _menhir_env._menhir_token in
                      match _tok with
                      | TINT _v ->
                          _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
                      | TSTRUCT _v ->
                          _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
                      | TVOID ->
                          _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                      | _ ->
                          assert (not _menhir_env._menhir_error);
                          _menhir_env._menhir_error <- true;
                          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103) : 'freshtv384)
                  | _ ->
                      assert (not _menhir_env._menhir_error);
                      _menhir_env._menhir_error <- true;
                      let (_menhir_env : _menhir_env) = _menhir_env in
                      let (_menhir_stack : (('freshtv385 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1774 "llvm_parser.ml"
                      ) * Lexing.position))) = Obj.magic _menhir_stack in
                      ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                      _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv386)) : 'freshtv388)
              | INTTOPTR ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv391) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv389) = Obj.magic _menhir_stack in
                  ((let _v : (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 1787 "llvm_parser.ml"
                  ) = 
# 126 "llvm_parser.mly"
             ( CInttoptr )
# 1791 "llvm_parser.ml"
                   in
                  _menhir_goto_cast _menhir_env _menhir_stack _v) : 'freshtv390)) : 'freshtv392)
              | LOAD ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : ('freshtv393 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1799 "llvm_parser.ml"
                  ) * Lexing.position)) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let _tok = _menhir_env._menhir_token in
                  match _tok with
                  | TINT _v ->
                      _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
                  | TSTRUCT _v ->
                      _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
                  | TVOID ->
                      _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState96
                  | _ ->
                      assert (not _menhir_env._menhir_error);
                      _menhir_env._menhir_error <- true;
                      _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96) : 'freshtv394)
              | MUL ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv397) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv395) = Obj.magic _menhir_stack in
                  ((let _v : (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 1823 "llvm_parser.ml"
                  ) = 
# 116 "llvm_parser.mly"
        ( BMul )
# 1827 "llvm_parser.ml"
                   in
                  _menhir_goto_binop _menhir_env _menhir_stack _v) : 'freshtv396)) : 'freshtv398)
              | OR ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv401) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv399) = Obj.magic _menhir_stack in
                  ((let _v : (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 1839 "llvm_parser.ml"
                  ) = 
# 119 "llvm_parser.mly"
       ( BOr )
# 1843 "llvm_parser.ml"
                   in
                  _menhir_goto_binop _menhir_env _menhir_stack _v) : 'freshtv400)) : 'freshtv402)
              | PHI ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : ('freshtv403 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1851 "llvm_parser.ml"
                  ) * Lexing.position)) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let _tok = _menhir_env._menhir_token in
                  match _tok with
                  | TINT _v ->
                      _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
                  | TSTRUCT _v ->
                      _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
                  | TVOID ->
                      _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState83
                  | _ ->
                      assert (not _menhir_env._menhir_error);
                      _menhir_env._menhir_error <- true;
                      _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83) : 'freshtv404)
              | PTRTOINT ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv407) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv405) = Obj.magic _menhir_stack in
                  ((let _v : (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 1875 "llvm_parser.ml"
                  ) = 
# 125 "llvm_parser.mly"
             ( CPtrtoint )
# 1879 "llvm_parser.ml"
                   in
                  _menhir_goto_cast _menhir_env _menhir_stack _v) : 'freshtv406)) : 'freshtv408)
              | SUB ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv411) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv409) = Obj.magic _menhir_stack in
                  ((let _v : (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 1891 "llvm_parser.ml"
                  ) = 
# 115 "llvm_parser.mly"
        ( BSub )
# 1895 "llvm_parser.ml"
                   in
                  _menhir_goto_binop _menhir_env _menhir_stack _v) : 'freshtv410)) : 'freshtv412)
              | TRUNC ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv415) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv413) = Obj.magic _menhir_stack in
                  ((let _v : (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 1907 "llvm_parser.ml"
                  ) = 
# 128 "llvm_parser.mly"
          ( CTrunc )
# 1911 "llvm_parser.ml"
                   in
                  _menhir_goto_cast _menhir_env _menhir_stack _v) : 'freshtv414)) : 'freshtv416)
              | XOR ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv419) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv417) = Obj.magic _menhir_stack in
                  ((let _v : (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 1923 "llvm_parser.ml"
                  ) = 
# 120 "llvm_parser.mly"
        ( BXor )
# 1927 "llvm_parser.ml"
                   in
                  _menhir_goto_binop _menhir_env _menhir_stack _v) : 'freshtv418)) : 'freshtv420)
              | ZEXT ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv423) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : 'freshtv421) = Obj.magic _menhir_stack in
                  ((let _v : (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 1939 "llvm_parser.ml"
                  ) = 
# 127 "llvm_parser.mly"
         ( CZext )
# 1943 "llvm_parser.ml"
                   in
                  _menhir_goto_cast _menhir_env _menhir_stack _v) : 'freshtv422)) : 'freshtv424)
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : ('freshtv425 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1953 "llvm_parser.ml"
                  ) * Lexing.position)) = Obj.magic _menhir_stack in
                  ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv426)) : 'freshtv428)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error76 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv430)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv433 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1966 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1970 "llvm_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1974 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1978 "llvm_parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv431 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1984 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1988 "llvm_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 1992 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 1996 "llvm_parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _endpos_d_, _menhir_s, (d : (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2001 "llvm_parser.ml"
        )), _startpos_d_), _, (t : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2005 "llvm_parser.ml"
        ))), _), _, _), _endpos_v_, _, (v : (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2009 "llvm_parser.ml"
        )), _startpos_v_) = _menhir_stack in
        let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 2014 "llvm_parser.ml"
        ) = 
# 168 "llvm_parser.mly"
    ( ILoad (d, t, v)
    )
# 2019 "llvm_parser.ml"
         in
        _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv432)) : 'freshtv434)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv437 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2027 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2031 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2035 "llvm_parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error120 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | LPAREN ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (((('freshtv435 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2047 "llvm_parser.ml"
              ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2051 "llvm_parser.ml"
              )) * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2055 "llvm_parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | TINT _v ->
                  _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState121 _v
              | TSTRUCT _v ->
                  _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState121 _v
              | TVOID ->
                  _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState121
              | RPAREN ->
                  _menhir_reduce36 _menhir_env (Obj.magic _menhir_stack) MenhirState121
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState121) : 'freshtv436)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error120 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv438)
    | _ ->
        _menhir_fail ()

and _menhir_reduce66 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__1_ _menhir_s ->
    let _endpos = _endpos__1_ in
    let _v : (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 2085 "llvm_parser.ml"
    ) = 
# 188 "llvm_parser.mly"
              ( Const 0 )
# 2089 "llvm_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _endpos _menhir_s _v

and _menhir_reduce65 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 52 "llvm_parser.mly"
       (int)
# 2096 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos_n_ _menhir_s (n : (
# 52 "llvm_parser.mly"
       (int)
# 2101 "llvm_parser.ml"
  )) ->
    let _endpos = _endpos_n_ in
    let _v : (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 2107 "llvm_parser.ml"
    ) = 
# 187 "llvm_parser.mly"
              ( Const n )
# 2111 "llvm_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _endpos _menhir_s _v

and _menhir_reduce46 : _menhir_env -> (('ttv_tail * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2118 "llvm_parser.ml"
)) * _menhir_state) * _menhir_state * (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2122 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _menhir_s, (rt : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2128 "llvm_parser.ml"
    ))), _), _, (args : (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2132 "llvm_parser.ml"
    ))) = _menhir_stack in
    let _v : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2137 "llvm_parser.ml"
    ) = 
# 217 "llvm_parser.mly"
    ( TFunction (rt, args) )
# 2141 "llvm_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce47 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2148 "llvm_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _ ->
    let (_menhir_stack, _menhir_s, (t : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2154 "llvm_parser.ml"
    ))) = _menhir_stack in
    let _v : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2159 "llvm_parser.ml"
    ) = 
# 219 "llvm_parser.mly"
    ( TPointer t )
# 2163 "llvm_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce40 : _menhir_env -> ('ttv_tail * Lexing.position * _menhir_state * (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 2170 "llvm_parser.ml"
)) -> Lexing.position -> _menhir_state -> (
# 78 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2174 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos_os_ _ (os : (
# 78 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2179 "llvm_parser.ml"
  )) ->
    let (_menhir_stack, _endpos_o_, _menhir_s, (o : (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 2184 "llvm_parser.ml"
    ))) = _menhir_stack in
    let _endpos = _endpos_os_ in
    let _v : (
# 78 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2190 "llvm_parser.ml"
    ) = 
# 198 "llvm_parser.mly"
                        ( o::os )
# 2194 "llvm_parser.ml"
     in
    _menhir_goto_ops _menhir_env _menhir_stack _endpos _menhir_s _v

and _menhir_goto_maybeops : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2201 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv343 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2211 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 2215 "llvm_parser.ml"
        ) * Lexing.position)) * _menhir_state * (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2219 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv339 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2229 "llvm_parser.ml"
            )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 2233 "llvm_parser.ml"
            ) * Lexing.position)) * _menhir_state * (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2237 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LBRACE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv335 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2247 "llvm_parser.ml"
                )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 2251 "llvm_parser.ml"
                ) * Lexing.position)) * _menhir_state * (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2255 "llvm_parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | BR ->
                    _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                | GVAR _v ->
                    _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState47 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | KEYWORD _v ->
                    _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
                | LVAR _v ->
                    _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState47 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | RET ->
                    _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                | STORE ->
                    _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                | RBRACE ->
                    _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47) : 'freshtv336)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv337 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2285 "llvm_parser.ml"
                )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 2289 "llvm_parser.ml"
                ) * Lexing.position)) * _menhir_state * (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2293 "llvm_parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv338)) : 'freshtv340)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv341 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2304 "llvm_parser.ml"
            )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 2308 "llvm_parser.ml"
            ) * Lexing.position)) * _menhir_state * (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2312 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv342)) : 'freshtv344)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv351 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2321 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2325 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2329 "llvm_parser.ml"
        ) * Lexing.position)) * _menhir_state * (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2333 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv347 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2343 "llvm_parser.ml"
            ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2347 "llvm_parser.ml"
            )) * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2351 "llvm_parser.ml"
            ) * Lexing.position)) * _menhir_state * (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2355 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv345 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2362 "llvm_parser.ml"
            ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2366 "llvm_parser.ml"
            )) * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2370 "llvm_parser.ml"
            ) * Lexing.position)) * _menhir_state * (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2374 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _endpos_d_, _menhir_s, (d : (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2379 "llvm_parser.ml"
            )), _startpos_d_), _, (t : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2383 "llvm_parser.ml"
            ))), _endpos_f_, _, (f : (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2387 "llvm_parser.ml"
            )), _startpos_f_), _, (args : (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2391 "llvm_parser.ml"
            ))) = _menhir_stack in
            let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 2396 "llvm_parser.ml"
            ) = 
# 153 "llvm_parser.mly"
    ( ICall (d, t, f, args) )
# 2400 "llvm_parser.ml"
             in
            _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv346)) : 'freshtv348)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv349 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2410 "llvm_parser.ml"
            ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2414 "llvm_parser.ml"
            )) * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2418 "llvm_parser.ml"
            ) * Lexing.position)) * _menhir_state * (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2422 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv350)) : 'freshtv352)
    | _ ->
        _menhir_fail ()

and _menhir_goto_insts : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 75 "llvm_parser.mly"
      (Llvm_ast.inst list)
# 2432 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv329 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2442 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 2446 "llvm_parser.ml"
        ) * Lexing.position)) * _menhir_state * (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2450 "llvm_parser.ml"
        )))) * _menhir_state * (
# 75 "llvm_parser.mly"
      (Llvm_ast.inst list)
# 2454 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((('freshtv325 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2464 "llvm_parser.ml"
            )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 2468 "llvm_parser.ml"
            ) * Lexing.position)) * _menhir_state * (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2472 "llvm_parser.ml"
            )))) * _menhir_state * (
# 75 "llvm_parser.mly"
      (Llvm_ast.inst list)
# 2476 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((('freshtv323 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2484 "llvm_parser.ml"
            )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 2488 "llvm_parser.ml"
            ) * Lexing.position)) * _menhir_state * (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2492 "llvm_parser.ml"
            )))) * _menhir_state * (
# 75 "llvm_parser.mly"
      (Llvm_ast.inst list)
# 2496 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_endpos__9_ : Lexing.position) = _endpos in
            ((let (((((_menhir_stack, _menhir_s, _startpos__1_), _, (rt : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2502 "llvm_parser.ml"
            ))), _endpos_f_, _, (f : (
# 50 "llvm_parser.mly"
       (string)
# 2506 "llvm_parser.ml"
            )), _startpos_f_), _, (args : (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2510 "llvm_parser.ml"
            ))), _, (b : (
# 75 "llvm_parser.mly"
      (Llvm_ast.inst list)
# 2514 "llvm_parser.ml"
            ))) = _menhir_stack in
            let _v : (
# 73 "llvm_parser.mly"
      (Llvm_ast.func option)
# 2519 "llvm_parser.ml"
            ) = let _endpos = _endpos__9_ in
            let _startpos = _startpos__1_ in
            let _loc = (_startpos, _endpos) in
            
# 110 "llvm_parser.mly"
    ( Some (make_func f rt (mk_args _loc args) b)  )
# 2526 "llvm_parser.ml"
             in
            _menhir_goto_func _menhir_env _menhir_stack _menhir_s _v) : 'freshtv324)) : 'freshtv326)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((('freshtv327 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2536 "llvm_parser.ml"
            )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 2540 "llvm_parser.ml"
            ) * Lexing.position)) * _menhir_state * (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 2544 "llvm_parser.ml"
            )))) * _menhir_state * (
# 75 "llvm_parser.mly"
      (Llvm_ast.inst list)
# 2548 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv328)) : 'freshtv330)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv333 * _menhir_state * (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 2557 "llvm_parser.ml"
        )) * _menhir_state * (
# 75 "llvm_parser.mly"
      (Llvm_ast.inst list)
# 2561 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv331 * _menhir_state * (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 2567 "llvm_parser.ml"
        )) * _menhir_state * (
# 75 "llvm_parser.mly"
      (Llvm_ast.inst list)
# 2571 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (i : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 2576 "llvm_parser.ml"
        ))), _, (is : (
# 75 "llvm_parser.mly"
      (Llvm_ast.inst list)
# 2580 "llvm_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 75 "llvm_parser.mly"
      (Llvm_ast.inst list)
# 2585 "llvm_parser.ml"
        ) = 
# 177 "llvm_parser.mly"
                     ( i::is )
# 2589 "llvm_parser.ml"
         in
        _menhir_goto_insts _menhir_env _menhir_stack _menhir_s _v) : 'freshtv332)) : 'freshtv334)
    | _ ->
        _menhir_fail ()

and _menhir_reduce67 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 49 "llvm_parser.mly"
       (string)
# 2598 "llvm_parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos_v_ _menhir_s (v : (
# 49 "llvm_parser.mly"
       (string)
# 2603 "llvm_parser.ml"
  )) _startpos_v_ ->
    let _startpos = _startpos_v_ in
    let _endpos = _endpos_v_ in
    let _v : (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2610 "llvm_parser.ml"
    ) = 
# 181 "llvm_parser.mly"
           ( Local v )
# 2614 "llvm_parser.ml"
     in
    _menhir_goto_var _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce68 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 50 "llvm_parser.mly"
       (string)
# 2621 "llvm_parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos_v_ _menhir_s (v : (
# 50 "llvm_parser.mly"
       (string)
# 2626 "llvm_parser.ml"
  )) _startpos_v_ ->
    let _startpos = _startpos_v_ in
    let _endpos = _endpos_v_ in
    let _v : (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 2633 "llvm_parser.ml"
    ) = 
# 182 "llvm_parser.mly"
           ( Global v )
# 2637 "llvm_parser.ml"
     in
    _menhir_goto_var _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_run131 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2644 "llvm_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce47 _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run132 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2653 "llvm_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TINT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _v
    | TSTRUCT _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _v
    | TVOID ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState132
    | RPAREN ->
        _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState132
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132

and _menhir_run85 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONST _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v
    | GVAR _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LVAR _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NULL ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85

and _menhir_run59 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce66 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s

and _menhir_run60 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 52 "llvm_parser.mly"
       (int)
# 2700 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce65 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v

and _menhir_run54 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 49 "llvm_parser.mly"
       (string)
# 2709 "llvm_parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce67 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v _startpos

and _menhir_run55 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 50 "llvm_parser.mly"
       (string)
# 2718 "llvm_parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce68 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v _startpos

and _menhir_run35 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce66 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s

and _menhir_run38 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 52 "llvm_parser.mly"
       (int)
# 2732 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce65 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2741 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv303 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2751 "llvm_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2755 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv299 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2765 "llvm_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2769 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack)) : 'freshtv300)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv301 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2780 "llvm_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2784 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv302)) : 'freshtv304)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv307 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2793 "llvm_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2797 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv305 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2803 "llvm_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2807 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (t : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2812 "llvm_parser.ml"
        ))), _), _, (ts : (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2816 "llvm_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2821 "llvm_parser.ml"
        ) = 
# 240 "llvm_parser.mly"
                          ( t::ts )
# 2825 "llvm_parser.ml"
         in
        _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv306)) : 'freshtv308)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv313 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2833 "llvm_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2837 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv309 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2847 "llvm_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2851 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack)) : 'freshtv310)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv311 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2862 "llvm_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2866 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv312)) : 'freshtv314)
    | MenhirState157 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv321 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2875 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 2879 "llvm_parser.ml"
        ) * Lexing.position)) * _menhir_state * (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2883 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv317 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2893 "llvm_parser.ml"
            )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 2897 "llvm_parser.ml"
            ) * Lexing.position)) * _menhir_state * (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2901 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv315 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2908 "llvm_parser.ml"
            )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 2912 "llvm_parser.ml"
            ) * Lexing.position)) * _menhir_state * (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2916 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s, _startpos__1_), _, (rt : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2921 "llvm_parser.ml"
            ))), _endpos_f_, _, (f : (
# 50 "llvm_parser.mly"
       (string)
# 2925 "llvm_parser.ml"
            )), _startpos_f_), _, _) = _menhir_stack in
            let _v : (
# 73 "llvm_parser.mly"
      (Llvm_ast.func option)
# 2930 "llvm_parser.ml"
            ) = 
# 107 "llvm_parser.mly"
                                                  ( None )
# 2934 "llvm_parser.ml"
             in
            _menhir_goto_func _menhir_env _menhir_stack _menhir_s _v) : 'freshtv316)) : 'freshtv318)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv319 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2944 "llvm_parser.ml"
            )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 2948 "llvm_parser.ml"
            ) * Lexing.position)) * _menhir_state * (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2952 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv320)) : 'freshtv322)
    | _ ->
        _menhir_fail ()

and _menhir_reduce52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 2964 "llvm_parser.ml"
    ) = 
# 238 "llvm_parser.mly"
                          ( [] )
# 2968 "llvm_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run25 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2975 "llvm_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce47 _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run26 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 2984 "llvm_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TINT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | TSTRUCT _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | TVOID ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | RPAREN ->
        _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26

and _menhir_reduce36 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 3009 "llvm_parser.ml"
    ) = 
# 202 "llvm_parser.mly"
           ( [] )
# 3013 "llvm_parser.ml"
     in
    _menhir_goto_maybeops _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_brackops : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 81 "llvm_parser.mly"
      ((Llvm_ast.label * Llvm_ast.value) list)
# 3020 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv293 * _menhir_state * (
# 80 "llvm_parser.mly"
      (Llvm_ast.label * Llvm_ast.value)
# 3029 "llvm_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 81 "llvm_parser.mly"
      ((Llvm_ast.label * Llvm_ast.value) list)
# 3035 "llvm_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv291 * _menhir_state * (
# 80 "llvm_parser.mly"
      (Llvm_ast.label * Llvm_ast.value)
# 3041 "llvm_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((ps : (
# 81 "llvm_parser.mly"
      ((Llvm_ast.label * Llvm_ast.value) list)
# 3047 "llvm_parser.ml"
        )) : (
# 81 "llvm_parser.mly"
      ((Llvm_ast.label * Llvm_ast.value) list)
# 3051 "llvm_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (p : (
# 80 "llvm_parser.mly"
      (Llvm_ast.label * Llvm_ast.value)
# 3056 "llvm_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 81 "llvm_parser.mly"
      ((Llvm_ast.label * Llvm_ast.value) list)
# 3061 "llvm_parser.ml"
        ) = 
# 212 "llvm_parser.mly"
                               ( p::ps )
# 3065 "llvm_parser.ml"
         in
        _menhir_goto_brackops _menhir_env _menhir_stack _menhir_s _v) : 'freshtv292)) : 'freshtv294)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv297 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 3073 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3077 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 81 "llvm_parser.mly"
      ((Llvm_ast.label * Llvm_ast.value) list)
# 3083 "llvm_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv295 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 3089 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3093 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((preds : (
# 81 "llvm_parser.mly"
      ((Llvm_ast.label * Llvm_ast.value) list)
# 3099 "llvm_parser.ml"
        )) : (
# 81 "llvm_parser.mly"
      ((Llvm_ast.label * Llvm_ast.value) list)
# 3103 "llvm_parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _endpos_d_, _menhir_s, (d : (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 3108 "llvm_parser.ml"
        )), _startpos_d_), _, (t : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3112 "llvm_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 3117 "llvm_parser.ml"
        ) = 
# 171 "llvm_parser.mly"
    ( should_be_ssa := true; IPhi (d, t, preds) )
# 3121 "llvm_parser.ml"
         in
        _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv296)) : 'freshtv298)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ops : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 78 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 3130 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    match _menhir_s with
    | MenhirState121 | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv281) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 78 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 3142 "llvm_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv279) = Obj.magic _menhir_stack in
        let (_endpos_o_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((o : (
# 78 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 3151 "llvm_parser.ml"
        )) : (
# 78 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 3155 "llvm_parser.ml"
        )) = _v in
        ((let _v : (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 3160 "llvm_parser.ml"
        ) = 
# 203 "llvm_parser.mly"
           ( o )
# 3164 "llvm_parser.ml"
         in
        _menhir_goto_maybeops _menhir_env _menhir_stack _menhir_s _v) : 'freshtv280)) : 'freshtv282)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv283 * Lexing.position * _menhir_state * (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 3172 "llvm_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 78 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 3179 "llvm_parser.ml"
        )) = _v in
        (_menhir_reduce40 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v : 'freshtv284)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv287 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 3187 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3191 "llvm_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 78 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 3198 "llvm_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv285 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 3204 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3208 "llvm_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos_args_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((args : (
# 78 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 3215 "llvm_parser.ml"
        )) : (
# 78 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 3219 "llvm_parser.ml"
        )) = _v in
        ((let (((_menhir_stack, _endpos_d_, _menhir_s, (d : (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 3224 "llvm_parser.ml"
        )), _startpos_d_), _, (t : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3228 "llvm_parser.ml"
        ))), _) = _menhir_stack in
        let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 3233 "llvm_parser.ml"
        ) = let _endpos = _endpos_args_ in
        let _startpos = _startpos_d_ in
        let _loc = (_startpos, _endpos) in
        
# 155 "llvm_parser.mly"
    ( match args with
      | (_, Var v)::args ->
	 IGetElementPtr (d, t, v, args)
      | _ -> syn_err "Invalid instruction" _loc
    )
# 3244 "llvm_parser.ml"
         in
        _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv286)) : 'freshtv288)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv289 * Lexing.position * _menhir_state * (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 3252 "llvm_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 78 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 3259 "llvm_parser.ml"
        )) = _v in
        (_menhir_reduce40 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v : 'freshtv290)
    | _ ->
        _menhir_fail ()

and _menhir_reduce34 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 75 "llvm_parser.mly"
      (Llvm_ast.inst list)
# 3270 "llvm_parser.ml"
    ) = 
# 176 "llvm_parser.mly"
                         ( [] )
# 3274 "llvm_parser.ml"
     in
    _menhir_goto_insts _menhir_env _menhir_stack _menhir_s _v

and _menhir_run49 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TINT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | TSTRUCT _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | TVOID ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TINT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | TSTRUCT _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | TVOID ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | BR | GVAR _ | KEYWORD _ | LVAR _ | RBRACE | RET | STORE ->
        _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57

and _menhir_run36 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 49 "llvm_parser.mly"
       (string)
# 3317 "llvm_parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce67 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v _startpos

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 48 "llvm_parser.mly"
       (string)
# 3326 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COLON ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv275 * _menhir_state * (
# 48 "llvm_parser.mly"
       (string)
# 3338 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv273 * _menhir_state * (
# 48 "llvm_parser.mly"
       (string)
# 3345 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (l : (
# 48 "llvm_parser.mly"
       (string)
# 3350 "llvm_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 3355 "llvm_parser.ml"
        ) = 
# 132 "llvm_parser.mly"
                     ( ILabel l )
# 3359 "llvm_parser.ml"
         in
        _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv274)) : 'freshtv276)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv277 * _menhir_state * (
# 48 "llvm_parser.mly"
       (string)
# 3369 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 50 "llvm_parser.mly"
       (string)
# 3377 "llvm_parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce68 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v _startpos

and _menhir_run65 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LABEL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv271 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState65 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LVAR _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv267 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let (_v : (
# 49 "llvm_parser.mly"
       (string)
# 3404 "llvm_parser.ml"
            )) = _v in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv265 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            let (_endpos_l_ : Lexing.position) = _endpos in
            let ((l : (
# 49 "llvm_parser.mly"
       (string)
# 3414 "llvm_parser.ml"
            )) : (
# 49 "llvm_parser.mly"
       (string)
# 3418 "llvm_parser.ml"
            )) = _v in
            let (_startpos_l_ : Lexing.position) = _startpos in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 3425 "llvm_parser.ml"
            ) = 
# 139 "llvm_parser.mly"
                      ( IBr l )
# 3429 "llvm_parser.ml"
             in
            _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv266)) : 'freshtv268)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv269 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)) : 'freshtv272)
    | TINT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | TSTRUCT _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | TVOID ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3453 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv209 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3463 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | GVAR _v ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ('freshtv207 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3475 "llvm_parser.ml"
              )) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState24 in
              let (_v : (
# 50 "llvm_parser.mly"
       (string)
# 3482 "llvm_parser.ml"
              )) = _v in
              let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
              ((let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
              let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | LPAREN ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : (('freshtv203 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3494 "llvm_parser.ml"
                  )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 3498 "llvm_parser.ml"
                  ) * Lexing.position) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let _tok = _menhir_env._menhir_token in
                  match _tok with
                  | TINT _v ->
                      _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
                  | TSTRUCT _v ->
                      _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
                  | TVOID ->
                      _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState33
                  | RPAREN ->
                      _menhir_reduce36 _menhir_env (Obj.magic _menhir_stack) MenhirState33
                  | _ ->
                      assert (not _menhir_env._menhir_error);
                      _menhir_env._menhir_error <- true;
                      _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33) : 'freshtv204)
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : (('freshtv205 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3522 "llvm_parser.ml"
                  )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 3526 "llvm_parser.ml"
                  ) * Lexing.position) = Obj.magic _menhir_stack in
                  ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)) : 'freshtv208)
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState24
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState24
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24)) : 'freshtv210)
    | MenhirState157 | MenhirState132 | MenhirState30 | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3543 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | COMMA ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : 'freshtv211 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3555 "llvm_parser.ml"
              )) = Obj.magic _menhir_stack in
              let (_menhir_s : _menhir_state) = MenhirState29 in
              ((let _menhir_stack = (_menhir_stack, _menhir_s) in
              let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | TINT _v ->
                  _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
              | TSTRUCT _v ->
                  _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
              | TVOID ->
                  _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState30
              | RPAREN ->
                  _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState30
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30) : 'freshtv212)
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState29
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState29
          | RPAREN ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : 'freshtv213 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3583 "llvm_parser.ml"
              )) = Obj.magic _menhir_stack in
              ((let (_menhir_stack, _menhir_s, (t : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3588 "llvm_parser.ml"
              ))) = _menhir_stack in
              let _v : (
# 84 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 3593 "llvm_parser.ml"
              ) = 
# 239 "llvm_parser.mly"
                          ( [t] )
# 3597 "llvm_parser.ml"
               in
              _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv214)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29)) : 'freshtv216)
    | MenhirState121 | MenhirState43 | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3609 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | CONST _v ->
              _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState34 _v
          | GVAR _v ->
              _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState34 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState34
          | LVAR _v ->
              _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState34 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | NULL ->
              _menhir_run35 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState34
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState34
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34)) : 'freshtv218)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv219 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3637 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | CONST _v ->
              _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState50 _v
          | GVAR _v ->
              _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState50 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState50
          | LVAR _v ->
              _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState50 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | NULL ->
              _menhir_run35 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState50
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState50
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50)) : 'freshtv220)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv221 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3665 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 3669 "llvm_parser.ml"
        ))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3673 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | GVAR _v ->
              _menhir_run55 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState53 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState53
          | LVAR _v ->
              _menhir_run54 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState53 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState53
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53)) : 'freshtv222)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv223 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3697 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | CONST _v ->
              _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState58 _v
          | GVAR _v ->
              _menhir_run55 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState58 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState58
          | LVAR _v ->
              _menhir_run54 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState58 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | NULL ->
              _menhir_run59 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState58
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState58
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58)) : 'freshtv224)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv225 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3725 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | CONST _v ->
              _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState68 _v
          | GVAR _v ->
              _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState68 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState68
          | LVAR _v ->
              _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState68 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | NULL ->
              _menhir_run35 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState68
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState68
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68)) : 'freshtv226)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv227 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 3753 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3757 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState84
          | LSQ ->
              _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState84
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState84
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84)) : 'freshtv228)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv231 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 3779 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3783 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | COMMA ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ((('freshtv229 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 3795 "llvm_parser.ml"
              ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3799 "llvm_parser.ml"
              )) = Obj.magic _menhir_stack in
              let (_menhir_s : _menhir_state) = MenhirState97 in
              ((let _menhir_stack = (_menhir_stack, _menhir_s) in
              let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | TINT _v ->
                  _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
              | TSTRUCT _v ->
                  _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
              | TVOID ->
                  _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState98
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98) : 'freshtv230)
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState97
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState97
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97)) : 'freshtv232)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv233 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 3829 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3833 "llvm_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3837 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | GVAR _v ->
              _menhir_run55 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState99
          | LVAR _v ->
              _menhir_run54 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState99 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState99
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99)) : 'freshtv234)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv235 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 3861 "llvm_parser.ml"
        ) * Lexing.position))) * (
# 48 "llvm_parser.mly"
       (string)
# 3865 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3869 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | CONST _v ->
              _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState104 _v
          | GVAR _v ->
              _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState104 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState104
          | LVAR _v ->
              _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState104 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | NULL ->
              _menhir_run35 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState104
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState104
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104)) : 'freshtv236)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv239 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 3897 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3901 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | COMMA ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ((('freshtv237 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 3913 "llvm_parser.ml"
              ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3917 "llvm_parser.ml"
              )) = Obj.magic _menhir_stack in
              let (_menhir_s : _menhir_state) = MenhirState109 in
              ((let _menhir_stack = (_menhir_stack, _menhir_s) in
              let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | TINT _v ->
                  _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
              | TSTRUCT _v ->
                  _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
              | TVOID ->
                  _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState110
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110) : 'freshtv238)
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState109
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState109
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109)) : 'freshtv240)
    | MenhirState115 | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv241 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3947 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | CONST _v ->
              _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState111 _v
          | GVAR _v ->
              _menhir_run55 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState111 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState111
          | LVAR _v ->
              _menhir_run54 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState111 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | NULL ->
              _menhir_run59 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState111
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState111
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111)) : 'freshtv242)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv243 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 3975 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 3979 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState119
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | GVAR _v ->
              _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState119 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState119
          | LVAR _v ->
              _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState119 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState119
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState119)) : 'freshtv244)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv247 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 4003 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4007 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | COMMA ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ((('freshtv245 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 4019 "llvm_parser.ml"
              ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4023 "llvm_parser.ml"
              )) = Obj.magic _menhir_stack in
              let (_menhir_s : _menhir_state) = MenhirState130 in
              ((let _menhir_stack = (_menhir_stack, _menhir_s) in
              let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | TINT _v ->
                  _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _v
              | TSTRUCT _v ->
                  _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _v
              | TVOID ->
                  _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState135
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135) : 'freshtv246)
          | LPAREN ->
              _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState130
          | STAR ->
              _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState130
          | BR | GVAR _ | KEYWORD _ | LVAR _ | RBRACE | RET | STORE ->
              _menhir_reduce29 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130)) : 'freshtv248)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv249 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 4055 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4059 "llvm_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4063 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | CONST _v ->
              _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v
          | GVAR _v ->
              _menhir_run55 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState136
          | LVAR _v ->
              _menhir_run54 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | NULL ->
              _menhir_run59 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState136
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136)) : 'freshtv250)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv251 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 4091 "llvm_parser.ml"
        ) * Lexing.position)) * (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 4095 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4099 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | CONST _v ->
              _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState140 _v
          | GVAR _v ->
              _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState140 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState140
          | LVAR _v ->
              _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState140 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | NULL ->
              _menhir_run35 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState140
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState140
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140)) : 'freshtv252)
    | MenhirState142 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv253 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 4127 "llvm_parser.ml"
        ) * Lexing.position)) * (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 4131 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4135 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 4139 "llvm_parser.ml"
        ))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4143 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState143
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | LPAREN ->
              _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState143
          | STAR ->
              _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState143
          | BR | GVAR _ | KEYWORD _ | LVAR _ | RBRACE | RET | STORE ->
              _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState143)) : 'freshtv254)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv255 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 4165 "llvm_parser.ml"
        ) * Lexing.position)) * (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 4169 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4173 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | CONST _v ->
              _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145 _v
          | GVAR _v ->
              _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState145
          | LVAR _v ->
              _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | NULL ->
              _menhir_run35 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState145
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState145
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145)) : 'freshtv256)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv263 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4201 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | GVAR _v ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ('freshtv261 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4213 "llvm_parser.ml"
              )) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState155 in
              let (_v : (
# 50 "llvm_parser.mly"
       (string)
# 4220 "llvm_parser.ml"
              )) = _v in
              let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
              ((let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
              let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | LPAREN ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : (('freshtv257 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4232 "llvm_parser.ml"
                  )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 4236 "llvm_parser.ml"
                  ) * Lexing.position) = Obj.magic _menhir_stack in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  let _tok = _menhir_env._menhir_token in
                  match _tok with
                  | TINT _v ->
                      _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _v
                  | TSTRUCT _v ->
                      _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _v
                  | TVOID ->
                      _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState157
                  | RPAREN ->
                      _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState157
                  | _ ->
                      assert (not _menhir_env._menhir_error);
                      _menhir_env._menhir_error <- true;
                      _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState157) : 'freshtv258)
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : (('freshtv259 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4260 "llvm_parser.ml"
                  )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 4264 "llvm_parser.ml"
                  ) * Lexing.position) = Obj.magic _menhir_stack in
                  ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)) : 'freshtv262)
          | LPAREN ->
              _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState155
          | STAR ->
              _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState155
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155)) : 'freshtv264)
    | _ ->
        _menhir_fail ()

and _menhir_reduce8 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 80 "llvm_parser.mly"
      (Llvm_ast.label * Llvm_ast.value)
# 4282 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (p : (
# 80 "llvm_parser.mly"
      (Llvm_ast.label * Llvm_ast.value)
# 4288 "llvm_parser.ml"
    ))) = _menhir_stack in
    let _v : (
# 81 "llvm_parser.mly"
      ((Llvm_ast.label * Llvm_ast.value) list)
# 4293 "llvm_parser.ml"
    ) = 
# 211 "llvm_parser.mly"
                              ( [p] )
# 4297 "llvm_parser.ml"
     in
    _menhir_goto_brackops _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce39 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 4304 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos_o_, _menhir_s, (o : (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 4310 "llvm_parser.ml"
    ))) = _menhir_stack in
    let _endpos = _endpos_o_ in
    let _v : (
# 78 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 4316 "llvm_parser.ml"
    ) = 
# 197 "llvm_parser.mly"
                        ( [o] )
# 4320 "llvm_parser.ml"
     in
    _menhir_goto_ops _menhir_env _menhir_stack _endpos _menhir_s _v

and _menhir_goto_inst : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 4327 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv201 * _menhir_state * (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 4335 "llvm_parser.ml"
    )) = Obj.magic _menhir_stack in
    ((if _menhir_env._menhir_error then
      _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151
    else
      let _tok = _menhir_env._menhir_token in
      match _tok with
      | BR ->
          _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState151
      | GVAR _v ->
          _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
      | KEYWORD _v ->
          _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
      | LVAR _v ->
          _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
      | RET ->
          _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState151
      | STORE ->
          _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState151
      | RBRACE ->
          _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack) MenhirState151
      | _ ->
          (assert (not _menhir_env._menhir_error);
          _menhir_env._menhir_error <- true;
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151)) : 'freshtv202)

and _menhir_goto_unchecked_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4364 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv187 * Lexing.position * _menhir_state * (
# 49 "llvm_parser.mly"
       (string)
# 4374 "llvm_parser.ml"
        ) * Lexing.position)))) * _menhir_state * (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4378 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv183 * Lexing.position * _menhir_state * (
# 49 "llvm_parser.mly"
       (string)
# 4388 "llvm_parser.ml"
            ) * Lexing.position)))) * _menhir_state * (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4392 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv181 * Lexing.position * _menhir_state * (
# 49 "llvm_parser.mly"
       (string)
# 4400 "llvm_parser.ml"
            ) * Lexing.position)))) * _menhir_state * (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4404 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_endpos__6_ : Lexing.position) = _endpos in
            ((let ((_menhir_stack, _endpos_t_, _menhir_s, (t : (
# 49 "llvm_parser.mly"
       (string)
# 4410 "llvm_parser.ml"
            )), _startpos_t_), _, (fs : (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4414 "llvm_parser.ml"
            ))) = _menhir_stack in
            let _v : (
# 89 "llvm_parser.mly"
      (unit)
# 4419 "llvm_parser.ml"
            ) = 
# 95 "llvm_parser.mly"
  ( structs := Varmap.add t fs (!structs) )
# 4423 "llvm_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv179) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 89 "llvm_parser.mly"
      (unit)
# 4431 "llvm_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv177 * _menhir_state * (
# 89 "llvm_parser.mly"
      (unit)
# 4438 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((if _menhir_env._menhir_error then
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160
            else
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | DECLARE ->
                  _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | DEFINE ->
                  _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | EOF ->
                  _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState160
              | LVAR _v ->
                  _menhir_run2 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState160 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | _ ->
                  (assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160)) : 'freshtv178)) : 'freshtv180)) : 'freshtv182)) : 'freshtv184)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv185 * Lexing.position * _menhir_state * (
# 49 "llvm_parser.mly"
       (string)
# 4464 "llvm_parser.ml"
            ) * Lexing.position)))) * _menhir_state * (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4468 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)) : 'freshtv188)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv195 * _menhir_state * (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4477 "llvm_parser.ml"
        ))) * _menhir_state * (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4481 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv191 * _menhir_state * (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4491 "llvm_parser.ml"
            ))) * _menhir_state * (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4495 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv189 * _menhir_state * (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4502 "llvm_parser.ml"
            ))) * _menhir_state * (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4506 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (rt : (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4511 "llvm_parser.ml"
            ))), _, (args : (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4515 "llvm_parser.ml"
            ))) = _menhir_stack in
            let _v : (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4520 "llvm_parser.ml"
            ) = 
# 227 "llvm_parser.mly"
    ( TFunction (rt, args) )
# 4524 "llvm_parser.ml"
             in
            _menhir_goto_unchecked_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv190)) : 'freshtv192)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv193 * _menhir_state * (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4534 "llvm_parser.ml"
            ))) * _menhir_state * (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4538 "llvm_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)) : 'freshtv196)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv199 * _menhir_state * (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4547 "llvm_parser.ml"
        ))) * _menhir_state * (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4551 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv197 * _menhir_state * (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4557 "llvm_parser.ml"
        ))) * _menhir_state * (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4561 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (t : (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4566 "llvm_parser.ml"
        ))), _, (ts : (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4570 "llvm_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4575 "llvm_parser.ml"
        ) = 
# 246 "llvm_parser.mly"
                                              ( t::ts )
# 4579 "llvm_parser.ml"
         in
        _menhir_goto_unchecked_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv198)) : 'freshtv200)
    | _ ->
        _menhir_fail ()

and _menhir_goto_unchecked_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4588 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv175 * _menhir_state * (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4596 "llvm_parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv163 * _menhir_state * (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4606 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LVAR _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState17 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TINT _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
        | TSTRUCT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
        | TVOID ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | RBRACE | RPAREN ->
            _menhir_reduce61 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17) : 'freshtv164)
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv165 * _menhir_state * (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4630 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LVAR _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState14 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TINT _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | TSTRUCT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | TVOID ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | RPAREN ->
            _menhir_reduce61 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14) : 'freshtv166)
    | STAR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv169 * _menhir_state * (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4654 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv167 * _menhir_state * (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4661 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (t : (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4666 "llvm_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4671 "llvm_parser.ml"
        ) = 
# 229 "llvm_parser.mly"
    ( TPointer t )
# 4675 "llvm_parser.ml"
         in
        _menhir_goto_unchecked_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv168)) : 'freshtv170)
    | RBRACE | RPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv171 * _menhir_state * (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4683 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (t : (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4688 "llvm_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4693 "llvm_parser.ml"
        ) = 
# 245 "llvm_parser.mly"
                          ( [t] )
# 4697 "llvm_parser.ml"
         in
        _menhir_goto_unchecked_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv172)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv173 * _menhir_state * (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4707 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)) : 'freshtv176)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_reduce48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4722 "llvm_parser.ml"
    ) = 
# 220 "llvm_parser.mly"
          ( TVoid )
# 4726 "llvm_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce50 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 51 "llvm_parser.mly"
       (string)
# 4733 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s (t : (
# 51 "llvm_parser.mly"
       (string)
# 4738 "llvm_parser.ml"
  )) ->
    let _v : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4743 "llvm_parser.ml"
    ) = 
# 222 "llvm_parser.mly"
              ( TStruct t )
# 4747 "llvm_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce49 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 63 "llvm_parser.mly"
       (int)
# 4754 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s (n : (
# 63 "llvm_parser.mly"
       (int)
# 4759 "llvm_parser.ml"
  )) ->
    let _v : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4764 "llvm_parser.ml"
    ) = 
# 221 "llvm_parser.mly"
           ( TInteger n )
# 4768 "llvm_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce24 : _menhir_env -> 'ttv_tail * _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s) = _menhir_stack in
    let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 4778 "llvm_parser.ml"
    ) = 
# 145 "llvm_parser.mly"
        ( IRet None )
# 4782 "llvm_parser.ml"
     in
    _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v

and _menhir_error90 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 80 "llvm_parser.mly"
      (Llvm_ast.label * Llvm_ast.value)
# 4789 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    _menhir_reduce8 _menhir_env (Obj.magic _menhir_stack)

and _menhir_error114 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 4797 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    _menhir_reduce39 _menhir_env (Obj.magic _menhir_stack)

and _menhir_reduce29 : _menhir_env -> ((('ttv_tail * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 4805 "llvm_parser.ml"
) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4809 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _endpos_d_, _menhir_s, (d : (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 4815 "llvm_parser.ml"
    )), _startpos_d_), _, (t : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4819 "llvm_parser.ml"
    ))) = _menhir_stack in
    let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 4824 "llvm_parser.ml"
    ) = 
# 161 "llvm_parser.mly"
    ( IAlloca (d, t, 1) )
# 4828 "llvm_parser.ml"
     in
    _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce26 : _menhir_env -> (((((('ttv_tail * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 4835 "llvm_parser.ml"
) * Lexing.position)) * (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 4839 "llvm_parser.ml"
)) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4843 "llvm_parser.ml"
)) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 4847 "llvm_parser.ml"
))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4851 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((((_menhir_stack, _endpos_d_, _menhir_s, (d : (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 4857 "llvm_parser.ml"
    )), _startpos_d_), (c : (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 4861 "llvm_parser.ml"
    ))), _, (t1 : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4865 "llvm_parser.ml"
    ))), _endpos_v_, _, (v : (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 4869 "llvm_parser.ml"
    ))), _, (t : (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4873 "llvm_parser.ml"
    ))) = _menhir_stack in
    let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 4878 "llvm_parser.ml"
    ) = 
# 150 "llvm_parser.mly"
    ( ICast (d, c, t1, v, t)
    )
# 4883 "llvm_parser.ml"
     in
    _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run48 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv161) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _v : (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 4898 "llvm_parser.ml"
    ) = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    
# 172 "llvm_parser.mly"
          ( syn_err "Invalid instruction" _loc )
# 4905 "llvm_parser.ml"
     in
    _menhir_goto_inst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv162)

and _menhir_goto_func : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 73 "llvm_parser.mly"
      (Llvm_ast.func option)
# 4912 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv159 * _menhir_state * (
# 73 "llvm_parser.mly"
      (Llvm_ast.func option)
# 4920 "llvm_parser.ml"
    )) = Obj.magic _menhir_stack in
    ((if _menhir_env._menhir_error then
      _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState162
    else
      let _tok = _menhir_env._menhir_token in
      match _tok with
      | DECLARE ->
          _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
      | DEFINE ->
          _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
      | EOF ->
          _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState162
      | LVAR _v ->
          _menhir_run2 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState162 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
      | _ ->
          (assert (not _menhir_env._menhir_error);
          _menhir_env._menhir_error <- true;
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState162)) : 'freshtv160)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv157) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _v : (
# 72 "llvm_parser.mly"
      (Llvm_ast.prog)
# 4950 "llvm_parser.ml"
    ) = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    
# 103 "llvm_parser.mly"
           ( syn_err "Invalid declaration/definition" _loc )
# 4957 "llvm_parser.ml"
     in
    _menhir_goto_prog _menhir_env _menhir_stack _menhir_s _v) : 'freshtv158)

and _menhir_reduce61 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 86 "llvm_parser.mly"
      (Llvm_ast.typ list)
# 4966 "llvm_parser.ml"
    ) = 
# 244 "llvm_parser.mly"
                          ( [] )
# 4970 "llvm_parser.ml"
     in
    _menhir_goto_unchecked_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv155) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 4983 "llvm_parser.ml"
    ) = 
# 230 "llvm_parser.mly"
          ( TVoid )
# 4987 "llvm_parser.ml"
     in
    _menhir_goto_unchecked_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv156)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 51 "llvm_parser.mly"
       (string)
# 4994 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv153) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((t : (
# 51 "llvm_parser.mly"
       (string)
# 5004 "llvm_parser.ml"
    )) : (
# 51 "llvm_parser.mly"
       (string)
# 5008 "llvm_parser.ml"
    )) = _v in
    ((let _v : (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5013 "llvm_parser.ml"
    ) = 
# 232 "llvm_parser.mly"
              ( TStruct t )
# 5017 "llvm_parser.ml"
     in
    _menhir_goto_unchecked_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv154)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 63 "llvm_parser.mly"
       (int)
# 5024 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv151) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((n : (
# 63 "llvm_parser.mly"
       (int)
# 5034 "llvm_parser.ml"
    )) : (
# 63 "llvm_parser.mly"
       (int)
# 5038 "llvm_parser.ml"
    )) = _v in
    ((let _v : (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5043 "llvm_parser.ml"
    ) = 
# 231 "llvm_parser.mly"
           ( TInteger n )
# 5047 "llvm_parser.ml"
     in
    _menhir_goto_unchecked_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv152)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 49 "llvm_parser.mly"
       (string)
# 5054 "llvm_parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv149) = Obj.magic _menhir_stack in
    let (_endpos_t_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((t : (
# 49 "llvm_parser.mly"
       (string)
# 5065 "llvm_parser.ml"
    )) : (
# 49 "llvm_parser.mly"
       (string)
# 5069 "llvm_parser.ml"
    )) = _v in
    let (_startpos_t_ : Lexing.position) = _startpos in
    ((let _v : (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5075 "llvm_parser.ml"
    ) = 
# 233 "llvm_parser.mly"
           ( TStruct t )
# 5079 "llvm_parser.ml"
     in
    _menhir_goto_unchecked_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv150)

and _menhir_goto_prog : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 72 "llvm_parser.mly"
      (Llvm_ast.prog)
# 5086 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state * (
# 89 "llvm_parser.mly"
      (unit)
# 5095 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 72 "llvm_parser.mly"
      (Llvm_ast.prog)
# 5101 "llvm_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state * (
# 89 "llvm_parser.mly"
      (unit)
# 5107 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((p : (
# 72 "llvm_parser.mly"
      (Llvm_ast.prog)
# 5113 "llvm_parser.ml"
        )) : (
# 72 "llvm_parser.mly"
      (Llvm_ast.prog)
# 5117 "llvm_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        let _v : (
# 72 "llvm_parser.mly"
      (Llvm_ast.prog)
# 5123 "llvm_parser.ml"
        ) = 
# 101 "llvm_parser.mly"
    ( p )
# 5127 "llvm_parser.ml"
         in
        _menhir_goto_prog _menhir_env _menhir_stack _menhir_s _v) : 'freshtv138)) : 'freshtv140)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143 * _menhir_state * (
# 73 "llvm_parser.mly"
      (Llvm_ast.func option)
# 5135 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 72 "llvm_parser.mly"
      (Llvm_ast.prog)
# 5141 "llvm_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state * (
# 73 "llvm_parser.mly"
      (Llvm_ast.func option)
# 5147 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((p : (
# 72 "llvm_parser.mly"
      (Llvm_ast.prog)
# 5153 "llvm_parser.ml"
        )) : (
# 72 "llvm_parser.mly"
      (Llvm_ast.prog)
# 5157 "llvm_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (f : (
# 73 "llvm_parser.mly"
      (Llvm_ast.func option)
# 5162 "llvm_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 72 "llvm_parser.mly"
      (Llvm_ast.prog)
# 5167 "llvm_parser.ml"
        ) = 
# 102 "llvm_parser.mly"
                   ( (match f with Some f -> f::p | None -> p) )
# 5171 "llvm_parser.ml"
         in
        _menhir_goto_prog _menhir_env _menhir_stack _menhir_s _v) : 'freshtv142)) : 'freshtv144)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 72 "llvm_parser.mly"
      (Llvm_ast.prog)
# 5181 "llvm_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 72 "llvm_parser.mly"
      (Llvm_ast.prog)
# 5189 "llvm_parser.ml"
        )) : (
# 72 "llvm_parser.mly"
      (Llvm_ast.prog)
# 5193 "llvm_parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv146)) : 'freshtv148)
    | _ ->
        _menhir_fail ()

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce48 _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 51 "llvm_parser.mly"
       (string)
# 5207 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v

and _menhir_run23 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 63 "llvm_parser.mly"
       (int)
# 5216 "llvm_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17 * _menhir_state * (
# 73 "llvm_parser.mly"
      (Llvm_ast.func option)
# 5230 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        (_menhir_run1 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState162 _menhir_env._menhir_lexbuf.Lexing.lex_start_p : 'freshtv18)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state * (
# 89 "llvm_parser.mly"
      (unit)
# 5238 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        (_menhir_run1 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState160 _menhir_env._menhir_lexbuf.Lexing.lex_start_p : 'freshtv20)
    | MenhirState157 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv21 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5246 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 5250 "llvm_parser.ml"
        ) * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv23 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5259 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState153 in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let (_startpos__2_ : Lexing.position) = _startpos in
        ((let (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let _v : (
# 73 "llvm_parser.mly"
      (Llvm_ast.func option)
# 5281 "llvm_parser.ml"
        ) = let _endpos = _endpos__2_ in
        let _startpos = _startpos__1_ in
        let _loc = (_startpos, _endpos) in
        
# 108 "llvm_parser.mly"
                  ( syn_err "Invalid function declaration" _loc )
# 5288 "llvm_parser.ml"
         in
        _menhir_goto_func _menhir_env _menhir_stack _menhir_s _v) : 'freshtv26)) : 'freshtv28)) : 'freshtv30)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * (
# 74 "llvm_parser.mly"
      (Llvm_ast.inst)
# 5296 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        (_menhir_run48 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState151 _menhir_env._menhir_lexbuf.Lexing.lex_start_p : 'freshtv32)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv33 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5304 "llvm_parser.ml"
        ) * Lexing.position)) * (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 5308 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5312 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 5316 "llvm_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv35 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5325 "llvm_parser.ml"
        ) * Lexing.position)) * (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 5329 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5333 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv37 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5342 "llvm_parser.ml"
        ) * Lexing.position)) * (
# 87 "llvm_parser.mly"
      (Llvm_ast.bop)
# 5346 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv39 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5355 "llvm_parser.ml"
        ) * Lexing.position)) * (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 5359 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5363 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 5367 "llvm_parser.ml"
        ))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5371 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        (_menhir_reduce26 _menhir_env (Obj.magic _menhir_stack) : 'freshtv40)
    | MenhirState142 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv41 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5379 "llvm_parser.ml"
        ) * Lexing.position)) * (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 5383 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5387 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 5391 "llvm_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv43 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5400 "llvm_parser.ml"
        ) * Lexing.position)) * (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 5404 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5408 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5417 "llvm_parser.ml"
        ) * Lexing.position)) * (
# 88 "llvm_parser.mly"
      (Llvm_ast.cast)
# 5421 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv47 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5430 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5434 "llvm_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5438 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv49 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5447 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5451 "llvm_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv51 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5460 "llvm_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv53 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5469 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5473 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        (_menhir_reduce29 _menhir_env (Obj.magic _menhir_stack) : 'freshtv54)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv55 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5481 "llvm_parser.ml"
        ) * Lexing.position))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv57 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5490 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5494 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5498 "llvm_parser.ml"
        ) * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv59 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5507 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5511 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv61 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5520 "llvm_parser.ml"
        ) * Lexing.position))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv63 * Lexing.position * _menhir_state * (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 5529 "llvm_parser.ml"
        ))) = Obj.magic _menhir_stack in
        (_menhir_error114 _menhir_env (Obj.magic _menhir_stack) : 'freshtv64)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5537 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv67 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5546 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5550 "llvm_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv69 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5559 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5563 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv71 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5572 "llvm_parser.ml"
        ) * Lexing.position))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv73 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5581 "llvm_parser.ml"
        ) * Lexing.position))) * (
# 48 "llvm_parser.mly"
       (string)
# 5585 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5589 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 5593 "llvm_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv75 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5602 "llvm_parser.ml"
        ) * Lexing.position))) * (
# 48 "llvm_parser.mly"
       (string)
# 5606 "llvm_parser.ml"
        )) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5610 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv77 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5619 "llvm_parser.ml"
        ) * Lexing.position))) * (
# 48 "llvm_parser.mly"
       (string)
# 5623 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv79 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5632 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5636 "llvm_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5640 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv81 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5649 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5653 "llvm_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv83 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5662 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5666 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv85 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5675 "llvm_parser.ml"
        ) * Lexing.position))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv87 * _menhir_state * (
# 80 "llvm_parser.mly"
      (Llvm_ast.label * Llvm_ast.value)
# 5684 "llvm_parser.ml"
        ))) = Obj.magic _menhir_stack in
        (_menhir_error90 _menhir_env (Obj.magic _menhir_stack) : 'freshtv88)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv91 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5697 "llvm_parser.ml"
        ) * Lexing.position))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5701 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv93 * Lexing.position * _menhir_state * (
# 82 "llvm_parser.mly"
      (Llvm_ast.var)
# 5710 "llvm_parser.ml"
        ) * Lexing.position))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv95 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5719 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv99 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5733 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state) = Obj.magic _menhir_stack in
        (_menhir_reduce24 _menhir_env (Obj.magic _menhir_stack) : 'freshtv102)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv103 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5746 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 5750 "llvm_parser.ml"
        ))) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5754 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv105 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5763 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 76 "llvm_parser.mly"
      (Llvm_ast.value)
# 5767 "llvm_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv107 * _menhir_state) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5776 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv111 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5790 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 5794 "llvm_parser.ml"
        ) * Lexing.position)) * _menhir_state * (
# 79 "llvm_parser.mly"
      ((Llvm_ast.typ * Llvm_ast.value) list)
# 5798 "llvm_parser.ml"
        )))) = Obj.magic _menhir_stack in
        (_menhir_run48 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState47 _menhir_env._menhir_lexbuf.Lexing.lex_start_p : 'freshtv112)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv113 * Lexing.position * _menhir_state * (
# 77 "llvm_parser.mly"
      (Llvm_ast.typ * Llvm_ast.value)
# 5806 "llvm_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv115 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5815 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv117 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5824 "llvm_parser.ml"
        )) * Lexing.position * _menhir_state * (
# 50 "llvm_parser.mly"
       (string)
# 5828 "llvm_parser.ml"
        ) * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv119 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5837 "llvm_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5846 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv123 * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5855 "llvm_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv125 * _menhir_state * Lexing.position) * _menhir_state * (
# 83 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5864 "llvm_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv129 * _menhir_state * (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5878 "llvm_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv131 * _menhir_state * (
# 85 "llvm_parser.mly"
      (Llvm_ast.typ)
# 5887 "llvm_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv133 * Lexing.position * _menhir_state * (
# 49 "llvm_parser.mly"
       (string)
# 5896 "llvm_parser.ml"
        ) * Lexing.position)))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135) = Obj.magic _menhir_stack in
        (_menhir_run1 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState0 _menhir_env._menhir_lexbuf.Lexing.lex_start_p : 'freshtv136)

and _menhir_run2 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 49 "llvm_parser.mly"
       (string)
# 5908 "llvm_parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQUAL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13 * Lexing.position * _menhir_state * (
# 49 "llvm_parser.mly"
       (string)
# 5920 "llvm_parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | TYP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv9 * Lexing.position * _menhir_state * (
# 49 "llvm_parser.mly"
       (string)
# 5930 "llvm_parser.ml"
            ) * Lexing.position)) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LBRACE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv5 * Lexing.position * _menhir_state * (
# 49 "llvm_parser.mly"
       (string)
# 5940 "llvm_parser.ml"
                ) * Lexing.position))) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | LVAR _v ->
                    _menhir_run9 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState5 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | TINT _v ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
                | TSTRUCT _v ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
                | TVOID ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5
                | RBRACE ->
                    _menhir_reduce61 _menhir_env (Obj.magic _menhir_stack) MenhirState5
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5) : 'freshtv6)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv7 * Lexing.position * _menhir_state * (
# 49 "llvm_parser.mly"
       (string)
# 5966 "llvm_parser.ml"
                ) * Lexing.position))) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv8)) : 'freshtv10)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv11 * Lexing.position * _menhir_state * (
# 49 "llvm_parser.mly"
       (string)
# 5977 "llvm_parser.ml"
            ) * Lexing.position)) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv12)) : 'freshtv14)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15 * Lexing.position * _menhir_state * (
# 49 "llvm_parser.mly"
       (string)
# 5988 "llvm_parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : (
# 72 "llvm_parser.mly"
      (Llvm_ast.prog)
# 6001 "llvm_parser.ml"
    ) = 
# 99 "llvm_parser.mly"
        ( [] )
# 6005 "llvm_parser.ml"
     in
    _menhir_goto_prog _menhir_env _menhir_stack _menhir_s _v) : 'freshtv4)

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TINT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | TSTRUCT _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | TVOID ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20

and _menhir_run153 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TINT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _v
    | TSTRUCT _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _v
    | TVOID ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState153
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState153

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and prog : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 72 "llvm_parser.mly"
      (Llvm_ast.prog)
# 6058 "llvm_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = Obj.magic ();
      _menhir_error = false;
    } in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DECLARE ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DEFINE ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | EOF ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LVAR _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState0 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 269 "<standard.mly>"
  

# 6088 "llvm_parser.ml"
