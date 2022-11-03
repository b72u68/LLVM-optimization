declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %r$1 = bitcast i32 0 to i32
  %i$2 = bitcast i32 %r$1 to i32
  br label %label1
label1:
  %r$12 = phi i32 [%r$163, %label2], [%r$1, %main__entry]
  %i$13 = phi i32 [%i$167, %label2], [%i$2, %main__entry]
  %temp11$16 = icmp slt i32 %i$13, 50
  br i1 %temp11$16, label %label2, label %label3
label2:
  %r$163 = add i32 %r$12, %i$13
  %i$167 = add i32 %i$13, 1
  br label %label1
label3:
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
  %zc$103 = add i32 %zb$100, 1
  %temp125$106 = add i32 %a$19, %b$22
  %temp123$108 = add i32 %temp125$106, %c$25
  %temp121$110 = add i32 %temp123$108, %d$28
  %temp119$112 = add i32 %temp121$110, %e$31
  %temp117$114 = add i32 %temp119$112, %f$34
  %temp115$116 = add i32 %temp117$114, %g$37
  %temp113$118 = add i32 %temp115$116, %h$40
  %temp111$120 = add i32 %temp113$118, %i$43
  %temp109$122 = add i32 %temp111$120, %j$46
  %temp107$124 = add i32 %temp109$122, %k$49
  %temp105$126 = add i32 %temp107$124, %l$52
  %temp103$128 = add i32 %temp105$126, %m$55
  %temp101$130 = add i32 %temp103$128, %n$58
  %temp99$132 = add i32 %temp101$130, %o$61
  %temp97$134 = add i32 %temp99$132, %p$64
  %temp95$136 = add i32 %temp97$134, %q$67
  %temp93$138 = add i32 %temp95$136, %r$70
  %temp91$140 = add i32 %temp93$138, %s$73
  %temp89$142 = add i32 %temp91$140, %t$76
  %temp87$144 = add i32 %temp89$142, %u$79
  %temp85$146 = add i32 %temp87$144, %v$82
  %temp83$148 = add i32 %temp85$146, %w$85
  %temp81$150 = add i32 %temp83$148, %x$88
  %temp79$152 = add i32 %temp81$150, %y$91
  %temp77$154 = add i32 %temp79$152, %z$94
  %temp75$156 = add i32 %temp77$154, %za$97
  %temp73$158 = add i32 %temp75$156, %zb$100
  %temp72$160 = add i32 %temp73$158, %zc$103
  ret i32 %temp72$160
}
