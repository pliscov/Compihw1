@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [24 x i8] c"This is the third test!\00"
@str2 = internal constant [32 x i8] c"Here we will test division by 0\00"
@str3 = internal constant [23 x i8] c"now calculating 1 + 2:\00"
@str4 = internal constant [15 x i8] c"The result is:\00"
@str5 = internal constant [28 x i8] c"now calculating prev_res/0 \00"
@str6 = internal constant [23 x i8] c"You shouldn't be here!\00"
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
%ptr1 = getelementptr [24 x i8], [24 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [32 x i8], [32 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
%ptr3 = getelementptr [23 x i8], [23 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr3)
br label %num1
num1:
br label %num2
num2:
br label %add1
add1:
%t1 = add i32 1, 2
%ptr4 = alloca i32
store i32 %t1, i32* %ptr4
%ptr5 = getelementptr [15 x i8], [15 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr5)
br label %id1
id1:
%t2 = load i32, i32* %ptr4
call void @printi(i32 %t2)
%ptr6 = getelementptr [28 x i8], [28 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr6)
br label %id2
id2:
%t3 = load i32, i32* %ptr4
br label %num3
num3:
br label %div1
div1:
%t5 = icmp eq i32 0, 0
br i1 %t5, label %divzerolabel1, label %end_divzerolabel1
divzerolabel1:
%ptr7 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr7)
call void @exit(i32 1)
br label %end_divzerolabel1
end_divzerolabel1:
%t4 = sdiv i32 %t3, 0
%ptr8 = alloca i32
store i32 %t4, i32* %ptr8
%ptr9 = getelementptr [23 x i8], [23 x i8]* @str6, i32 0, i32 0
call void @print(i8* %ptr9)
ret void 
}
