declare i8* @malloc(i32)
define i32 @mod(i32 %a, i32 %b) {
mod__entry:
  %temp2_1_1 = bitcast i32 1 to i32
  %result_2_2 = sub i32 0, %temp2_1_1
  %temp5_3_3 = bitcast i32 %b to i32
  %temp6_4_4 = bitcast i32 0 to i32
  %temp4_5_5 = icmp eq i32 %temp5_3_3, %temp6_4_4
  br i1 %temp4_5_5, label %label1, label %label2
label1:
  %temp3_28_36 = bitcast i32 %result_2_2 to i32
  ret i32 %temp3_28_36
label2:
  br label %label3
label3:
  br label %label5
label5:
  %temp9_21_6 = phi i32 [%temp9_21_29, %label6], [0, %label3]
  %temp8_20_7 = phi i32 [%temp8_20_28, %label6], [0, %label3]
  %temp7_23_8 = phi i32 [%temp7_23_31, %label6], [0, %label3]
  %temp12_25_9 = phi i32 [%temp12_25_33, %label6], [0, %label3]
  %temp11_24_10 = phi i32 [%temp11_24_32, %label6], [0, %label3]
  %temp10_27_11 = phi i32 [%temp10_27_35, %label6], [0, %label3]
  %result_26_12 = phi i32 [%result_26_34, %label6], [0, %label3]
  %a_22_13 = phi i32 [%a_22_30, %label6], [0, %label3]
  %temp9_6_14 = phi i32 [%temp9_6_14, %label6], [0, %label3], [%temp9_21, %label6], [0, %label3]
  %temp8_7_15 = phi i32 [%temp8_7_15, %label6], [0, %label3], [%temp8_20, %label6], [0, %label3]
  %temp7_8_16 = phi i32 [%temp7_8_16, %label6], [0, %label3], [%temp7_23, %label6], [0, %label3]
  %temp12_9_17 = phi i32 [%temp12_9_17, %label6], [0, %label3], [%temp12_25, %label6], [0, %label3]
  %temp11_10_18 = phi i32 [%temp11_10_18, %label6], [0, %label3], [%temp11_24, %label6], [0, %label3]
  %temp10_11_19 = phi i32 [%temp10_11_19, %label6], [0, %label3], [%temp10_27, %label6], [0, %label3]
  %result_12_20 = phi i32 [%result_12_20, %label6], [0, %label3], [%result_26, %label6], [%result_2, %label3]
  %a_13_21 = phi i32 [%a_13_21, %label6], [0, %label3], [%a_22, %label6], [%a, %label3]
  %temp14_14_22 = bitcast i32 %a_13_21 to i32
  %temp15_15_23 = bitcast i32 %b to i32
  %temp13_16_24 = icmp sge i32 %temp14_14_22, %temp15_15_23
  br i1 %temp13_16_24, label %label6, label %label7
label6:
  %temp8_20_28 = bitcast i32 %a_13_21 to i32
  %temp9_21_29 = bitcast i32 %b to i32
  %a_22_30 = sub i32 %temp8_20_28, %temp9_21_29
  %temp7_23_31 = bitcast i32 %a_22_30 to i32
  %temp11_24_32 = bitcast i32 %a_22_30 to i32
  %temp12_25_33 = bitcast i32 %b to i32
  %result_26_34 = sub i32 %temp11_24_32, %temp12_25_33
  %temp10_27_35 = bitcast i32 %result_26_34 to i32
  br label %label5
label7:
  %result_17_25 = bitcast i32 %a_13_21 to i32
  %temp16_18_26 = bitcast i32 %result_17_25 to i32
  %temp17_19_27 = bitcast i32 %result_17_25 to i32
  ret i32 %temp17_19_27
}

