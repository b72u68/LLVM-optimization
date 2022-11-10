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
  %temp12 = mul i32 2, 2
  %b$4 = bitcast i32 %temp12 to i32
  br label %label4
label4:
  br label %label5
label5:
  %temp13 = mul i32 %b$4, %b$4
  %c$7 = bitcast i32 %temp13 to i32
  br label %label6
label6:
  %temp9$10 = add i32 %b$4, %c$7
  ret i32 %temp9$10
}
