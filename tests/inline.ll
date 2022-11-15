declare i8* @malloc(i32)
define i32 @square(i32 %a) {
square__entry:
  %temp2$3 = mul i32 %a, %a
  ret i32 %temp2$3
}

define i32 @main() {
main__entry:
  %b$4 = call i32 @square(i32 2)
  %c$7 = call i32 @square(i32 %b$4)
  %temp9$10 = add i32 %b$4, %c$7
  ret i32 %temp9$10
}
