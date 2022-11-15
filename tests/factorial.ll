declare i8* @malloc(i32)
define i32 @factorial(i32 %n) {
factorial__entry:
  %temp4$1 = bitcast i32 %n to i32
  %temp5$2 = bitcast i32 1 to i32
  %temp3$3 = icmp sle i32 %temp4$1, %temp5$2
  br i1 %temp3$3, label %label1, label %label2
label1:
  %temp2$11 = bitcast i32 %n to i32
  ret i32 %temp2$11
label2:
  br label %label3
label3:
  %temp7$4 = bitcast i32 %n to i32
  %temp9$5 = bitcast i32 (i32)* @factorial to i32 (i32)*
  %temp11$6 = bitcast i32 %n to i32
  %temp12$7 = bitcast i32 1 to i32
  %temp10$8 = sub i32 %temp11$6, %temp12$7
  %temp8$9 = call i32 %temp9$5(i32 %temp10$8)
  %temp6$10 = mul i32 %temp7$4, %temp8$9
  ret i32 %temp6$10
}

define i32 @main() {
main__entry:
  %n$1 = bitcast i32 10 to i32
  %temp14$2 = bitcast i32 (i32)* @factorial to i32 (i32)*
  %temp15$3 = bitcast i32 %n$1 to i32
  %temp13$4 = call i32 %temp14$2(i32 %temp15$3)
  ret i32 %temp13$4
}
