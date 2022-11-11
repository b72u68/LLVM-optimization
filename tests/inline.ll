declare i8* @malloc(i32)
define i32 @square(i32 %a) {
square__entry:
  %temp2$3 = mul i32 %a, %a
  ret i32 %temp2$3
}

define i32 @main() {
main__entry:
  br label %label3
label3:
  br label %label4
label4:
  br label %label5
label5:
  br label %label6
label6:
  ret i32 20
}
