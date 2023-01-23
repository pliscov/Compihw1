@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [13 x i8] c"Good print 1\00"
@str2 = internal constant [13 x i8] c"Good print 2\00"
@str3 = internal constant [9 x i8] c"Failed 1\00"
@str4 = internal constant [13 x i8] c"Good print 3\00"
@str5 = internal constant [9 x i8] c"Failed 2\00"
@str6 = internal constant [13 x i8] c"Good print 4\00"
@str7 = internal constant [9 x i8] c"Failed 3\00"
@str8 = internal constant [13 x i8] c"Good print 5\00"
@str9 = internal constant [9 x i8] c"Failed 4\00"
@str10 = internal constant [13 x i8] c"Good print 6\00"
@str11 = internal constant [5 x i8] c"y = \00"
@str12 = internal constant [5 x i8] c"x = \00"
@str13 = internal constant [9 x i8] c"Failed 5\00"
@str14 = internal constant [32 x i8] c"Make sure your assoc is correct\00"
@str15 = internal constant [13 x i8] c"Good print 7\00"
@str16 = internal constant [9 x i8] c"Failed 6\00"
@str17 = internal constant [28 x i8] c"Finished the medium test :)\00"
@str18 = internal constant [7 x i8] c"Failed\00"
@str19 = internal constant [22 x i8] c"Shouldn't get here...\00"
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
br label %num1
num1:
%ptr1 = alloca i32
store i32 8, i32* %ptr1
br label %num2
num2:
%ptr2 = alloca i32
store i32 0, i32* %ptr2
br label %true1
true1:
br label %truebool1
truebool1:
br label %truelabel1
br label %truelabel1
truelabel1:
br label %endlabel1
falselabel1:
br label %endlabel1
endlabel1:
%t1 = phi i32 [1, %truelabel1], [0, %falselabel1]
%ptr3 = alloca i32
store i32 %t1, i32* %ptr3
br label %byte1
byte1:
%ptr4 = alloca i32
store i32 15, i32* %ptr4
br label %id1
id1:
%t2 = load i32, i32* %ptr4
%t3 = trunc i32 %t2 to i8
%t4 = zext i8 %t3 to i32
br label %id2
id2:
%t5 = load i32, i32* %ptr1
br label %reloplabel1
reloplabel1:
%t6 = icmp sgt i32 %t4, %t5
br i1 %t6, label %truelabel2, label %falselabel10
br label %truelabel2
truelabel2:
%ptr5 = getelementptr [13 x i8], [13 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr5)
br label %id4
id3:
%t7 = load i32, i32* %ptr1
br label %truelabel3
br label %id4
id4:
%t8 = load i32, i32* %ptr3
%t9 = icmp eq i32 1, %t8
br i1 %t9, label %id3, label %id5
br label %id5
id5:
%t10 = load i32, i32* %ptr1
br label %id6
id6:
%t11 = load i32, i32* %ptr2
br label %reloplabel2
reloplabel2:
%t12 = icmp sgt i32 %t10, %t11
br i1 %t12, label %id3, label %id7
br label %id7
id7:
%t13 = load i32, i32* %ptr4
%t14 = trunc i32 %t13 to i8
%t15 = zext i8 %t14 to i32
br label %falselabel2
truelabel3:
br label %endlabel2
falselabel2:
br label %endlabel2
endlabel2:
%t16 = phi i32 [%t7, %truelabel3 ], [%t15, %falselabel2 ]
%ptr6 = alloca i32
store i32 %t16, i32* %ptr6
%ptr7 = getelementptr [13 x i8], [13 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr7)
br label %id8
id8:
%t17 = load i32, i32* %ptr6
br label %id9
id9:
%t18 = load i32, i32* %ptr1
br label %reloplabel3
reloplabel3:
%t19 = icmp ne i32 %t17, %t18
br i1 %t19, label %truelabel4, label %endlabel3
br label %truelabel4
truelabel4:
%ptr8 = getelementptr [9 x i8], [9 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr8)
ret void
br label %endlabel3
endlabel3:
%ptr9 = getelementptr [13 x i8], [13 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr9)
br label %true2
id10:
%t20 = load i32, i32* %ptr6
%t21 = trunc i32 %t20 to i8
%t22 = zext i8 %t21 to i32
br label %truelabel5
br label %true2
true2:
br label %truebool2
truebool2:
br label %false1
br label %false1
false1:
br label %falsebool1
falsebool1:
br label %id11
br label %true3
true3:
br label %truebool3
truebool3:
br label %id11
br label %not1
not1:
br label %id11
id11:
%t23 = load i32, i32* %ptr4
%t24 = trunc i32 %t23 to i8
%t25 = zext i8 %t24 to i32
%t26 = trunc i32 %t25 to i8
%t27 = zext i8 %t26 to i32
br label %falselabel3
truelabel5:
br label %endlabel4
falselabel3:
br label %endlabel4
endlabel4:
%t28 = phi i32 [%t22, %truelabel5 ], [%t27, %falselabel3 ]
%ptr10 = alloca i32
store i32 %t28, i32* %ptr10
br label %id12
id12:
%t29 = load i32, i32* %ptr10
%t30 = trunc i32 %t29 to i8
%t31 = zext i8 %t30 to i32
br label %id13
id13:
%t32 = load i32, i32* %ptr4
%t33 = trunc i32 %t32 to i8
%t34 = zext i8 %t33 to i32
br label %reloplabel4
reloplabel4:
%t35 = icmp ne i32 %t31, %t34
br i1 %t35, label %truelabel6, label %falselabel4
br label %truelabel6
truelabel6:
%ptr11 = getelementptr [9 x i8], [9 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr11)
ret void
br label %endlabel14
br label %falselabel4
falselabel4:
%ptr12 = getelementptr [13 x i8], [13 x i8]* @str6, i32 0, i32 0
call void @print(i8* %ptr12)
br label %false2
false2:
br label %falsebool2
falsebool2:
br label %endlabel5
br label %truelabel7
truelabel7:
%ptr13 = getelementptr [9 x i8], [9 x i8]* @str7, i32 0, i32 0
call void @print(i8* %ptr13)
ret void
br label %false2
br label %endlabel5
endlabel5:
%ptr14 = getelementptr [13 x i8], [13 x i8]* @str8, i32 0, i32 0
call void @print(i8* %ptr14)
br label %false3
false3:
br label %falsebool3
falsebool3:
br label %id14
br label %id14
id14:
%t36 = load i32, i32* %ptr4
%t37 = trunc i32 %t36 to i8
%t38 = zext i8 %t37 to i32
br label %num3
num3:
br label %reloplabel5
reloplabel5:
%t39 = icmp slt i32 %t38, 100
br i1 %t39, label %truelabel8, label %endlabel6
br label %truelabel8
truelabel8:
br label %id15
id15:
%t40 = load i32, i32* %ptr4
%t41 = trunc i32 %t40 to i8
%t42 = zext i8 %t41 to i32
br label %byte2
byte2:
br label %sub1
sub1:
%t43 = sub i32 %t42, 1
%t44 = trunc i32 %t43 to i8
%t45 = zext i8 %t44 to i32
store i32 %t45, i32* %ptr4
br label %false3
br label %endlabel6
endlabel6:
br label %id16
id16:
%t46 = load i32, i32* %ptr4
%t47 = trunc i32 %t46 to i8
%t48 = zext i8 %t47 to i32
br label %num4
num4:
br label %reloplabel6
reloplabel6:
%t49 = icmp ne i32 %t48, 255
br i1 %t49, label %truelabel9, label %endlabel7
br label %truelabel9
truelabel9:
%ptr15 = getelementptr [9 x i8], [9 x i8]* @str9, i32 0, i32 0
call void @print(i8* %ptr15)
ret void
br label %endlabel7
endlabel7:
%ptr16 = getelementptr [13 x i8], [13 x i8]* @str10, i32 0, i32 0
call void @print(i8* %ptr16)
br label %id18
id17:
%t50 = load i32, i32* %ptr1
br label %truelabel11
br label %id18
id18:
%t51 = load i32, i32* %ptr4
%t52 = trunc i32 %t51 to i8
%t53 = zext i8 %t52 to i32
br label %num5
num5:
br label %reloplabel7
reloplabel7:
%t54 = icmp sgt i32 %t53, 5
br i1 %t54, label %id17, label %id20
br label %id20
id19:
%t55 = load i32, i32* %ptr2
br label %truelabel10
br label %id20
id20:
%t56 = load i32, i32* %ptr4
%t57 = trunc i32 %t56 to i8
%t58 = zext i8 %t57 to i32
br label %num6
num6:
br label %reloplabel8
reloplabel8:
%t59 = icmp slt i32 %t58, 5
br i1 %t59, label %id19, label %id21
br label %id21
id21:
%t60 = load i32, i32* %ptr4
%t61 = trunc i32 %t60 to i8
%t62 = zext i8 %t61 to i32
br label %falselabel5
truelabel10:
br label %endlabel8
falselabel5:
br label %endlabel8
endlabel8:
%t63 = phi i32 [%t55, %truelabel10 ], [%t62, %falselabel5 ]
br label %falselabel6
truelabel11:
br label %endlabel9
falselabel6:
br label %endlabel9
endlabel9:
%t64 = phi i32 [%t50, %truelabel11 ], [%t63, %falselabel6 ]
store i32 %t64, i32* %ptr2
br label %id22
id22:
%t65 = load i32, i32* %ptr2
br label %id23
id23:
%t66 = load i32, i32* %ptr1
br label %reloplabel9
reloplabel9:
%t67 = icmp ne i32 %t65, %t66
br i1 %t67, label %truelabel12, label %endlabel10
br label %truelabel12
truelabel12:
%ptr17 = getelementptr [5 x i8], [5 x i8]* @str11, i32 0, i32 0
call void @print(i8* %ptr17)
br label %id24
id24:
%t68 = load i32, i32* %ptr2
call void @printi(i32 %t68)
%ptr18 = getelementptr [5 x i8], [5 x i8]* @str12, i32 0, i32 0
call void @print(i8* %ptr18)
br label %id25
id25:
%t69 = load i32, i32* %ptr1
call void @printi(i32 %t69)
%ptr19 = getelementptr [9 x i8], [9 x i8]* @str13, i32 0, i32 0
call void @print(i8* %ptr19)
%ptr20 = getelementptr [32 x i8], [32 x i8]* @str14, i32 0, i32 0
call void @print(i8* %ptr20)
ret void
br label %endlabel10
endlabel10:
%ptr21 = getelementptr [13 x i8], [13 x i8]* @str15, i32 0, i32 0
call void @print(i8* %ptr21)
br label %id29
id26:
%t70 = load i32, i32* %ptr1
br label %truelabel13
br label %id27
id27:
%t71 = load i32, i32* %ptr4
%t72 = trunc i32 %t71 to i8
%t73 = zext i8 %t72 to i32
br label %num7
num7:
br label %reloplabel10
reloplabel10:
%t74 = icmp sgt i32 %t73, 5
br i1 %t74, label %id26, label %id28
br label %id28
id28:
%t75 = load i32, i32* %ptr2
br label %falselabel7
truelabel13:
br label %endlabel11
falselabel7:
br label %endlabel11
endlabel11:
%t76 = phi i32 [%t70, %truelabel13 ], [%t75, %falselabel7 ]
br label %truelabel14
br label %id29
id29:
%t77 = load i32, i32* %ptr4
%t78 = trunc i32 %t77 to i8
%t79 = zext i8 %t78 to i32
br label %num8
num8:
br label %reloplabel11
reloplabel11:
%t80 = icmp slt i32 %t79, 5
br i1 %t80, label %id27, label %id30
br label %id30
id30:
%t81 = load i32, i32* %ptr4
%t82 = trunc i32 %t81 to i8
%t83 = zext i8 %t82 to i32
br label %falselabel8
truelabel14:
br label %endlabel12
falselabel8:
br label %endlabel12
endlabel12:
%t84 = phi i32 [%t76, %truelabel14 ], [%t83, %falselabel8 ]
store i32 %t84, i32* %ptr2
br label %id31
id31:
%t85 = load i32, i32* %ptr2
br label %id32
id32:
%t86 = load i32, i32* %ptr4
%t87 = trunc i32 %t86 to i8
%t88 = zext i8 %t87 to i32
br label %reloplabel12
reloplabel12:
%t89 = icmp ne i32 %t85, %t88
br i1 %t89, label %truelabel15, label %falselabel9
br label %truelabel15
truelabel15:
%ptr22 = getelementptr [9 x i8], [9 x i8]* @str16, i32 0, i32 0
call void @print(i8* %ptr22)
ret void
br label %endlabel13
br label %falselabel9
falselabel9:
%ptr23 = getelementptr [28 x i8], [28 x i8]* @str17, i32 0, i32 0
call void @print(i8* %ptr23)
ret void
br label %endlabel13
endlabel13:
br label %endlabel14
endlabel14:
br label %endlabel15
br label %falselabel10
falselabel10:
%ptr24 = getelementptr [7 x i8], [7 x i8]* @str18, i32 0, i32 0
call void @print(i8* %ptr24)
ret void
br label %endlabel15
endlabel15:
%ptr25 = getelementptr [22 x i8], [22 x i8]* @str19, i32 0, i32 0
call void @print(i8* %ptr25)
ret void 
}
