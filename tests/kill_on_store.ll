declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp2$1 = call i8* @malloc(i32 4)
  %temp1$2 = bitcast i8* %temp2$1 to i32*
  %a$3 = bitcast i32* %temp1$2 to i32*
  %temp4$4 = bitcast i32 0 to i32
  %temp6$5 = bitcast i32* %a$3 to i32*
  %temp7$6 = bitcast i32 0 to i32
  %temp5$7 = getelementptr i32, i32* %temp6$5, i32 %temp7$6
  store i32 %temp4$4, i32* %temp5$7
  %temp3$8 = bitcast i32 %temp4$4 to i32
  %temp10$9 = bitcast i32* %a$3 to i32*
  %temp11$10 = bitcast i32 0 to i32
  %temp9$11 = getelementptr i32, i32* %temp10$9, i32 %temp11$10
  %b$13 = load i32, i32* %temp9$11

  %temp13$14 = bitcast i32 1 to i32
  %temp15$15 = bitcast i32* %a$3 to i32*
  %temp16$16 = bitcast i32 0 to i32
  %temp14$17 = getelementptr i32, i32* %temp15$15, i32 %temp16$16
  store i32 %temp13$14, i32* %temp14$17

  %c$23 = load i32, i32* %temp9$11
  %temp21$24 = bitcast i32 %c$23 to i32
  ret i32 %temp21$24
  ret i32 0
}