define i32 @square_root(i32 %n) {
square_root__entry:
  %temp20_1_1 = bitcast i32 %n to i32
  %temp21_2_2 = bitcast i32 1 to i32
  %temp19_3_3 = icmp sle i32 %temp20_1_1, %temp21_2_2
  br i1 %temp19_3_3, label %label9, label %label10
label10:
  br label %label11
label11:
  %i_5_5 = bitcast i32 1 to i32
  br label %label13
label13:
  %temp32_29_6 = phi i32 [%temp32_29_47, %label17], [0, %label11]
  %temp31_28_7 = phi i32 [%temp31_28_46, %label17], [0, %label11]
  %temp30_31_8 = phi i32 [%temp30_31_49, %label17], [0, %label11]
  %temp29_30_9 = phi i32 [%temp29_30_48, %label17], [0, %label11]
  %temp28_32_10 = phi i1 [%temp28_32_50, %label17], [0, %label11]
  %temp27_34_11 = phi i32 [%temp27_34_52, %label17], [0, %label11]
  %temp26_33_12 = phi i32 [%temp26_33_51, %label17], [0, %label11]
  %temp25_36_13 = phi i32 [%temp25_36_54, %label17], [0, %label11]
  %i_35_14 = phi i32 [%i_35_53, %label17], [0, %label11]
  %temp32_6_15 = phi i32 [%temp32_6_15, %label17], [0, %label11], [%temp32_29, %label17], [0, %label11]
  %temp31_7_16 = phi i32 [%temp31_7_16, %label17], [0, %label11], [%temp31_28, %label17], [0, %label11]
  %temp30_8_17 = phi i32 [%temp30_8_17, %label17], [0, %label11], [%temp30_31, %label17], [0, %label11]
  %temp29_9_18 = phi i32 [%temp29_9_18, %label17], [0, %label11], [%temp29_30, %label17], [0, %label11]
  %temp28_10_19 = phi i1 [%temp28_10_19, %label17], [0, %label11], [%temp28_32, %label17], [0, %label11]
  %temp27_11_20 = phi i32 [%temp27_11_20, %label17], [0, %label11], [%temp27_34, %label17], [0, %label11]
  %temp26_12_21 = phi i32 [%temp26_12_21, %label17], [0, %label11], [%temp26_33, %label17], [0, %label11]
  %temp25_13_22 = phi i32 [%temp25_13_22, %label17], [0, %label11], [%temp25_36, %label17], [0, %label11]
  %i_14_23 = phi i32 [%i_14_23, %label17], [0, %label11], [%i_35, %label17], [%i_5, %label11]
  %temp34_15_24 = bitcast i32 %i_14_23 to i32
  %temp35_16_25 = bitcast i32 %n to i32
  %temp33_17_26 = icmp sle i32 %temp34_15_24, %temp35_16_25
  br i1 %temp33_17_26, label %label14, label %label15
label14:
  %temp31_28_46 = bitcast i32 %i_14_23 to i32
  %temp32_29_47 = bitcast i32 %i_14_23 to i32
  %temp29_30_48 = mul i32 %temp31_28_46, %temp32_29_47
  %temp30_31_49 = bitcast i32 %n to i32
  %temp28_32_50 = icmp sgt i32 %temp29_30_48, %temp30_31_49
  br i1 %temp28_32_50, label %label16, label %label17
label15:
  %temp32_29_27 = phi i32 [%temp32_29_47, %label16], [%temp32_29_6, %label13]
  %temp31_28_28 = phi i32 [%temp31_28_46, %label16], [%temp31_28_7, %label13]
  %temp30_31_29 = phi i32 [%temp30_31_49, %label16], [%temp30_31_8, %label13]
  %temp29_30_30 = phi i32 [%temp29_30_48, %label16], [%temp29_30_9, %label13]
  %temp28_32_31 = phi i1 [%temp28_32_50, %label16], [%temp28_32_10, %label13]
  %temp24_38_32 = phi i32 [%temp24_38_56, %label16], [0, %label13]
  %temp23_37_33 = phi i32 [%temp23_37_55, %label16], [0, %label13]
  %temp22_40_34 = phi i32 [%temp22_40_58, %label16], [0, %label13]
  %i_39_35 = phi i32 [%i_39_57, %label16], [0, %label13]
  %temp32_18_36 = phi i32 [0, %label16], [0, %label13], [%temp32_29, %label16], [%temp32_6, %label13]
  %temp31_19_37 = phi i32 [0, %label16], [0, %label13], [%temp31_28, %label16], [%temp31_7, %label13]
  %temp30_20_38 = phi i32 [0, %label16], [0, %label13], [%temp30_31, %label16], [%temp30_8, %label13]
  %temp29_21_39 = phi i32 [0, %label16], [0, %label13], [%temp29_30, %label16], [%temp29_9, %label13]
  %temp28_22_40 = phi i1 [0, %label16], [0, %label13], [%temp28_32, %label16], [%temp28_10, %label13]
  %temp24_23_41 = phi i32 [0, %label16], [0, %label13], [%temp24_38, %label16], [0, %label13]
  %temp23_24_42 = phi i32 [0, %label16], [0, %label13], [%temp23_37, %label16], [0, %label13]
  %temp22_25_43 = phi i32 [0, %label16], [0, %label13], [%temp22_40, %label16], [0, %label13]
  %i_26_44 = phi i32 [0, %label16], [0, %label13], [%i_39, %label16], [%i_14, %label13]
  %temp36_27_45 = bitcast i32 %i_26_44 to i32
  ret i32 %temp36_27_45
label16:
  %temp23_37_55 = bitcast i32 %i_14_23 to i32
  %temp24_38_56 = bitcast i32 1 to i32
  %i_39_57 = sub i32 %temp23_37_55, %temp24_38_56
  %temp22_40_58 = bitcast i32 %i_39_57 to i32
  br label %label15
label17:
  %temp26_33_51 = bitcast i32 %i_14_23 to i32
  %temp27_34_52 = bitcast i32 1 to i32
  %i_35_53 = add i32 %temp26_33_51, %temp27_34_52
  %temp25_36_54 = bitcast i32 %i_35_53 to i32
  br label %label13
label9:
  %temp18_4_4 = bitcast i32 %n to i32
  ret i32 %temp18_4_4
}

