declare i8* @malloc(i32)
define i32 @factorial(i32 %n) {
factorial__entry:
  %temp3$3 = icmp sle i32 %n, 1
  br i1 %temp3$3, label %label1, label %label2
label1:
  ret i32 %n
label2:
  %temp10$8 = sub i32 %n, 1
  %temp8$9 = call i32 @factorial(i32 %temp10$8)
  %temp6$10 = mul i32 %n, %temp8$9
  ret i32 %temp6$10
}

define i32 @main() {
main__entry:
  %temp13$4 = call i32 @factorial(i32 10)
  ret i32 %temp13$4
}
