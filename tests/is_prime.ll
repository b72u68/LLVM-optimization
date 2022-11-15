declare i8* @malloc(i32)
define i32 @mod(i32 %a, i32 %b) {
mod__entry:
  %temp2 = bitcast i32 1 to i32
  %result = sub i32 0, %temp2
  %temp5 = bitcast i32 %b to i32
  %temp6 = bitcast i32 0 to i32
  %temp4 = icmp eq i32 %temp5, %temp6
  br i1 %temp4, label %label1, label %label2
label1:
  %temp3 = bitcast i32 %result to i32
  ret i32 %temp3
label4:
  br label %label3
label2:
  br label %label3
label3:
  br label %label5
label5:
  %temp14 = bitcast i32 %a to i32
  %temp15 = bitcast i32 %b to i32
  %temp13 = icmp sge i32 %temp14, %temp15
  br i1 %temp13, label %label6, label %label7
label6:
  %temp8 = bitcast i32 %a to i32
  %temp9 = bitcast i32 %b to i32
  %a = sub i32 %temp8, %temp9
  %temp7 = bitcast i32 %a to i32
  %temp11 = bitcast i32 %a to i32
  %temp12 = bitcast i32 %b to i32
  %result = sub i32 %temp11, %temp12
  %temp10 = bitcast i32 %result to i32
  br label %label5
label7:
  %result = bitcast i32 %a to i32
  %temp16 = bitcast i32 %result to i32
  %temp17 = bitcast i32 %result to i32
  ret i32 %temp17
label8:
  ret i32 0
}

define i32 @square_root(i32 %n) {
square_root__entry:
  %temp20 = bitcast i32 %n to i32
  %temp21 = bitcast i32 1 to i32
  %temp19 = icmp sle i32 %temp20, %temp21
  br i1 %temp19, label %label9, label %label10
label9:
  %temp18 = bitcast i32 %n to i32
  ret i32 %temp18
label12:
  br label %label11
label10:
  br label %label11
label11:
  %i = bitcast i32 1 to i32
  br label %label13
label13:
  %temp34 = bitcast i32 %i to i32
  %temp35 = bitcast i32 %n to i32
  %temp33 = icmp sle i32 %temp34, %temp35
  br i1 %temp33, label %label14, label %label15
label14:
  %temp31 = bitcast i32 %i to i32
  %temp32 = bitcast i32 %i to i32
  %temp29 = mul i32 %temp31, %temp32
  %temp30 = bitcast i32 %n to i32
  %temp28 = icmp sgt i32 %temp29, %temp30
  br i1 %temp28, label %label16, label %label17
label16:
  %temp23 = bitcast i32 %i to i32
  %temp24 = bitcast i32 1 to i32
  %i = sub i32 %temp23, %temp24
  %temp22 = bitcast i32 %i to i32
  br label %label15
label19:
  br label %label18
label17:
  %temp26 = bitcast i32 %i to i32
  %temp27 = bitcast i32 1 to i32
  %i = add i32 %temp26, %temp27
  %temp25 = bitcast i32 %i to i32
  br label %label13
label20:
  br label %label18
label18:
  br label %label13
label15:
  %temp36 = bitcast i32 %i to i32
  ret i32 %temp36
label21:
  ret i32 0
}

define i32 @is_prime(i32 %n) {
is_prime__entry:
  %temp39 = bitcast i32 %n to i32
  %temp40 = bitcast i32 1 to i32
  %temp38 = icmp sle i32 %temp39, %temp40
  br i1 %temp38, label %label22, label %label23
label22:
  %temp37 = bitcast i32 0 to i32
  ret i32 %temp37
label25:
  br label %label24
label23:
  br label %label24
label24:
  %temp41 = bitcast i32 (i32)* @square_root to i32 (i32)*
  %temp42 = bitcast i32 %n to i32
  %sroot = call i32 %temp41(i32 %temp42)
  %result = bitcast i32 1 to i32
  %i = bitcast i32 2 to i32
  %temp43 = bitcast i32 0 to i32
  br label %label26
label26:
  %temp57 = bitcast i32 %i to i32
  %temp58 = bitcast i32 %sroot to i32
  %temp56 = icmp sle i32 %temp57, %temp58
  br i1 %temp56, label %label27, label %label28
label27:
  %temp48 = bitcast i32 (i32, i32)* @mod to i32 (i32, i32)*
  %temp49 = bitcast i32 %n to i32
  %temp50 = bitcast i32 %i to i32
  %temp46 = call i32 %temp48(i32 %temp49, i32 %temp50)
  %temp47 = bitcast i32 0 to i32
  %temp45 = icmp eq i32 %temp46, %temp47
  br i1 %temp45, label %label29, label %label30
label29:
  %result = bitcast i32 0 to i32
  %temp44 = bitcast i32 %result to i32
  br label %label28
label32:
  br label %label31
label30:
  br label %label31
label31:
  %temp54 = bitcast i32 %i to i32
  %temp55 = bitcast i32 1 to i32
  %i = add i32 %temp54, %temp55
  %temp52 = bitcast i32 %i to i32
  %temp53 = bitcast i32 1 to i32
  %temp51 = sub i32 %temp52, %temp53
  br label %label26
label28:
  %temp59 = bitcast i32 %result to i32
  ret i32 %temp59
label33:
  ret i32 0
}

define i32 @main() {
main__entry:
  %padding = bitcast i32 10 to i32
  %n = bitcast i32 9 to i32
  %temp61 = bitcast i32 %n to i32
  %temp62 = bitcast i32 %padding to i32
  %n = add i32 %temp61, %temp62
  %temp60 = bitcast i32 %n to i32
  %temp63 = bitcast i32 (i32)* @is_prime to i32 (i32)*
  %temp64 = bitcast i32 %n to i32
  %result = call i32 %temp63(i32 %temp64)
  %temp66 = bitcast i32 (i32)* @is_prime to i32 (i32)*
  %temp67 = bitcast i32 %n to i32
  %temp65 = call i32 %temp66(i32 %temp67)
  ret i32 %temp65
label34:
  ret i32 0
}
