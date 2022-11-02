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
  %temp7$8 = bitcast %blah* %temp3$3 to %blah*
  %temp8$9 = getelementptr %blah, %blah* %temp7$8, i32 0, i32 0
  %r$10 = load i32, i32* %temp8$9
  %i$11 = bitcast i32 0 to i32
  br label %label1
label1:
  %i$22 = phi i32 [%i$64, %label2], [%i$11, %main__entry]
  %temp19$25 = icmp slt i32 %i$22, 50
  br i1 %temp19$25, label %label2, label %label3
label2:
  %temp11$58 = bitcast i32 %i$22 to i32
  %temp12$59 = bitcast i32 %i$22 to i32
  %temp13$60 = getelementptr i32, i32* %a$2, i32 %temp11$58
  store i32 %temp12$59, i32* %temp13$60
  %i$64 = add i32 %i$22, 1
  br label %label1
label3:
  %i$26 = bitcast i32 0 to i32
  br label %label4
label4:
  %r$39 = phi i32 [%r$50, %label5], [%r$10, %label3]
  %i$40 = phi i32 [%i$54, %label5], [%i$26, %label3]
  %temp34$43 = icmp slt i32 %i$40, 50
  br i1 %temp34$43, label %label5, label %label6
label5:
  %temp26$46 = bitcast i32* %temp2$1 to i32*
  %temp27$47 = bitcast i32 %i$40 to i32
  %temp28$48 = getelementptr i32, i32* %temp26$46, i32 %temp27$47
  %temp25$49 = load i32, i32* %temp28$48
  %r$50 = add i32 %r$39, %temp25$49
  %i$54 = add i32 %i$40, 1
  br label %label4
label6:
  ret i32 %r$39
}
