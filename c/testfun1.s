main:
  addi fp,sp,0
  addi t0,zero,164
  sw t0,4(zero)
  addi t0,zero,16
  sw t0,0(zero)
  jal ra,148
  jal ra,404
  addi sp,sp,-8
  sw fp,4(sp)
  sw ra,0(sp)
  addi fp,sp,4
  addi sp,sp,0
  addi t6,s1,0
  addi t5,s1,0
  addi t4,s2,0
  addi t3,s3,0
  addi a7,s4,0
  addi a6,s5,0
  addi a5,s6,0
  addi a4,s7,0
  addi a3,s8,0
  addi a2,s9,0
  addi a1,s10,0
  addi a0,s11,0
  addi s2,a0,0
  addi s1,zero,1
  add s1,s2,s1
  addi a0,s1,0
  addi sp,fp,4
  lw fp,-4(sp)
  lw ra,-8(sp)
  jalr zero,ra,0
  addi s1,t6,0
  addi s1,t5,0
  addi s2,t4,0
  addi s3,t3,0
  addi s4,a7,0
  addi s5,a6,0
  addi s6,a5,0
  addi s7,a4,0
  addi s8,a3,0
  addi s9,a2,0
  addi s10,a1,0
  addi s11,a0,0
  addi sp,sp,-8
  sw fp,4(sp)
  sw ra,0(sp)
  addi fp,sp,4
  addi sp,sp,-48
  addi t2,s1,0
  sw t2,-52(fp)
  addi t2,s1,0
  sw t2,-48(fp)
  addi t2,s2,0
  sw t2,-44(fp)
  addi t2,s3,0
  sw t2,-40(fp)
  addi t2,s4,0
  sw t2,-36(fp)
  addi t2,s5,0
  sw t2,-32(fp)
  addi t2,s6,0
  sw t2,-28(fp)
  addi t2,s7,0
  sw t2,-24(fp)
  addi t2,s8,0
  sw t2,-20(fp)
  addi t2,s9,0
  sw t2,-16(fp)
  addi t2,s10,0
  sw t2,-12(fp)
  addi t2,s11,0
  sw t2,-8(fp)
  lw t0,0(zero)
  addi s2,t0,0
  addi s1,zero,2
  addi a0,s1,0
  jalr ra,s2,0
  addi sp,sp,-28
  addi s1,a0,0
  addi a0,s1,0
  addi sp,fp,4
  lw fp,-4(sp)
  lw ra,-8(sp)
  jalr zero,ra,0
  lw t0,-52(fp)
  addi s1,t0,0
  lw t0,-48(fp)
  addi s1,t0,0
  lw t0,-44(fp)
  addi s2,t0,0
  lw t0,-40(fp)
  addi s3,t0,0
  lw t0,-36(fp)
  addi s4,t0,0
  lw t0,-32(fp)
  addi s5,t0,0
  lw t0,-28(fp)
  addi s6,t0,0
  lw t0,-24(fp)
  addi s7,t0,0
  lw t0,-20(fp)
  addi s8,t0,0
  lw t0,-16(fp)
  addi s9,t0,0
  lw t0,-12(fp)
  addi s10,t0,0
  lw t0,-8(fp)
  addi s11,t0,0
