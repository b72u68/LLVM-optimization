declare i8* @malloc(i32)
define i32 @mod(i32 %a, i32 %b) {
mod__entry:
  %temp2$1 = bitcast i32 1 to i32
  %result$2 = sub i32 0, %temp2$1
  %temp5$3 = bitcast i32 %b to i32
  %temp6$4 = bitcast i32 0 to i32
  %temp4$5 = icmp eq i32 %temp5$3, %temp6$4
  br i1 %temp4$5, label %label1, label %label2
label1:
  %temp3$28 = bitcast i32 %result$2 to i32
  ret i32 %temp3$28
label2:
  br label %label3
label3:
  br label %label5
label5:
  %temp9$6 = phi i32 [%temp9$21, %label6], [0, %label3]
  %temp8$7 = phi i32 [%temp8$20, %label6], [0, %label3]
  %temp7$8 = phi i32 [%temp7$23, %label6], [0, %label3]
  %temp12$9 = phi i32 [%temp12$25, %label6], [0, %label3]
  %temp11$10 = phi i32 [%temp11$24, %label6], [0, %label3]
  %temp10$11 = phi i32 [%temp10$27, %label6], [0, %label3]
  %result$12 = phi i32 [%result$26, %label6], [%result$2, %label3]
  %a$13 = phi i32 [%a$22, %label6], [%a, %label3]
  %temp14$14 = bitcast i32 %a$13 to i32
  %temp15$15 = bitcast i32 %b to i32
  %temp13$16 = icmp sge i32 %temp14$14, %temp15$15
  br i1 %temp13$16, label %label6, label %label7
label6:
  %temp8$20 = bitcast i32 %a$13 to i32
  %temp9$21 = bitcast i32 %b to i32
  %a$22 = sub i32 %temp8$20, %temp9$21
  %temp7$23 = bitcast i32 %a$22 to i32
  %temp11$24 = bitcast i32 %a$22 to i32
  %temp12$25 = bitcast i32 %b to i32
  %result$26 = sub i32 %temp11$24, %temp12$25
  %temp10$27 = bitcast i32 %result$26 to i32
  br label %label5
label7:
  %result$17 = bitcast i32 %a$13 to i32
  %temp16$18 = bitcast i32 %result$17 to i32
  %temp17$19 = bitcast i32 %result$17 to i32
  ret i32 %temp17$19
}

define i32 @square_root(i32 %n) {
square_root__entry:
  %temp20$1 = bitcast i32 %n to i32
  %temp21$2 = bitcast i32 1 to i32
  %temp19$3 = icmp sle i32 %temp20$1, %temp21$2
  br i1 %temp19$3, label %label9, label %label10
label10:
  br label %label11
label11:
  %i$5 = bitcast i32 1 to i32
  br label %label13
label13:
  %temp32$6 = phi i32 [%temp32$29, %label17], [0, %label11]
  %temp31$7 = phi i32 [%temp31$28, %label17], [0, %label11]
  %temp30$8 = phi i32 [%temp30$31, %label17], [0, %label11]
  %temp29$9 = phi i32 [%temp29$30, %label17], [0, %label11]
  %temp28$10 = phi i1 [%temp28$32, %label17], [0, %label11]
  %temp27$11 = phi i32 [%temp27$34, %label17], [0, %label11]
  %temp26$12 = phi i32 [%temp26$33, %label17], [0, %label11]
  %temp25$13 = phi i32 [%temp25$36, %label17], [0, %label11]
  %i$14 = phi i32 [%i$35, %label17], [%i$5, %label11]
  %temp34$15 = bitcast i32 %i$14 to i32
  %temp35$16 = bitcast i32 %n to i32
  %temp33$17 = icmp sle i32 %temp34$15, %temp35$16
  br i1 %temp33$17, label %label14, label %label15
label14:
  %temp31$28 = bitcast i32 %i$14 to i32
  %temp32$29 = bitcast i32 %i$14 to i32
  %temp29$30 = mul i32 %temp31$28, %temp32$29
  %temp30$31 = bitcast i32 %n to i32
  %temp28$32 = icmp sgt i32 %temp29$30, %temp30$31
  br i1 %temp28$32, label %label16, label %label17
label15:
  %temp32$18 = phi i32 [%temp32$29, %label16], [%temp32$6, %label13]
  %temp31$19 = phi i32 [%temp31$28, %label16], [%temp31$7, %label13]
  %temp30$20 = phi i32 [%temp30$31, %label16], [%temp30$8, %label13]
  %temp29$21 = phi i32 [%temp29$30, %label16], [%temp29$9, %label13]
  %temp28$22 = phi i1 [%temp28$32, %label16], [%temp28$10, %label13]
  %temp24$23 = phi i32 [%temp24$38, %label16], [0, %label13]
  %temp23$24 = phi i32 [%temp23$37, %label16], [0, %label13]
  %temp22$25 = phi i32 [%temp22$40, %label16], [0, %label13]
  %i$26 = phi i32 [%i$39, %label16], [%i$14, %label13]
  %temp36$27 = bitcast i32 %i$26 to i32
  ret i32 %temp36$27
label16:
  %temp23$37 = bitcast i32 %i$14 to i32
  %temp24$38 = bitcast i32 1 to i32
  %i$39 = sub i32 %temp23$37, %temp24$38
  %temp22$40 = bitcast i32 %i$39 to i32
  br label %label15
label17:
  %temp26$33 = bitcast i32 %i$14 to i32
  %temp27$34 = bitcast i32 1 to i32
  %i$35 = add i32 %temp26$33, %temp27$34
  %temp25$36 = bitcast i32 %i$35 to i32
  br label %label13
label9:
  %temp18$4 = bitcast i32 %n to i32
  ret i32 %temp18$4
}