define i32 @is_prime(i32 %n) {
is_prime__entry:
  %temp39_1_1 = bitcast i32 %n to i32
  %temp40_2_2 = bitcast i32 1 to i32
  %temp38_3_3 = icmp sle i32 %temp39_1_1, %temp40_2_2
  br i1 %temp38_3_3, label %label22, label %label23
label22:
  %temp37_48_68 = bitcast i32 0 to i32
  ret i32 %temp37_48_68
label23:
  br label %label24
label24:
  %temp41_4_4 = bitcast i32 (i32)* @square_root to i32 (i32)*
  %temp42_5_5 = bitcast i32 %n to i32
  %sroot_6_6 = call i32 %temp41_4_4(i32 %temp42_5_5)
  %result_7_7 = bitcast i32 1 to i32
  %i_8_8 = bitcast i32 2 to i32
  %temp43_9_9 = bitcast i32 0 to i32
  br label %label26
label26:
  %temp55_41_10 = phi i32 [%temp55_41_61, %label31], [0, %label24]
  %temp54_40_11 = phi i32 [%temp54_40_60, %label31], [0, %label24]
  %temp53_44_12 = phi i32 [%temp53_44_64, %label31], [0, %label24]
  %temp52_43_13 = phi i32 [%temp52_43_63, %label31], [0, %label24]
  %temp51_45_14 = phi i32 [%temp51_45_65, %label31], [0, %label24]
  %temp50_36_15 = phi i32 [%temp50_36_56, %label31], [0, %label24]
  %temp49_35_16 = phi i32 [%temp49_35_55, %label31], [0, %label24]
  %temp48_34_17 = phi i32 (i32, i32)* [%temp48_34_54, %label31], [null, %label24]
  %temp47_38_18 = phi i32 [%temp47_38_58, %label31], [0, %label24]
  %temp46_37_19 = phi i32 [%temp46_37_57, %label31], [0, %label24]
  %temp45_39_20 = phi i1 [%temp45_39_59, %label31], [0, %label24]
  %i_42_21 = phi i32 [%i_42_62, %label31], [0, %label24]
  %temp55_10_22 = phi i32 [%temp55_10_22, %label31], [0, %label24], [%temp55_41, %label31], [0, %label24]
  %temp54_11_23 = phi i32 [%temp54_11_23, %label31], [0, %label24], [%temp54_40, %label31], [0, %label24]
  %temp53_12_24 = phi i32 [%temp53_12_24, %label31], [0, %label24], [%temp53_44, %label31], [0, %label24]
  %temp52_13_25 = phi i32 [%temp52_13_25, %label31], [0, %label24], [%temp52_43, %label31], [0, %label24]
  %temp51_14_26 = phi i32 [%temp51_14_26, %label31], [0, %label24], [%temp51_45, %label31], [0, %label24]
  %temp50_15_27 = phi i32 [%temp50_15_27, %label31], [0, %label24], [%temp50_36, %label31], [0, %label24]
  %temp49_16_28 = phi i32 [%temp49_16_28, %label31], [0, %label24], [%temp49_35, %label31], [0, %label24]
  %temp48_17_29 = phi i32 (i32, i32)* [%temp48_17_29, %label31], [null, %label24], [%temp48_34, %label31], [null, %label24]
  %temp47_18_30 = phi i32 [%temp47_18_30, %label31], [0, %label24], [%temp47_38, %label31], [0, %label24]
  %temp46_19_31 = phi i32 [%temp46_19_31, %label31], [0, %label24], [%temp46_37, %label31], [0, %label24]
  %temp45_20_32 = phi i1 [%temp45_20_32, %label31], [0, %label24], [%temp45_39, %label31], [0, %label24]
  %i_21_33 = phi i32 [%i_21_33, %label31], [0, %label24], [%i_42, %label31], [%i_8, %label24]
  %temp57_22_34 = bitcast i32 %i_21_33 to i32
  %temp58_23_35 = bitcast i32 %sroot_6_6 to i32
  %temp56_24_36 = icmp sle i32 %temp57_22_34, %temp58_23_35
  br i1 %temp56_24_36, label %label27, label %label28
label27:
  %temp48_34_54 = bitcast i32 (i32, i32)* @mod to i32 (i32, i32)*
  %temp49_35_55 = bitcast i32 %n to i32
  %temp50_36_56 = bitcast i32 %i_21_33 to i32
  %temp46_37_57 = call i32 %temp48_34_54(i32 %temp49_35_55, i32 %temp50_36_56)
  %temp47_38_58 = bitcast i32 0 to i32
  %temp45_39_59 = icmp eq i32 %temp46_37_57, %temp47_38_58
  br i1 %temp45_39_59, label %label29, label %label30
label28:
  %temp50_36_37 = phi i32 [%temp50_36_56, %label29], [%temp50_36_15, %label26]
  %temp49_35_38 = phi i32 [%temp49_35_55, %label29], [%temp49_35_16, %label26]
  %temp48_34_39 = phi i32 (i32, i32)* [%temp48_34_54, %label29], [%temp48_34_17, %label26]
  %temp47_38_40 = phi i32 [%temp47_38_58, %label29], [%temp47_38_18, %label26]
  %temp46_37_41 = phi i32 [%temp46_37_57, %label29], [%temp46_37_19, %label26]
  %temp45_39_42 = phi i1 [%temp45_39_59, %label29], [%temp45_39_20, %label26]
  %temp44_47_43 = phi i32 [%temp44_47_67, %label29], [0, %label26]
  %result_46_44 = phi i32 [%result_46_66, %label29], [0, %label26]
  %temp50_25_45 = phi i32 [0, %label29], [0, %label26], [%temp50_36, %label29], [%temp50_15, %label26]
  %temp49_26_46 = phi i32 [0, %label29], [0, %label26], [%temp49_35, %label29], [%temp49_16, %label26]
  %temp48_27_47 = phi i32 (i32, i32)* [null, %label29], [null, %label26], [%temp48_34, %label29], [%temp48_17, %label26]
  %temp47_28_48 = phi i32 [0, %label29], [0, %label26], [%temp47_38, %label29], [%temp47_18, %label26]
  %temp46_29_49 = phi i32 [0, %label29], [0, %label26], [%temp46_37, %label29], [%temp46_19, %label26]
  %temp45_30_50 = phi i1 [0, %label29], [0, %label26], [%temp45_39, %label29], [%temp45_20, %label26]
  %temp44_31_51 = phi i32 [0, %label29], [0, %label26], [%temp44_47, %label29], [0, %label26]
  %result_32_52 = phi i32 [0, %label29], [0, %label26], [%result_46, %label29], [%result_7, %label26]
  %temp59_33_53 = bitcast i32 %result_32_52 to i32
  ret i32 %temp59_33_53
label29:
  %result_46_66 = bitcast i32 0 to i32
  %temp44_47_67 = bitcast i32 %result_46_66 to i32
  br label %label28
label30:
  br label %label31
label31:
  %temp54_40_60 = bitcast i32 %i_21_33 to i32
  %temp55_41_61 = bitcast i32 1 to i32
  %i_42_62 = add i32 %temp54_40_60, %temp55_41_61
  %temp52_43_63 = bitcast i32 %i_42_62 to i32
  %temp53_44_64 = bitcast i32 1 to i32
  %temp51_45_65 = sub i32 %temp52_43_63, %temp53_44_64
  br label %label26
}

define i32 @main() {
main__entry:
  %padding_1_1 = bitcast i32 10 to i32
  %n_2_2 = bitcast i32 9 to i32
  %temp61_3_3 = bitcast i32 %n_2_2 to i32
  %temp62_4_4 = bitcast i32 %padding_1_1 to i32
  %n_5_5 = add i32 %temp61_3_3, %temp62_4_4
  %temp60_6_6 = bitcast i32 %n_5_5 to i32
  %temp63_7_7 = bitcast i32 (i32)* @is_prime to i32 (i32)*
  %temp64_8_8 = bitcast i32 %n_5_5 to i32
  %result_9_9 = call i32 %temp63_7_7(i32 %temp64_8_8)
  %temp66_10_10 = bitcast i32 (i32)* @is_prime to i32 (i32)*
  %temp67_11_11 = bitcast i32 %n_5_5 to i32
  %temp65_12_12 = call i32 %temp66_10_10(i32 %temp67_11_11)
  ret i32 %temp65_12_12
}
