@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [29 x i8] c"this is the very first test!\00"
@str2 = internal constant [43 x i8] c"Here we test basic calculation and storing\00"
@str3 = internal constant [19 x i8] c"Calculating 1+2...\00"
@str4 = internal constant [16 x i8] c"the result is: \00"
@str5 = internal constant [5 x i8] c"Bye!\00"
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
%ptr1 = getelementptr [29 x i8], [29 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [43 x i8], [43 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
%ptr3 = getelementptr [19 x i8], [19 x i8]* @str3, i32 0, i32 0
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
%ptr6 = getelementptr [5 x i8], [5 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr6)
ret void
ret void
}