define i32 @is_prime(i32 %n) {
is_prime__entry:
  %temp39$1 = bitcast i32 %n to i32
  %temp40$2 = bitcast i32 1 to i32
  %temp38$3 = icmp sle i32 %temp39$1, %temp40$2
  br i1 %temp38$3, label %label22, label %label23
label22:
  %temp37$48 = bitcast i32 0 to i32
  ret i32 %temp37$48
label23:
  br label %label24
label24:
  %temp41$4 = bitcast i32 (i32)* @square_root to i32 (i32)*
  %temp42$5 = bitcast i32 %n to i32
  %sroot$6 = call i32 %temp41$4(i32 %temp42$5)
  %result$7 = bitcast i32 1 to i32
  %i$8 = bitcast i32 2 to i32
  %temp43$9 = bitcast i32 0 to i32
  br label %label26
label26:
  %temp55$10 = phi i32 [%temp55$41, %label31], [0, %label24]
  %temp54$11 = phi i32 [%temp54$40, %label31], [0, %label24]
  %temp53$12 = phi i32 [%temp53$44, %label31], [0, %label24]
  %temp52$13 = phi i32 [%temp52$43, %label31], [0, %label24]
  %temp51$14 = phi i32 [%temp51$45, %label31], [0, %label24]
  %temp50$15 = phi i32 [%temp50$36, %label31], [0, %label24]
  %temp49$16 = phi i32 [%temp49$35, %label31], [0, %label24]
  %temp48$17 = phi i32 (i32, i32)* [%temp48$34, %label31], [null, %label24]
  %temp47$18 = phi i32 [%temp47$38, %label31], [0, %label24]
  %temp46$19 = phi i32 [%temp46$37, %label31], [0, %label24]
  %temp45$20 = phi i1 [%temp45$39, %label31], [0, %label24]
  %i$21 = phi i32 [%i$42, %label31], [%i$8, %label24]
  %temp57$22 = bitcast i32 %i$21 to i32
  %temp58$23 = bitcast i32 %sroot$6 to i32
  %temp56$24 = icmp sle i32 %temp57$22, %temp58$23
  br i1 %temp56$24, label %label27, label %label28
label27:
  %temp48$34 = bitcast i32 (i32, i32)* @mod to i32 (i32, i32)*
  %temp49$35 = bitcast i32 %n to i32
  %temp50$36 = bitcast i32 %i$21 to i32
  %temp46$37 = call i32 %temp48$34(i32 %temp49$35, i32 %temp50$36)
  %temp47$38 = bitcast i32 0 to i32
  %temp45$39 = icmp eq i32 %temp46$37, %temp47$38
  br i1 %temp45$39, label %label29, label %label30
label28:
  %temp50$25 = phi i32 [%temp50$36, %label29], [%temp50$15, %label26]
  %temp49$26 = phi i32 [%temp49$35, %label29], [%temp49$16, %label26]
  %temp48$27 = phi i32 (i32, i32)* [%temp48$34, %label29], [%temp48$17, %label26]
  %temp47$28 = phi i32 [%temp47$38, %label29], [%temp47$18, %label26]
  %temp46$29 = phi i32 [%temp46$37, %label29], [%temp46$19, %label26]
  %temp45$30 = phi i1 [%temp45$39, %label29], [%temp45$20, %label26]
  %temp44$31 = phi i32 [%temp44$47, %label29], [0, %label26]
  %result$32 = phi i32 [%result$46, %label29], [%result$7, %label26]
  %temp59$33 = bitcast i32 %result$32 to i32
  ret i32 %temp59$33
label29:
  %result$46 = bitcast i32 0 to i32
  %temp44$47 = bitcast i32 %result$46 to i32
  br label %label28
label30:
  br label %label31
label31:
  %temp54$40 = bitcast i32 %i$21 to i32
  %temp55$41 = bitcast i32 1 to i32
  %i$42 = add i32 %temp54$40, %temp55$41
  %temp52$43 = bitcast i32 %i$42 to i32
  %temp53$44 = bitcast i32 1 to i32
  %temp51$45 = sub i32 %temp52$43, %temp53$44
  br label %label26
}

define i32 @main() {
main__entry:
  %padding$1 = bitcast i32 10 to i32
  %n$2 = bitcast i32 9 to i32
  %temp61$3 = bitcast i32 %n$2 to i32
  %temp62$4 = bitcast i32 %padding$1 to i32
  %n$5 = add i32 %temp61$3, %temp62$4
  %temp60$6 = bitcast i32 %n$5 to i32
  %temp63$7 = bitcast i32 (i32)* @is_prime to i32 (i32)*
  %temp64$8 = bitcast i32 %n$5 to i32
  %result$9 = call i32 %temp63$7(i32 %temp64$8)
  %temp66$10 = bitcast i32 (i32)* @is_prime to i32 (i32)*
  %temp67$11 = bitcast i32 %n$5 to i32
  %temp65$12 = call i32 %temp66$10(i32 %temp67$11)
  ret i32 %temp65$12
}
