declare i8* @malloc(i32)
define i32 @foo(i32 %i) {
foo__entry:
  %temp2$3 = add i32 %i, 1
  ret i32 %temp2$3
}

define i32 @main() {
main__entry:
  %temp6$1 = bitcast i32 (i32)* @foo to i32 (i32)*
  %temp5$3 = call i32 %temp6$1(i32 2)
  ret i32 %temp5$3
}
