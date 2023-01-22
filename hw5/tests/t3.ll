@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [25 x i8] c"This is the fourth test!\00"
@str2 = internal constant [30 x i8] c"Here we test all calculations\00"
@str3 = internal constant [28 x i8] c"now testing add - x = 1 + 2\00"
@str4 = internal constant [16 x i8] c"The result is: \00"
@str5 = internal constant [28 x i8] c"now testing mul - y = x * 4\00"
@str6 = internal constant [16 x i8] c"The result is: \00"
@str7 = internal constant [26 x i8] c"now testing add z = x + y\00"
@str8 = internal constant [16 x i8] c"The result is: \00"
@str9 = internal constant [24 x i8] c"now testing div y = x/z\00"
@str10 = internal constant [16 x i8] c"The result is: \00"
@str11 = internal constant [5 x i8] c"Bye!\00"
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
%ptr1 = getelementptr [25 x i8], [25 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [30 x i8], [30 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
%ptr3 = getelementptr [28 x i8], [28 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr3)
br label %exp1
exp1:
br label %exp2
exp2:
br label %exp3
exp3:
%t1 = add i32 1, 2
%ptr4 = alloca i32
store i32 %t1, i32* %ptr4
%ptr5 = getelementptr [16 x i8], [16 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr5)
br label %exp4
exp4:
%t2 = load i32, i32* %ptr4
call void @printi(i32 %t2)
%ptr6 = getelementptr [28 x i8], [28 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr6)
br label %exp5
exp5:
%t3 = load i32, i32* %ptr4
br label %exp6
exp6:
br label %exp7
exp7:
%t4 = mul i32 %t3, 4
%ptr7 = alloca i32
store i32 %t4, i32* %ptr7
%ptr8 = getelementptr [16 x i8], [16 x i8]* @str6, i32 0, i32 0
call void @print(i8* %ptr8)
br label %exp8
exp8:
%t5 = load i32, i32* %ptr7
call void @printi(i32 %t5)
%ptr9 = getelementptr [26 x i8], [26 x i8]* @str7, i32 0, i32 0
call void @print(i8* %ptr9)
br label %exp9
exp9:
%t6 = load i32, i32* %ptr4
br label %exp10
exp10:
%t7 = load i32, i32* %ptr7
br label %exp11
exp11:
%t8 = add i32 %t6, %t7
%ptr10 = alloca i32
store i32 %t8, i32* %ptr10
%ptr11 = getelementptr [16 x i8], [16 x i8]* @str8, i32 0, i32 0
call void @print(i8* %ptr11)
br label %exp12
exp12:
%t9 = load i32, i32* %ptr10
call void @printi(i32 %t9)
%ptr12 = getelementptr [24 x i8], [24 x i8]* @str9, i32 0, i32 0
call void @print(i8* %ptr12)
br label %exp13
exp13:
%t10 = load i32, i32* %ptr4
br label %exp14
exp14:
%t11 = load i32, i32* %ptr10
br label %exp15
exp15:
%t13 = icmp eq i32 0, %t11
br i1 %t13, label %divzerolabel1, label %end_divzerolabel1
divzerolabel1:
%ptr13 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr13)
call void @exit(i32 1)
br label %end_divzerolabel1
end_divzerolabel1:
%t12 = sdiv i32 %t10, %t11
store i32 %t12, i32* %ptr7
%ptr14 = getelementptr [16 x i8], [16 x i8]* @str10, i32 0, i32 0
call void @print(i8* %ptr14)
br label %exp16
exp16:
%t14 = load i32, i32* %ptr7
call void @printi(i32 %t14)
%ptr15 = getelementptr [5 x i8], [5 x i8]* @str11, i32 0, i32 0
call void @print(i8* %ptr15)
ret void
}
