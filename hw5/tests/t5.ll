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
br label %byte1
byte1:
%ptr3 = alloca i32
store i32 1, i32* %ptr3
br label %id1
id1:
%t1 = load i32, i32* %ptr3
%t2 = trunc i32 %t1 to i8
%t3 = zext i8 %t2 to i32
call void @printi(i32 %t3)
br label %id2
id2:
%t4 = load i32, i32* %ptr3
%t5 = trunc i32 %t4 to i8
%t6 = zext i8 %t5 to i32
br label %id3
id3:
%t7 = load i32, i32* %ptr3
%t8 = trunc i32 %t7 to i8
%t9 = zext i8 %t8 to i32
br label %add1
add1:
%t10 = add i32 %t6, %t9
%t11 = trunc i32 %t10 to i8
%t12 = zext i8 %t11 to i32
store i32 %t12, i32* %ptr3
br label %id4
id4:
%t13 = load i32, i32* %ptr3
%t14 = trunc i32 %t13 to i8
%t15 = zext i8 %t14 to i32
call void @printi(i32 %t15)
br label %id5
id5:
%t16 = load i32, i32* %ptr3
%t17 = trunc i32 %t16 to i8
%t18 = zext i8 %t17 to i32
br label %byte2
byte2:
br label %sub1
sub1:
%t19 = sub i32 %t18, 1
%t20 = trunc i32 %t19 to i8
%t21 = zext i8 %t20 to i32
store i32 %t21, i32* %ptr3
br label %id6
id6:
%t22 = load i32, i32* %ptr3
%t23 = trunc i32 %t22 to i8
%t24 = zext i8 %t23 to i32
call void @printi(i32 %t24)
br label %id7
id7:
%t25 = load i32, i32* %ptr3
%t26 = trunc i32 %t25 to i8
%t27 = zext i8 %t26 to i32
br label %id8
id8:
%t28 = load i32, i32* %ptr3
%t29 = trunc i32 %t28 to i8
%t30 = zext i8 %t29 to i32
br label %add2
add2:
%t31 = add i32 %t27, %t30
%t32 = trunc i32 %t31 to i8
%t33 = zext i8 %t32 to i32
store i32 %t33, i32* %ptr3
br label %id9
id9:
%t34 = load i32, i32* %ptr3
%t35 = trunc i32 %t34 to i8
%t36 = zext i8 %t35 to i32
call void @printi(i32 %t36)
br label %id10
id10:
%t37 = load i32, i32* %ptr3
%t38 = trunc i32 %t37 to i8
%t39 = zext i8 %t38 to i32
br label %id11
id11:
%t40 = load i32, i32* %ptr3
%t41 = trunc i32 %t40 to i8
%t42 = zext i8 %t41 to i32
br label %add3
add3:
%t43 = add i32 %t39, %t42
%t44 = trunc i32 %t43 to i8
%t45 = zext i8 %t44 to i32
store i32 %t45, i32* %ptr3
br label %id12
id12:
%t46 = load i32, i32* %ptr3
%t47 = trunc i32 %t46 to i8
%t48 = zext i8 %t47 to i32
call void @printi(i32 %t48)
br label %id13
id13:
%t49 = load i32, i32* %ptr3
%t50 = trunc i32 %t49 to i8
%t51 = zext i8 %t50 to i32
br label %id14
id14:
%t52 = load i32, i32* %ptr3
%t53 = trunc i32 %t52 to i8
%t54 = zext i8 %t53 to i32
br label %add4
add4:
%t55 = add i32 %t51, %t54
%t56 = trunc i32 %t55 to i8
%t57 = zext i8 %t56 to i32
store i32 %t57, i32* %ptr3
br label %id15
id15:
%t58 = load i32, i32* %ptr3
%t59 = trunc i32 %t58 to i8
%t60 = zext i8 %t59 to i32
call void @printi(i32 %t60)
br label %id16
id16:
%t61 = load i32, i32* %ptr3
%t62 = trunc i32 %t61 to i8
%t63 = zext i8 %t62 to i32
br label %byte3
byte3:
br label %div1
div1:
%t65 = icmp eq i32 0, 2
br i1 %t65, label %divzerolabel1, label %end_divzerolabel1
divzerolabel1:
%ptr4 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr4)
call void @exit(i32 1)
br label %end_divzerolabel1
end_divzerolabel1:
%t64 = udiv i32 %t63, 2
%t66 = trunc i32 %t64 to i8
%t67 = zext i8 %t66 to i32
store i32 %t67, i32* %ptr3
br label %id17
id17:
%t68 = load i32, i32* %ptr3
%t69 = trunc i32 %t68 to i8
%t70 = zext i8 %t69 to i32
call void @printi(i32 %t70)
br label %id18
id18:
%t71 = load i32, i32* %ptr3
%t72 = trunc i32 %t71 to i8
%t73 = zext i8 %t72 to i32
br label %id19
id19:
%t74 = load i32, i32* %ptr3
%t75 = trunc i32 %t74 to i8
%t76 = zext i8 %t75 to i32
br label %add5
add5:
%t77 = add i32 %t73, %t76
%t78 = trunc i32 %t77 to i8
%t79 = zext i8 %t78 to i32
store i32 %t79, i32* %ptr3
br label %id20
id20:
%t80 = load i32, i32* %ptr3
%t81 = trunc i32 %t80 to i8
%t82 = zext i8 %t81 to i32
call void @printi(i32 %t82)
br label %id21
id21:
%t83 = load i32, i32* %ptr3
%t84 = trunc i32 %t83 to i8
%t85 = zext i8 %t84 to i32
br label %id22
id22:
%t86 = load i32, i32* %ptr3
%t87 = trunc i32 %t86 to i8
%t88 = zext i8 %t87 to i32
br label %add6
add6:
%t89 = add i32 %t85, %t88
%t90 = trunc i32 %t89 to i8
%t91 = zext i8 %t90 to i32
store i32 %t91, i32* %ptr3
br label %id23
id23:
%t92 = load i32, i32* %ptr3
%t93 = trunc i32 %t92 to i8
%t94 = zext i8 %t93 to i32
call void @printi(i32 %t94)
br label %id24
id24:
%t95 = load i32, i32* %ptr3
%t96 = trunc i32 %t95 to i8
%t97 = zext i8 %t96 to i32
br label %id25
id25:
%t98 = load i32, i32* %ptr3
%t99 = trunc i32 %t98 to i8
%t100 = zext i8 %t99 to i32
br label %add7
add7:
%t101 = add i32 %t97, %t100
%t102 = trunc i32 %t101 to i8
%t103 = zext i8 %t102 to i32
store i32 %t103, i32* %ptr3
br label %id26
id26:
%t104 = load i32, i32* %ptr3
%t105 = trunc i32 %t104 to i8
%t106 = zext i8 %t105 to i32
call void @printi(i32 %t106)
br label %id27
id27:
%t107 = load i32, i32* %ptr3
%t108 = trunc i32 %t107 to i8
%t109 = zext i8 %t108 to i32
br label %id28
id28:
%t110 = load i32, i32* %ptr3
%t111 = trunc i32 %t110 to i8
%t112 = zext i8 %t111 to i32
br label %add8
add8:
%t113 = add i32 %t109, %t112
%t114 = trunc i32 %t113 to i8
%t115 = zext i8 %t114 to i32
store i32 %t115, i32* %ptr3
br label %id29
id29:
%t116 = load i32, i32* %ptr3
%t117 = trunc i32 %t116 to i8
%t118 = zext i8 %t117 to i32
call void @printi(i32 %t118)
br label %id30
id30:
%t119 = load i32, i32* %ptr3
%t120 = trunc i32 %t119 to i8
%t121 = zext i8 %t120 to i32
br label %byte4
byte4:
br label %mul1
mul1:
%t122 = mul i32 %t121, 1
%t123 = trunc i32 %t122 to i8
%t124 = zext i8 %t123 to i32
store i32 %t124, i32* %ptr3
br label %id31
id31:
%t125 = load i32, i32* %ptr3
%t126 = trunc i32 %t125 to i8
%t127 = zext i8 %t126 to i32
call void @printi(i32 %t127)
br label %id32
id32:
%t128 = load i32, i32* %ptr3
%t129 = trunc i32 %t128 to i8
%t130 = zext i8 %t129 to i32
br label %id33
id33:
%t131 = load i32, i32* %ptr3
%t132 = trunc i32 %t131 to i8
%t133 = zext i8 %t132 to i32
br label %add9
add9:
%t134 = add i32 %t130, %t133
%t135 = trunc i32 %t134 to i8
%t136 = zext i8 %t135 to i32
store i32 %t136, i32* %ptr3
br label %id34
id34:
%t137 = load i32, i32* %ptr3
%t138 = trunc i32 %t137 to i8
%t139 = zext i8 %t138 to i32
call void @printi(i32 %t139)
br label %id35
id35:
%t140 = load i32, i32* %ptr3
%t141 = trunc i32 %t140 to i8
%t142 = zext i8 %t141 to i32
br label %id36
id36:
%t143 = load i32, i32* %ptr3
%t144 = trunc i32 %t143 to i8
%t145 = zext i8 %t144 to i32
br label %add10
add10:
%t146 = add i32 %t142, %t145
%t147 = trunc i32 %t146 to i8
%t148 = zext i8 %t147 to i32
store i32 %t148, i32* %ptr3
br label %id37
id37:
%t149 = load i32, i32* %ptr3
%t150 = trunc i32 %t149 to i8
%t151 = zext i8 %t150 to i32
call void @printi(i32 %t151)
br label %id38
id38:
%t152 = load i32, i32* %ptr3
%t153 = trunc i32 %t152 to i8
%t154 = zext i8 %t153 to i32
br label %id39
id39:
%t155 = load i32, i32* %ptr3
%t156 = trunc i32 %t155 to i8
%t157 = zext i8 %t156 to i32
br label %add11
add11:
%t158 = add i32 %t154, %t157
%t159 = trunc i32 %t158 to i8
%t160 = zext i8 %t159 to i32
store i32 %t160, i32* %ptr3
br label %id40
id40:
%t161 = load i32, i32* %ptr3
%t162 = trunc i32 %t161 to i8
%t163 = zext i8 %t162 to i32
call void @printi(i32 %t163)
br label %id41
id41:
%t164 = load i32, i32* %ptr3
%t165 = trunc i32 %t164 to i8
%t166 = zext i8 %t165 to i32
br label %id42
id42:
%t167 = load i32, i32* %ptr3
%t168 = trunc i32 %t167 to i8
%t169 = zext i8 %t168 to i32
br label %add12
add12:
%t170 = add i32 %t166, %t169
%t171 = trunc i32 %t170 to i8
%t172 = zext i8 %t171 to i32
store i32 %t172, i32* %ptr3
br label %id43
id43:
%t173 = load i32, i32* %ptr3
%t174 = trunc i32 %t173 to i8
%t175 = zext i8 %t174 to i32
call void @printi(i32 %t175)
ret void 
}
