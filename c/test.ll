%blah = type { i32, i32, i32
}
declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp2$1 = call i8* @malloc(i32 200)
  %a$2 = bitcast i8* %temp2$1 to i32*
  %temp3$3 = call i8* @malloc(i32 12)
  %x$4 = bitcast i8* %temp3$3 to %blah*
  %temp5$5 = bitcast i32 5 to i32
  %temp6$6 = getelementptr %blah, %blah* %x$4, i32 0, i32 0
  store i32 %temp5$5, i32* %temp6$6
  %temp4$7 = bitcast i32 %temp5$5 to i32
  %temp7$8 = bitcast %blah* %x$4 to %blah*
  %temp8$9 = getelementptr %blah, %blah* %temp7$8, i32 0, i32 0
  %r$10 = load i32, i32* %temp8$9
  %i$11 = bitcast i32 0 to i32
  %temp9$12 = bitcast i32 0 to i32
  br label %label1
label1:
  %temp18$13 = phi i32 [%temp18$63, %label2], [0, %main__entry]
  %temp17$14 = phi i32 [%temp17$62, %label2], [0, %main__entry]
  %temp16$15 = phi i32 [%temp16$66, %label2], [0, %main__entry]
  %temp15$16 = phi i32 [%temp15$65, %label2], [0, %main__entry]
  %temp14$17 = phi i32 [%temp14$67, %label2], [0, %main__entry]
  %temp13$18 = phi i32* [%temp13$60, %label2], [null, %main__entry]
  %temp12$19 = phi i32 [%temp12$59, %label2], [0, %main__entry]
  %temp11$20 = phi i32 [%temp11$58, %label2], [0, %main__entry]
  %temp10$21 = phi i32 [%temp10$61, %label2], [0, %main__entry]
  %i$22 = phi i32 [%i$64, %label2], [%i$11, %main__entry]
  %temp20$23 = bitcast i32 %i$22 to i32
  %temp21$24 = bitcast i32 50 to i32
  %temp19$25 = icmp slt i32 %temp20$23, %temp21$24
  br i1 %temp19$25, label %label2, label %label3
label2:
  %temp11$58 = bitcast i32 %i$22 to i32
  %temp12$59 = bitcast i32 %i$22 to i32
  %temp13$60 = getelementptr i32, i32* %a$2, i32 %temp11$58
  store i32 %temp12$59, i32* %temp13$60
  %temp10$61 = bitcast i32 %temp12$59 to i32
  %temp17$62 = bitcast i32 %i$22 to i32
  %temp18$63 = bitcast i32 1 to i32
  %i$64 = add i32 %temp17$62, %temp18$63
  %temp15$65 = bitcast i32 %i$64 to i32
  %temp16$66 = bitcast i32 1 to i32
  %temp14$67 = sub i32 %temp15$65, %temp16$66
  br label %label1
label3:
  %i$26 = bitcast i32 0 to i32
  %temp22$27 = bitcast i32 0 to i32
  br label %label4
label4:
  %temp33$28 = phi i32 [%temp33$53, %label5], [0, %label3]
  %temp32$29 = phi i32 [%temp32$52, %label5], [0, %label3]
  %temp31$30 = phi i32 [%temp31$56, %label5], [0, %label3]
  %temp30$31 = phi i32 [%temp30$55, %label5], [0, %label3]
  %temp29$32 = phi i32 [%temp29$57, %label5], [0, %label3]
  %temp28$33 = phi i32* [%temp28$48, %label5], [null, %label3]
  %temp27$34 = phi i32 [%temp27$47, %label5], [0, %label3]
  %temp26$35 = phi i32* [%temp26$46, %label5], [null, %label3]
  %temp25$36 = phi i32 [%temp25$49, %label5], [0, %label3]
  %temp24$37 = phi i32 [%temp24$45, %label5], [0, %label3]
  %temp23$38 = phi i32 [%temp23$51, %label5], [0, %label3]
  %r$39 = phi i32 [%r$50, %label5], [%r$10, %label3]
  %i$40 = phi i32 [%i$54, %label5], [%i$26, %label3]
  %temp35$41 = bitcast i32 %i$40 to i32
  %temp36$42 = bitcast i32 50 to i32
  %temp34$43 = icmp slt i32 %temp35$41, %temp36$42
  br i1 %temp34$43, label %label5, label %label6
label5:
  %temp24$45 = bitcast i32 %r$39 to i32
  %temp26$46 = bitcast i32* %a$2 to i32*
  %temp27$47 = bitcast i32 %i$40 to i32
  %temp28$48 = getelementptr i32, i32* %temp26$46, i32 %temp27$47
  %temp25$49 = load i32, i32* %temp28$48
  %r$50 = add i32 %temp24$45, %temp25$49
  %temp23$51 = bitcast i32 %r$50 to i32
  %temp32$52 = bitcast i32 %i$40 to i32
  %temp33$53 = bitcast i32 1 to i32
  %i$54 = add i32 %temp32$52, %temp33$53
  %temp30$55 = bitcast i32 %i$54 to i32
  %temp31$56 = bitcast i32 1 to i32
  %temp29$57 = sub i32 %temp30$55, %temp31$56
  br label %label4
label6:
  %temp37$44 = bitcast i32 %r$39 to i32
  ret i32 %temp37$44
}
