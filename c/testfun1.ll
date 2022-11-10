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
  %temp8 = add i32 2, 1
  %temp5$3 = bitcast i32 %temp8 to i32
  br label %label4
label4:
  ret i32 %temp5$3
}
