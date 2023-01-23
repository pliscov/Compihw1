@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [46 x i8] c"just checking order of computation real quick\00"
@str2 = internal constant [41 x i8] c"Did you get 8? because that's the answer\00"
@str3 = internal constant [13 x i8] c"No! you got:\00"
@str4 = internal constant [11 x i8] c"OK bye now\00"
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
%ptr1 = getelementptr [46 x i8], [46 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %num1
num1:
br label %num2
num2:
br label %num3
num3:
br label %mul1
mul1:
%t1 = mul i32 2, 3
br label %num4
num4:
br label %div1
div1:
%t3 = icmp eq i32 0, 2
br i1 %t3, label %divzerolabel1, label %end_divzerolabel1
divzerolabel1:
%ptr2 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr2)
call void @exit(i32 1)
br label %end_divzerolabel1
end_divzerolabel1:
%t2 = sdiv i32 %t1, 2
br label %add1
add1:
%t4 = add i32 1, %t2
br label %num5
num5:
br label %add2
add2:
%t5 = add i32 %t4, 5
br label %num6
num6:
br label %sub1
sub1:
%t6 = sub i32 %t5, 1
%ptr3 = alloca i32
store i32 %t6, i32* %ptr3
%ptr4 = getelementptr [41 x i8], [41 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr4)
%ptr5 = getelementptr [13 x i8], [13 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr5)
br label %id1
id1:
%t7 = load i32, i32* %ptr3
call void @printi(i32 %t7)
%ptr6 = getelementptr [11 x i8], [11 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr6)
ret void 
}
