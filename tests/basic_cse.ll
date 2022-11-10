declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %b$1 = bitcast i32 3 to i32
  %c$2 = bitcast i32 4 to i32
  %a$5 = add i32 %b$1, %c$2
  %d$8 = add i32 %b$1, %c$2
  %e$8 = add i32 %b$1, %c$2
  ret i32 %e$8
}
