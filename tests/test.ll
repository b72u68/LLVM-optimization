declare i8* @malloc(i32)
define i32 @test(i32 %a, i32 %b) {
test__entry:
  %i$1 = bitcast i32 0 to i32
  br label %label1
label1:
  %result$16 = phi i32 [%result$33, %label6], [0, %test__entry]
  %i$17 = phi i32 [%i$42, %label6], [%i$1, %test__entry]
  %temp16$20 = icmp slt i32 %i$17, %a
  br i1 %temp16$20, label %label2, label %label3
label2:
  %result$33 = add i32 %result$16, %b
  %temp8$38 = sdiv i32 %b, 2
  %temp6$39 = icmp sgt i32 %i$17, %temp8$38
  br i1 %temp6$39, label %label4, label %label5
label3:
  %result$29 = phi i32 [%result$33, %label4], [%result$16, %label1]
  ret i32 %result$29
label4:
  br label %label3
label5:
  br label %label6
label6:
  %i$42 = add i32 %i$17, 1
  br label %label1
}

define i32 @main() {
main__entry:
  br label %label10
label10:
  %temp24 = bitcast i32 0 to i32
  br label %label11
label11:
  %temp25 = phi i32 [%temp28, %label16], [0, %label10]
  %temp26 = phi i32 [%temp32, %label16], [%temp24, %label10]
  %temp16$20 = icmp slt i32 %temp26, 2
  br i1 %temp16$20, label %label12, label %label13
label12:
  %temp28 = add i32 %temp25, 3
  %temp6$39 = icmp sgt i32 %temp26, 1
  br i1 %temp6$39, label %label14, label %label15
label13:
  %temp31 = phi i32 [%temp28, %label14], [%temp25, %label11]
  br label %label17
label14:
  br label %label13
label15:
  br label %label16
label16:
  %temp32 = add i32 %temp26, 1
  br label %label11
label17:
  ret i32 %temp31
}
