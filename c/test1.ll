declare i8* @malloc(i32)
define i32 @foo(i32 %a) {
foo__entry:
  %temp2$3 = add i32 %a, 1
  ret i32 %temp2$3
}

define i32 @main() {
main__entry:
  %r$1 = bitcast i32 0 to i32
  %i$2 = bitcast i32 0 to i32
  br label %label2
label2:
  %r$12 = phi i32 [%r$163, %label3], [%r$1, %main__entry]
  %i$13 = phi i32 [%i$167, %label3], [%i$2, %main__entry]
  %temp14$16 = icmp slt i32 %i$13, 50
  br i1 %temp14$16, label %label3, label %label4
label3:
  %r$163 = add i32 %r$12, %i$13
  %i$167 = add i32 %i$13, 1
  br label %label2
label4:
  %a$19 = add i32 %r$12, 1
  %b$22 = add i32 %a$19, 1
  %c$25 = add i32 %b$22, 1
  %d$28 = add i32 %c$25, 1
  %e$31 = add i32 %d$28, 1
  %f$34 = add i32 %e$31, 1
  %g$37 = add i32 %f$34, 1
  %h$40 = add i32 %g$37, 1
  %i$43 = add i32 %h$40, 1
  %j$46 = add i32 %i$43, 1
  %k$49 = add i32 %j$46, 1
  %l$52 = add i32 %k$49, 1
  %m$55 = add i32 %l$52, 1
  %n$58 = add i32 %m$55, 1
  %o$61 = add i32 %n$58, 1
  %p$64 = add i32 %o$61, 1
  %q$67 = add i32 %p$64, 1
  %r$70 = add i32 %q$67, 1
  %s$73 = add i32 %r$70, 1
  %t$76 = add i32 %s$73, 1
  %u$79 = add i32 %t$76, 1
  %v$82 = add i32 %u$79, 1
  %w$85 = add i32 %v$82, 1
  %x$88 = add i32 %w$85, 1
  %y$91 = add i32 %x$88, 1
  %z$94 = add i32 %y$91, 1
  %za$97 = add i32 %z$94, 1
  %zb$100 = add i32 %za$97, 1
  %temp73$101 = bitcast i32 (i32)* @foo to i32 (i32)*
  %zc$103 = call i32 %temp73$101(i32 %zb$100)
  %temp128$106 = add i32 %a$19, %b$22
  %temp126$108 = add i32 %temp128$106, %c$25
  %temp124$110 = add i32 %temp126$108, %d$28
  %temp122$112 = add i32 %temp124$110, %e$31
  %temp120$114 = add i32 %temp122$112, %f$34
  %temp118$116 = add i32 %temp120$114, %g$37
  %temp116$118 = add i32 %temp118$116, %h$40
  %temp114$120 = add i32 %temp116$118, %i$43
  %temp112$122 = add i32 %temp114$120, %j$46
  %temp110$124 = add i32 %temp112$122, %k$49
  %temp108$126 = add i32 %temp110$124, %l$52
  %temp106$128 = add i32 %temp108$126, %m$55
  %temp104$130 = add i32 %temp106$128, %n$58
  %temp102$132 = add i32 %temp104$130, %o$61
  %temp100$134 = add i32 %temp102$132, %p$64
  %temp98$136 = add i32 %temp100$134, %q$67
  %temp96$138 = add i32 %temp98$136, %r$70
  %temp94$140 = add i32 %temp96$138, %s$73
  %temp92$142 = add i32 %temp94$140, %t$76
  %temp90$144 = add i32 %temp92$142, %u$79
  %temp88$146 = add i32 %temp90$144, %v$82
  %temp86$148 = add i32 %temp88$146, %w$85
  %temp84$150 = add i32 %temp86$148, %x$88
  %temp82$152 = add i32 %temp84$150, %y$91
  %temp80$154 = add i32 %temp82$152, %z$94
  %temp78$156 = add i32 %temp80$154, %za$97
  %temp76$158 = add i32 %temp78$156, %zb$100
  %temp75$160 = add i32 %temp76$158, %zc$103
  ret i32 %temp75$160
}
