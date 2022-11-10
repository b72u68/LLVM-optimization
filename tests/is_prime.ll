declare i8* @malloc(i32)
define i32 @mod(i32 %a, i32 %b) {
mod__entry:
  %temp4$5 = icmp eq i32 %b, 0
  br i1 %temp4$5, label %label1, label %label2
label1:
  ret i32 -1
label2:
  br label %label5
label5:
  %a$13 = phi i32 [%a$22, %label6], [%a, %label2]
  %temp13$16 = icmp sge i32 %a$13, %b
  br i1 %temp13$16, label %label6, label %label7
label6:
  %a$22 = sub i32 %a$13, %b
  br label %label5
label7:
  ret i32 %a$13
}

define i32 @square_root(i32 %n) {
square_root__entry:
  %temp21$2 = bitcast i32 1 to i32
  %temp19$3 = icmp sle i32 %n, 1
  br i1 %temp19$3, label %label9, label %label10
label10:
  %i$5 = bitcast i32 %temp21$2 to i32
  br label %label13
label13:
  %i$14 = phi i32 [%i$35, %label17], [%i$5, %label10]
  %temp33$17 = icmp sle i32 %i$14, %n
  br i1 %temp33$17, label %label14, label %label15
label14:
  %temp29$30 = mul i32 %i$14, %i$14
  %temp28$32 = icmp sgt i32 %temp29$30, %n
  br i1 %temp28$32, label %label16, label %label17
label15:
  %i$26 = phi i32 [%i$39, %label16], [%i$14, %label13]
  ret i32 %i$26
label16:
  %i$39 = sub i32 %i$14, 1
  br label %label15
label17:
  %i$35 = add i32 %i$14, 1
  br label %label13
label9:
  ret i32 %n
}

define i32 @is_prime(i32 %n) {
is_prime__entry:
  %temp40$2 = bitcast i32 1 to i32
  %temp38$3 = icmp sle i32 %n, 1
  br i1 %temp38$3, label %label22, label %label23
label22:
  ret i32 0
label23:
  %temp68 = bitcast i32 %temp40$2 to i32
  br i1 %temp38$3, label %label42, label %label36
label36:
  %temp70 = bitcast i32 %temp68 to i32
  br label %label37
label37:
  %temp71 = phi i32 [%temp77, %label41], [%temp70, %label36]
  %temp33$17 = icmp sle i32 %temp71, %n
  br i1 %temp33$17, label %label38, label %label39
label38:
  %temp73 = mul i32 %temp71, %temp71
  %temp28$32 = icmp sgt i32 %temp73, %n
  br i1 %temp28$32, label %label40, label %label41
label39:
  %temp75 = phi i32 [%temp76, %label40], [%temp71, %label37]
  %temp78 = bitcast i32 %temp75 to i32
  br label %label43
label40:
  %temp76 = sub i32 %temp71, 1
  br label %label39
label41:
  %temp77 = add i32 %temp71, 1
  br label %label37
label42:
  %temp79 = bitcast i32 %n to i32
  br label %label43
label43:
  %sroot$6 = phi i32 [%temp78, %label39], [%temp79, %label42]
  %result$7 = bitcast i32 1 to i32
  %i$8 = bitcast i32 2 to i32
  br label %label26
label26:
  %i$21 = phi i32 [%i$42, %label30], [%i$8, %label43]
  %temp56$24 = icmp sle i32 %i$21, %sroot$6
  br i1 %temp56$24, label %label27, label %label28
label27:
  %temp4$5 = icmp eq i32 %i$21, 0
  br i1 %temp4$5, label %label45, label %label46
label45:
  %temp84 = bitcast i32 -1 to i32
  br label %label50
label46:
  br label %label47
label47:
  %temp81 = phi i32 [%temp83, %label48], [%n, %label46]
  %temp13$16 = icmp sge i32 %temp81, %i$21
  br i1 %temp13$16, label %label48, label %label49
label48:
  %temp83 = sub i32 %temp81, %i$21
  br label %label47
label49:
  %temp85 = bitcast i32 %temp81 to i32
  br label %label50
label50:
  %temp46$37 = phi i32 [%temp84, %label45], [%temp85, %label49]
  %temp47$38 = bitcast i32 0 to i32
  %temp45$39 = icmp eq i32 %temp46$37, 0
  br i1 %temp45$39, label %label29, label %label30
label28:
  %result$32 = phi i32 [%result$46, %label29], [%result$7, %label26]
  ret i32 %result$32
label29:
  %result$46 = bitcast i32 %temp47$38 to i32
  br label %label28
label30:
  %i$42 = add i32 %i$21, 1
  br label %label26
}

define i32 @main() {
main__entry:
  br label %label55
label55:
  %temp90 = bitcast i32 %temp97 to i32
  %temp33$17 = icmp sle i32 %temp97, 19
  br i1 %temp33$17, label %label56, label %label57
label56:
  %temp92 = mul i32 %temp97, %temp97
  %temp28$32 = icmp sgt i32 %temp92, 19
  br i1 %temp28$32, label %label58, label %label59
label57:
  %temp94 = phi i32 [%temp96, %label58], [%temp90, %label55]
  %temp100 = bitcast i32 1 to i32
  %temp101 = bitcast i32 2 to i32
  br label %label62
label58:
  %temp96 = sub i32 %temp97, 1
  br label %label57
label59:
  %temp97 = add i32 %temp97, 1
  br label %label55
label62:
  %temp102 = phi i32 [%temp115, %label72], [%temp101, %label57]
  %temp56$24 = icmp sle i32 %temp102, %temp94
  br i1 %temp56$24, label %label63, label %label70
label63:
  %temp4$5 = icmp eq i32 %temp102, 0
  br i1 %temp4$5, label %label64, label %label65
label64:
  %temp105 = bitcast i32 -1 to i32
  br label %label69
label65:
  br label %label66
label66:
  %temp106 = phi i32 [%temp108, %label67], [19, %label65]
  %temp13$16 = icmp sge i32 %temp106, %temp102
  br i1 %temp13$16, label %label67, label %label68
label67:
  %temp108 = sub i32 %temp106, %temp102
  br label %label66
label68:
  %temp109 = bitcast i32 %temp106 to i32
  br label %label69
label69:
  %temp110 = phi i32 [%temp105, %label64], [%temp109, %label68]
  %temp111 = bitcast i32 0 to i32
  %temp45$39 = icmp eq i32 %temp110, 0
  br i1 %temp45$39, label %label71, label %label72
label70:
  %temp113 = phi i32 [%temp114, %label71], [%temp100, %label62]
  ret i32 %temp113
label71:
  %temp114 = bitcast i32 %temp111 to i32
  br label %label70
label72:
  %temp115 = add i32 %temp102, 1
  br label %label62
}
