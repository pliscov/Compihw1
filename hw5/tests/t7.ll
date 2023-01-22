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
%t23 = icmp eq i8 0, %t21
br i1 %t23, label %divzerolabel1, label %end_divzerolabel1
divzerolabel1:
%ptr4 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr4)
call void @exit(i32 1)
br label %end_divzerolabel1
end_divzerolabel1:
%t22 = udiv i8 %t19, %t21
%z4 = zext i8 %t22 to i32
store i32 %z4, i32* %ptr3
br label %exp14
exp14:
%t24 = load i32, i32* %ptr3
%t25 = trunc i32 %t24 to i8
%t26 = zext i8 %t25 to i32
call void @printi(i32 %t26)
br label %exp15
exp15:
%t27 = load i32, i32* %ptr3
%t28 = trunc i32 %t27 to i8
br label %exp16
exp16:
br label %exp17
exp17:
%t30 = icmp eq i8 0, 0
br i1 %t30, label %divzerolabel2, label %end_divzerolabel2
divzerolabel2:
%ptr5 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr5)
call void @exit(i32 1)
br label %end_divzerolabel2
end_divzerolabel2:
%t29 = udiv i8 %t28, 0
%z5 = zext i8 %t29 to i32
store i32 %z5, i32* %ptr3
%ptr6 = getelementptr [6 x i8], [6 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr6)
br label %exp18
exp18:
%t31 = load i32, i32* %ptr3
%t32 = trunc i32 %t31 to i8
br label %exp19
exp19:
%t33 = load i32, i32* %ptr3
%t34 = trunc i32 %t33 to i8
br label %exp20
exp20:
%t35 = add i8 %t32, %t34
%z6 = zext i8 %t35 to i32
store i32 %z6, i32* %ptr3
br label %exp21
exp21:
%t36 = load i32, i32* %ptr3
%t37 = trunc i32 %t36 to i8
%t38 = zext i8 %t37 to i32
call void @printi(i32 %t38)
br label %exp22
exp22:
%t39 = load i32, i32* %ptr3
%t40 = trunc i32 %t39 to i8
br label %exp23
exp23:
%t41 = load i32, i32* %ptr3
%t42 = trunc i32 %t41 to i8
br label %exp24
exp24:
%t43 = add i8 %t40, %t42
%z7 = zext i8 %t43 to i32
store i32 %z7, i32* %ptr3
br label %exp25
exp25:
%t44 = load i32, i32* %ptr3
%t45 = trunc i32 %t44 to i8
%t46 = zext i8 %t45 to i32
call void @printi(i32 %t46)
%ptr7 = getelementptr [23 x i8], [23 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr7)
ret void
}
