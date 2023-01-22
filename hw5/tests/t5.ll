@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [31 x i8] c"Testing calculation with bytes\00"
@str2 = internal constant [48 x i8] c"Should be 1 2 1 2 4 8 4 8 16 32 64 64 128 0 0 0\00"
declare i32 @printf(i8*, ...)
declare void @exit(i32)
@.int_specifier = constant [4 x i8] c"%d\0A\00"
@.str_specifier = constant [4 x i8] c"%s\0A\00"

define void @printi(i32) {
    %spec_ptr = getelementptr [4 x i8], [4 x i8]* @.int_specifier, i32 0, i32 0
    call i32 (i8*, ...) @printf(i8* %spec_ptr, i32 %0)
    ret void
}

define void @print(i8*) {
    %spec_ptr = getelementptr [4 x i8], [4 x i8]* @.str_specifier, i32 0, i32 0
    call i32 (i8*, ...) @printf(i8* %spec_ptr, i8* %0)
    ret void
}

define void @main() {
%ptr1 = getelementptr [31 x i8], [31 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [48 x i8], [48 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %exp1
exp1:
%ptr3 = alloca i32
%z1 = zext i8 1 to i32
store i32 %z1, i32* %ptr3
br label %exp2
exp2:
%t1 = load i32, i32* %ptr3
%t2 = trunc i32 %t1 to i8
%t3 = zext i8 %t2 to i32
call void @printi(i32 %t3)
br label %exp3
exp3:
%t4 = load i32, i32* %ptr3
%t5 = trunc i32 %t4 to i8
br label %exp4
exp4:
%t6 = load i32, i32* %ptr3
%t7 = trunc i32 %t6 to i8
br label %exp5
exp5:
%t8 = add i8 %t5, %t7
%z2 = zext i8 %t8 to i32
store i32 %z2, i32* %ptr3
br label %exp6
exp6:
%t9 = load i32, i32* %ptr3
%t10 = trunc i32 %t9 to i8
%t11 = zext i8 %t10 to i32
call void @printi(i32 %t11)
br label %exp7
exp7:
%t12 = load i32, i32* %ptr3
%t13 = trunc i32 %t12 to i8
br label %exp8
exp8:
br label %exp9
exp9:
%t14 = sub i8 %t13, 1
%z3 = zext i8 %t14 to i32
store i32 %z3, i32* %ptr3
br label %exp10
exp10:
%t15 = load i32, i32* %ptr3
%t16 = trunc i32 %t15 to i8
%t17 = zext i8 %t16 to i32
call void @printi(i32 %t17)
br label %exp11
exp11:
%t18 = load i32, i32* %ptr3
%t19 = trunc i32 %t18 to i8
br label %exp12
exp12:
%t20 = load i32, i32* %ptr3
%t21 = trunc i32 %t20 to i8
br label %exp13
exp13:
%t22 = add i8 %t19, %t21
%z4 = zext i8 %t22 to i32
store i32 %z4, i32* %ptr3
br label %exp14
exp14:
%t23 = load i32, i32* %ptr3
%t24 = trunc i32 %t23 to i8
%t25 = zext i8 %t24 to i32
call void @printi(i32 %t25)
br label %exp15
exp15:
%t26 = load i32, i32* %ptr3
%t27 = trunc i32 %t26 to i8
br label %exp16
exp16:
%t28 = load i32, i32* %ptr3
%t29 = trunc i32 %t28 to i8
br label %exp17
exp17:
%t30 = add i8 %t27, %t29
%z5 = zext i8 %t30 to i32
store i32 %z5, i32* %ptr3
br label %exp18
exp18:
%t31 = load i32, i32* %ptr3
%t32 = trunc i32 %t31 to i8
%t33 = zext i8 %t32 to i32
call void @printi(i32 %t33)
br label %exp19
exp19:
%t34 = load i32, i32* %ptr3
%t35 = trunc i32 %t34 to i8
br label %exp20
exp20:
%t36 = load i32, i32* %ptr3
%t37 = trunc i32 %t36 to i8
br label %exp21
exp21:
%t38 = add i8 %t35, %t37
%z6 = zext i8 %t38 to i32
store i32 %z6, i32* %ptr3
br label %exp22
exp22:
%t39 = load i32, i32* %ptr3
%t40 = trunc i32 %t39 to i8
%t41 = zext i8 %t40 to i32
call void @printi(i32 %t41)
br label %exp23
exp23:
%t42 = load i32, i32* %ptr3
%t43 = trunc i32 %t42 to i8
br label %exp24
exp24:
br label %exp25
exp25:
%t45 = icmp eq i8 0, 2
br i1 %t45, label %divzerolabel1, label %end_divzerolabel1
divzerolabel1:
%ptr4 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr4)
call void @exit(i32 1)
br label %end_divzerolabel1
end_divzerolabel1:
%t44 = udiv i8 %t43, 2
%z7 = zext i8 %t44 to i32
store i32 %z7, i32* %ptr3
br label %exp26
exp26:
%t46 = load i32, i32* %ptr3
%t47 = trunc i32 %t46 to i8
%t48 = zext i8 %t47 to i32
call void @printi(i32 %t48)
br label %exp27
exp27:
%t49 = load i32, i32* %ptr3
%t50 = trunc i32 %t49 to i8
br label %exp28
exp28:
%t51 = load i32, i32* %ptr3
%t52 = trunc i32 %t51 to i8
br label %exp29
exp29:
%t53 = add i8 %t50, %t52
%z8 = zext i8 %t53 to i32
store i32 %z8, i32* %ptr3
br label %exp30
exp30:
%t54 = load i32, i32* %ptr3
%t55 = trunc i32 %t54 to i8
%t56 = zext i8 %t55 to i32
call void @printi(i32 %t56)
br label %exp31
exp31:
%t57 = load i32, i32* %ptr3
%t58 = trunc i32 %t57 to i8
br label %exp32
exp32:
%t59 = load i32, i32* %ptr3
%t60 = trunc i32 %t59 to i8
br label %exp33
exp33:
%t61 = add i8 %t58, %t60
%z9 = zext i8 %t61 to i32
store i32 %z9, i32* %ptr3
br label %exp34
exp34:
%t62 = load i32, i32* %ptr3
%t63 = trunc i32 %t62 to i8
%t64 = zext i8 %t63 to i32
call void @printi(i32 %t64)
br label %exp35
exp35:
%t65 = load i32, i32* %ptr3
%t66 = trunc i32 %t65 to i8
br label %exp36
exp36:
%t67 = load i32, i32* %ptr3
%t68 = trunc i32 %t67 to i8
br label %exp37
exp37:
%t69 = add i8 %t66, %t68
%z10 = zext i8 %t69 to i32
store i32 %z10, i32* %ptr3
br label %exp38
exp38:
%t70 = load i32, i32* %ptr3
%t71 = trunc i32 %t70 to i8
%t72 = zext i8 %t71 to i32
call void @printi(i32 %t72)
br label %exp39
exp39:
%t73 = load i32, i32* %ptr3
%t74 = trunc i32 %t73 to i8
br label %exp40
exp40:
%t75 = load i32, i32* %ptr3
%t76 = trunc i32 %t75 to i8
br label %exp41
exp41:
%t77 = add i8 %t74, %t76
%z11 = zext i8 %t77 to i32
store i32 %z11, i32* %ptr3
br label %exp42
exp42:
%t78 = load i32, i32* %ptr3
%t79 = trunc i32 %t78 to i8
%t80 = zext i8 %t79 to i32
call void @printi(i32 %t80)
br label %exp43
exp43:
%t81 = load i32, i32* %ptr3
%t82 = trunc i32 %t81 to i8
br label %exp44
exp44:
br label %exp45
exp45:
%t83 = mul i8 %t82, 1
%z12 = zext i8 %t83 to i32
store i32 %z12, i32* %ptr3
br label %exp46
exp46:
%t84 = load i32, i32* %ptr3
%t85 = trunc i32 %t84 to i8
%t86 = zext i8 %t85 to i32
call void @printi(i32 %t86)
br label %exp47
exp47:
%t87 = load i32, i32* %ptr3
%t88 = trunc i32 %t87 to i8
br label %exp48
exp48:
%t89 = load i32, i32* %ptr3
%t90 = trunc i32 %t89 to i8
br label %exp49
exp49:
%t91 = add i8 %t88, %t90
%z13 = zext i8 %t91 to i32
store i32 %z13, i32* %ptr3
br label %exp50
exp50:
%t92 = load i32, i32* %ptr3
%t93 = trunc i32 %t92 to i8
%t94 = zext i8 %t93 to i32
call void @printi(i32 %t94)
br label %exp51
exp51:
%t95 = load i32, i32* %ptr3
%t96 = trunc i32 %t95 to i8
br label %exp52
exp52:
%t97 = load i32, i32* %ptr3
%t98 = trunc i32 %t97 to i8
br label %exp53
exp53:
%t99 = add i8 %t96, %t98
%z14 = zext i8 %t99 to i32
store i32 %z14, i32* %ptr3
br label %exp54
exp54:
%t100 = load i32, i32* %ptr3
%t101 = trunc i32 %t100 to i8
%t102 = zext i8 %t101 to i32
call void @printi(i32 %t102)
br label %exp55
exp55:
%t103 = load i32, i32* %ptr3
%t104 = trunc i32 %t103 to i8
br label %exp56
exp56:
%t105 = load i32, i32* %ptr3
%t106 = trunc i32 %t105 to i8
br label %exp57
exp57:
%t107 = add i8 %t104, %t106
%z15 = zext i8 %t107 to i32
store i32 %z15, i32* %ptr3
br label %exp58
exp58:
%t108 = load i32, i32* %ptr3
%t109 = trunc i32 %t108 to i8
%t110 = zext i8 %t109 to i32
call void @printi(i32 %t110)
br label %exp59
exp59:
%t111 = load i32, i32* %ptr3
%t112 = trunc i32 %t111 to i8
br label %exp60
exp60:
%t113 = load i32, i32* %ptr3
%t114 = trunc i32 %t113 to i8
br label %exp61
exp61:
%t115 = add i8 %t112, %t114
%z16 = zext i8 %t115 to i32
store i32 %z16, i32* %ptr3
br label %exp62
exp62:
%t116 = load i32, i32* %ptr3
%t117 = trunc i32 %t116 to i8
%t118 = zext i8 %t117 to i32
call void @printi(i32 %t118)
ret void
}
