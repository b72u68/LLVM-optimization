declare i8* @malloc(i32)
define i32 @mod(i32 %a, i32 %b) {
mod__entry:
  %temp4$5 = icmp eq i32 %b, 0
  br i1 %temp4$5, label %label1, label %label2
label1:
  ret i32 -1
label2:
  br label %label3
label3:
  br label %label5
label5:
  %a$13 = phi i32 [%a$22, %label6], [%a, %label3]
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
  br label %label11
label11:
  %i$5 = bitcast i32 %temp21$2 to i32
  br label %label13
label13:
  %i$14 = phi i32 [%i$35, %label17], [%i$5, %label11]
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
  br label %label24
label24:
  br label %label35
label35:
  %temp68 = bitcast i32 %temp40$2 to i32
  br i1 %temp38$3, label %label43, label %label36
label36:
  br label %label37
label37:
  %temp70 = bitcast i32 %temp68 to i32
  br label %label38
label38:
  %temp71 = phi i32 [%temp77, %label42], [%temp70, %label37]
  %temp33$17 = icmp sle i32 %temp71, %n
  br i1 %temp33$17, label %label39, label %label40
label39:
  %temp73 = mul i32 %temp71, %temp71
  %temp28$32 = icmp sgt i32 %temp73, %n
  br i1 %temp28$32, label %label41, label %label42
label40:
  %temp75 = phi i32 [%temp76, %label41], [%temp71, %label38]
  %temp78 = bitcast i32 %temp75 to i32
  br label %label44
label41:
  %temp76 = sub i32 %temp71, 1
  br label %label40
label42:
  %temp77 = add i32 %temp71, 1
  br label %label38
label43:
  %temp79 = bitcast i32 %n to i32
  br label %label44
label44:
  %sroot$6 = phi i32 [%temp78, %label40], [%temp79, %label43]
  %result$7 = bitcast i32 1 to i32
  %i$8 = bitcast i32 2 to i32
  br label %label26
label26:
  %i$21 = phi i32 [%i$42, %label31], [%i$8, %label44]
  %temp56$24 = icmp sle i32 %i$21, %sroot$6
  br i1 %temp56$24, label %label27, label %label28
label27:
  br label %label45
label45:
  %temp4$5 = icmp eq i32 %i$21, 0
  br i1 %temp4$5, label %label46, label %label47
label46:
  %temp84 = bitcast i32 -1 to i32
  br label %label52
label47:
  br label %label48
label48:
  br label %label49
label49:
  %temp81 = phi i32 [%temp83, %label50], [%n, %label48]
  %temp13$16 = icmp sge i32 %temp81, %i$21
  br i1 %temp13$16, label %label50, label %label51
label50:
  %temp83 = sub i32 %temp81, %i$21
  br label %label49
label51:
  %temp85 = bitcast i32 %temp81 to i32
  br label %label52
label52:
  %temp46$37 = phi i32 [%temp84, %label46], [%temp85, %label51]
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
  br label %label31
label31:
  %i$42 = add i32 %i$21, 1
  br label %label26
}

define i32 @main() {
main__entry:
  br label %label53
label53:
  %temp86 = bitcast i32 1 to i32
  br label %label55
label54:
  %temp116 = bitcast i32 0 to i32
  br label %label81
label55:
  br label %label56
label56:
  br label %label57
label57:
  %temp88 = bitcast i32 %temp86 to i32
  br label %label58
label58:
  br label %label59
label59:
  %temp89 = bitcast i32 %temp88 to i32
  br label %label60
label60:
  %temp90 = phi i32 [%temp97, %label64], [%temp89, %label59]
  %temp33$17 = icmp sle i32 %temp90, 19
  br i1 %temp33$17, label %label61, label %label62
label61:
  %temp92 = mul i32 %temp90, %temp90
  %temp28$32 = icmp sgt i32 %temp92, 19
  br i1 %temp28$32, label %label63, label %label64
label62:
  %temp94 = phi i32 [%temp96, %label63], [%temp90, %label60]
  %temp95 = bitcast i32 %temp94 to i32
  br label %label66
label63:
  %temp96 = sub i32 %temp90, 1
  br label %label62
label64:
  %temp97 = add i32 %temp90, 1
  br label %label60
label65:
  %temp98 = bitcast i32 19 to i32
  br label %label66
label66:
  %temp99 = phi i32 [%temp95, %label62], [%temp98, %label65]
  %temp100 = bitcast i32 1 to i32
  %temp101 = bitcast i32 2 to i32
  br label %label67
label67:
  %temp102 = phi i32 [%temp115, %label80], [%temp101, %label66]
  %temp56$24 = icmp sle i32 %temp102, %temp99
  br i1 %temp56$24, label %label68, label %label77
label68:
  br label %label69
label69:
  %temp4$5 = icmp eq i32 %temp102, 0
  br i1 %temp4$5, label %label70, label %label71
label70:
  %temp105 = bitcast i32 -1 to i32
  br label %label76
label71:
  br label %label72
label72:
  br label %label73
label73:
  %temp106 = phi i32 [%temp108, %label74], [19, %label72]
  %temp13$16 = icmp sge i32 %temp106, %temp102
  br i1 %temp13$16, label %label74, label %label75
label74:
  %temp108 = sub i32 %temp106, %temp102
  br label %label73
label75:
  %temp109 = bitcast i32 %temp106 to i32
  br label %label76
label76:
  %temp110 = phi i32 [%temp105, %label70], [%temp109, %label75]
  %temp111 = bitcast i32 0 to i32
  %temp45$39 = icmp eq i32 %temp110, 0
  br i1 %temp45$39, label %label78, label %label79
label77:
  %temp113 = phi i32 [%temp114, %label78], [%temp100, %label67]
  %temp117 = bitcast i32 %temp113 to i32
  br label %label81
label78:
  %temp114 = bitcast i32 %temp111 to i32
  br label %label77
label79:
  br label %label80
label80:
  %temp115 = add i32 %temp102, 1
  br label %label67
label81:
  %temp65$12 = phi i32 [%temp116, %label54], [%temp117, %label77]
  ret i32 %temp65$12
}
