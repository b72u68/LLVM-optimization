declare i8* @malloc(i32)
define i32 @foo(i32 %i) {
foo__entry:
  %temp2$3 = add i32 %i, 1
  ret i32 %temp2$3
}

define i32 @main() {
main__entry:
  br label %label3
label3:
  br label %label4
label4:
  ret i32 3
}
