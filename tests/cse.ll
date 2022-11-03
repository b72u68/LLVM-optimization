declare i8* @malloc(i32)
define i32 @cse_test(i32 %a, i32 %b) {
cse_test__entry:
  %c$3 = add i32 %a, %b
  ret i32 %c$3
}

define i32 @main() {
main__entry:
  %temp8$3 = bitcast i32 (i32, i32)* @cse_test to i32 (i32, i32)*
  %temp7$6 = call i32 %temp8$3(i32 2, i32 3)
  ret i32 %temp7$6
}
