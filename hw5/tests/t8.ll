@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [74 x i8] c"You thought we were done with byte calculations?? HA! don't make me laugh\00"
@str2 = internal constant [22 x i8] c"Expecting 254 255 254\00"
@str3 = internal constant [7 x i8] c"OK bye\00"
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
%ptr1 = getelementptr [74 x i8], [74 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [22 x i8], [22 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %exp1
exp1:
%ptr3 = alloca i32
%z1 = zext i8 254 to i32
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
br label %exp5
exp5:
%t6 = add i8 %t5, 1
%z2 = zext i8 %t6 to i32
store i32 %z2, i32* %ptr3
br label %exp6
exp6:
%t7 = load i32, i32* %ptr3
%t8 = trunc i32 %t7 to i8
%t9 = zext i8 %t8 to i32
call void @printi(i32 %t9)
br label %exp7
exp7:
%t10 = load i32, i32* %ptr3
%t11 = trunc i32 %t10 to i8
br label %exp8
exp8:
br label %exp9
exp9:
%t12 = mul i8 %t11, 2
%z3 = zext i8 %t12 to i32
store i32 %z3, i32* %ptr3
br label %exp10
exp10:
%t13 = load i32, i32* %ptr3
%t14 = trunc i32 %t13 to i8
%t15 = zext i8 %t14 to i32
call void @printi(i32 %t15)
%ptr4 = getelementptr [7 x i8], [7 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
ret void
}
