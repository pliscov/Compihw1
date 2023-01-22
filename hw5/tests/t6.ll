@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [28 x i8] c"100 / (256b) is div by zero\00"
@str2 = internal constant [35 x i8] c"You failed this basic test! (lmao)\00"
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
%ptr1 = getelementptr [28 x i8], [28 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %exp1
exp1:
%ptr2 = alloca i32
%z1 = zext i8 100 to i32
store i32 %z1, i32* %ptr2
br label %exp2
exp2:
%t1 = load i32, i32* %ptr2
%t2 = trunc i32 %t1 to i8
br label %exp3
exp3:
%t3 = load i32, i32* %ptr2
%t4 = trunc i32 %t3 to i8
br label %exp4
exp4:
br label %exp5
exp5:
%t5 = add i8 %t4, 156
br label %exp6
exp6:
%t7 = icmp eq i8 0, %t5
br i1 %t7, label %divzerolabel1, label %end_divzerolabel1
divzerolabel1:
%ptr3 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr3)
call void @exit(i32 1)
br label %end_divzerolabel1
end_divzerolabel1:
%t6 = udiv i8 %t2, %t5
%z2 = zext i8 %t6 to i32
store i32 %z2, i32* %ptr2
%ptr4 = getelementptr [35 x i8], [35 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr4)
ret void
}
