declare i8* @malloc(i32)
define i32 @test(i32 %a, i32 %b) {
test__entry:
  %temp5$3 = add i32 %a, %b
  %temp4$5 = icmp sgt i32 %temp5$3, 4
  br i1 %temp4$5, label %label1, label %label2
label1:
  %result$12 = bitcast i32 1 to i32
  br label %label3
label2:
  %result$10 = bitcast i32 2 to i32
  br label %label3
label3:
  %result$8 = phi i32 [%result$12, %label1], [%result$10, %label2]
  ret i32 %result$8
}

define i32 @main() {
main__entry:
  %temp10$6 = call i32 @test(i32 2, i32 3)
  ret i32 %temp10$6
}
