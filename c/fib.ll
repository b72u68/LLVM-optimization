declare i8* @malloc(i32)
define i32 @fib(i32 %n) {
fib__entry:
  %temp14$3 = icmp sle i32 %n, 1
  br i1 %temp14$3, label %label1, label %label2
label1:
  ret i32 %n
label2:
  %temp7$7 = sub i32 %n, 2
  %temp4$8 = call i32 @fib(i32 %temp7$7)
  %temp11$12 = sub i32 %n, 1
  %temp5$13 = call i32 @fib(i32 %temp11$12)
  %temp3$14 = add i32 %temp4$8, %temp5$13
  ret i32 %temp3$14
}

define i32 @main() {
main__entry:
  %temp17$3 = call i32 @fib(i32 5)
  ret i32 %temp17$3
}
