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
  %sroot$6 = call i32 @square_root(i32 %n)
  %result$7 = bitcast i32 %temp40$2 to i32
  %i$8 = bitcast i32 2 to i32
  br label %label26
label26:
  %i$21 = phi i32 [%i$42, %label30], [%i$8, %label23]
  %temp56$24 = icmp sle i32 %i$21, %sroot$6
  br i1 %temp56$24, label %label27, label %label28
label27:
  %temp46$37 = call i32 @mod(i32 %n, i32 %i$21)
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
  %result$9 = call i32 @is_prime(i32 19)
  %temp65$12 = call i32 @is_prime(i32 19)
  ret i32 %temp65$12
}
