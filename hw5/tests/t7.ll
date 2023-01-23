@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [30 x i8] c"More byte calculations!!! FUN\00"
@str2 = internal constant [24 x i8] c"Expecting 1 2 1 1 error\00"
@str3 = internal constant [6 x i8] c"Magic\00"
@str4 = internal constant [23 x i8] c"Thank GOD it's over...\00"
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
%ptr1 = getelementptr [30 x i8], [30 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [24 x i8], [24 x i8]* @str2, i32 0, i32 0
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
br label %div1
div1:
%t32 = icmp eq i32 0, %t30
br i1 %t32, label %divzerolabel1, label %end_divzerolabel1
divzerolabel1:
%ptr4 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr4)
call void @exit(i32 1)
br label %end_divzerolabel1
end_divzerolabel1:
%t31 = udiv i32 %t27, %t30
%t33 = trunc i32 %t31 to i8
%t34 = zext i8 %t33 to i32
store i32 %t34, i32* %ptr3
br label %id9
id9:
%t35 = load i32, i32* %ptr3
%t36 = trunc i32 %t35 to i8
%t37 = zext i8 %t36 to i32
call void @printi(i32 %t37)
br label %id10
id10:
%t38 = load i32, i32* %ptr3
%t39 = trunc i32 %t38 to i8
%t40 = zext i8 %t39 to i32
br label %byte3
byte3:
br label %div2
div2:
%t42 = icmp eq i32 0, 0
br i1 %t42, label %divzerolabel2, label %end_divzerolabel2
divzerolabel2:
%ptr5 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr5)
call void @exit(i32 1)
br label %end_divzerolabel2
end_divzerolabel2:
%t41 = udiv i32 %t40, 0
%t43 = trunc i32 %t41 to i8
%t44 = zext i8 %t43 to i32
store i32 %t44, i32* %ptr3
%ptr6 = getelementptr [6 x i8], [6 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr6)
br label %id11
id11:
%t45 = load i32, i32* %ptr3
%t46 = trunc i32 %t45 to i8
%t47 = zext i8 %t46 to i32
br label %id12
id12:
%t48 = load i32, i32* %ptr3
%t49 = trunc i32 %t48 to i8
%t50 = zext i8 %t49 to i32
br label %add2
add2:
%t51 = add i32 %t47, %t50
%t52 = trunc i32 %t51 to i8
%t53 = zext i8 %t52 to i32
store i32 %t53, i32* %ptr3
br label %id13
id13:
%t54 = load i32, i32* %ptr3
%t55 = trunc i32 %t54 to i8
%t56 = zext i8 %t55 to i32
call void @printi(i32 %t56)
br label %id14
id14:
%t57 = load i32, i32* %ptr3
%t58 = trunc i32 %t57 to i8
%t59 = zext i8 %t58 to i32
br label %id15
id15:
%t60 = load i32, i32* %ptr3
%t61 = trunc i32 %t60 to i8
%t62 = zext i8 %t61 to i32
br label %add3
add3:
%t63 = add i32 %t59, %t62
%t64 = trunc i32 %t63 to i8
%t65 = zext i8 %t64 to i32
store i32 %t65, i32* %ptr3
br label %id16
id16:
%t66 = load i32, i32* %ptr3
%t67 = trunc i32 %t66 to i8
%t68 = zext i8 %t67 to i32
call void @printi(i32 %t68)
%ptr7 = getelementptr [23 x i8], [23 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr7)
ret void 
}
