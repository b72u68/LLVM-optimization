.text
.globl __main
.globl __malloc

  la t0,__main
  sw t0,main,x3
  la t0,__malloc
  sw t0,malloc,x3
  la t0,heapstart
  sw t0,heapptr,x3
  lw t1,heapsize
  add t2,t0,t1
  sw t2,heapend,x3
  jal ra,__main
  jal ra,__halt
__main:
  addi sp,sp,-8
  sw fp,4(sp)
  sw ra,0(sp)
  addi fp,sp,4
  addi sp,sp,-8
  addi t2,s1,0
  sw t2,-12(fp)
  addi t2,s2,0
  sw t2,-8(fp)
main__entry:
  addi a0,zero,50
  lw t0,malloc
  jalr ra,t0,0
  addi sp,sp,-28
  addi s2,a0,0
  addi a0,zero,3
  lw t0,malloc
  jalr ra,t0,0
  addi sp,sp,-28
  addi s1,a0,0
  addi a0,s1,0
  addi t0,zero,0
  addi t1,zero,12
  mul t0,t0,t1
  add a0,a0,t0
  addi t1,zero,0
  addi t0,zero,4
  mul t1,t1,t0
  add a0,a0,t1
  addi t0,zero,5
  sw t0,0(a0)
  addi s1,s1,0
  addi t0,zero,0
  addi t1,zero,12
  mul t0,t0,t1
  add s1,s1,t0
  addi t1,zero,0
  addi t0,zero,4
  mul t1,t1,t0
  add s1,s1,t1
  lw a1,0(s1)
  addi a0,zero,0
  jal zero,label1
label1:
  addi t1,zero,50
  blt a0,t1,label2
  jal zero,label3
label2:
  addi s1,s2,0
  addi t1,zero,4
  mul a0,a0,t1
  add s1,s1,a0
  sw a0,0(s1)
  addi s1,a0,1
  addi a0,s1,0
  jal zero,label1
label3:
  addi a0,a1,0
  addi a1,zero,0
  jal zero,label4
label4:
  addi t1,zero,50
  blt a1,t1,label5
  jal zero,label6
label5:
  addi s1,s2,0
  addi s1,s1,0
  addi t1,zero,4
  mul a1,a1,t1
  add s1,s1,a1
  lw s1,0(s1)
  add a0,a0,s1
  addi s1,a1,1
  addi a1,s1,0
  jal zero,label4
label6:
  addi a0,a0,0
  addi sp,fp,4
  lw fp,-4(sp)
  lw ra,-8(sp)
  jalr zero,ra,0
main__exit:
  lw t0,-12(fp)
  addi s1,t0,0
  lw t0,-8(fp)
  addi s2,t0,0
__malloc:
  lw t0,heapptr
  lw t2,heapend
  add t2,t0,t1
  add t1,t0,a0
  blt t2,t1,__eom
  sw t1,heapptr,x3
  addi a0,t0,0
  jalr zero,ra,0
__eom:
  xor a0,a0,a0
  jalr zero,ra,0
__halt:


.data

main:
  .word 0

malloc:
  .word 0

heapptr:
  .word 0

heapsize:
  .word 4194304

heapend:
  .word 0

heapstart:
  .word 0

