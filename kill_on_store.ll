declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp2_1$1 = call i8* @malloc(i32 4)
  %temp1_2$2 = bitcast i8* %temp2_1$1 to i32*
  %temp4_4$4 = bitcast i32 0 to i32
  %temp6_5$5 = bitcast i32* %temp1_2$2 to i32*
  %temp7_6$6 = bitcast i32 0 to i32
  %temp5_7$7 = getelementptr i32, i32* %temp6_5$5, i32 %temp7_6$6
  store i32 %temp4_4$4, i32* %temp5_7$7
  %temp10_9$9 = bitcast i32* %temp1_2$2 to i32*
  %temp11_10$10 = bitcast i32 %temp7_6$6 to i32
  %temp9_11$11 = getelementptr i32, i32* %temp10_9$9, i32 %temp11_10$10
  %temp13_14$13 = bitcast i32 1 to i32
  %temp15_15$14 = bitcast i32* %temp1_2$2 to i32*
  %temp16_16$15 = bitcast i32 %temp7_6$6 to i32
  %temp14_17$16 = getelementptr i32, i32* %temp15_15$14, i32 %temp16_16$15
  store i32 %temp13_14$13, i32* %temp14_17$16
  %c_23$17 = load i32, i32* %temp9_11$11
  ret i32 %c_23$17
  ret i32 0
}
