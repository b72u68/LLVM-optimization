declare i8* @malloc(i32)
define i32 @square(i32 %a) {
square__entry:
  %temp2$3 = mul i32 %a, %a
  ret i32 %temp2$3
}

define i32 @main() {
main__entry:
  ret i32 20
}
