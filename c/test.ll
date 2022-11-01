define i32 @main() {
main__entry:
  %a__1 = call i32* @malloc(i32 50)
  %x__2 = call {i32, i32, i32}* @malloc(i32 3)
  %temp3__4 = getelementptr {i32, i32, i32}, {i32, i32, i32}* %x__2, i32 0, i32 0
  store i32 5, i32* %temp3__4
  %temp4__6 = bitcast {i32, i32, i32}* %x__2 to {i32, i32, i32}*
  %temp5__7 = getelementptr {i32, i32, i32}, {i32, i32, i32}* %temp4__6, i32 0, i32 0
  %r__8 = load i32, i32* %temp5__7
  br label %label1
label1:
  %i__20 = phi i32 [%i__62, %label2], [0, %main__entry]
  %temp16__23 = icmp slt i32 %i__20, 50
  br i1 %temp16__23, label %label2, label %label3
label2:
  %temp10__58 = getelementptr i32, i32* %a__1, i32 %i__20
  store i32 %i__20, i32* %temp10__58
  %i__62 = add i32 %i__20, 1
  br label %label1
label3:
  br label %label4
label4:
  %r__37 = phi i32 [%r__48, %label5], [%r__8, %label3]
  %i__38 = phi i32 [%i__52, %label5], [0, %label3]
  %temp31__41 = icmp slt i32 %i__38, 50
  br i1 %temp31__41, label %label5, label %label6
label5:
  %temp23__44 = bitcast i32* %a__1 to i32*
  %temp25__46 = getelementptr i32, i32* %temp23__44, i32 %i__38
  %temp22__47 = load i32, i32* %temp25__46
  %r__48 = add i32 %r__37, %temp22__47
  %i__52 = add i32 %i__38, 1
  br label %label4
label6:
  ret i32 %r__37
}
