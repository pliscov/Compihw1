@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [23 x i8] c"This is single trenary\00"
@str2 = internal constant [31 x i8] c"you were supposed to get x = 0\00"
@str3 = internal constant [25 x i8] c"but you got this insted:\00"
@str4 = internal constant [6 x i8] c"loser\00"
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
%ptr1 = getelementptr [23 x i8], [23 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %num2
num1:
br label %truelabel1
br label %num2
num2:
br label %num3
num3:
br label %reloplabel1
reloplabel1:
%t1 = icmp eq i32 1, 0
br i1 %t1, label %num1, label %num4
br label %num4
num4:
br label %falselabel1
truelabel1:
br label %endlabel1
falselabel1:
br label %endlabel1
endlabel1:
%t2 = phi i32 [1, %truelabel1 ], [0, %falselabel1 ]
%ptr2 = alloca i32
store i32 %t2, i32* %ptr2
%ptr3 = getelementptr [31 x i8], [31 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr3)
%ptr4 = getelementptr [25 x i8], [25 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
br label %id1
id1:
%t3 = load i32, i32* %ptr2
call void @printi(i32 %t3)
%ptr5 = getelementptr [6 x i8], [6 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr5)
ret void 
}
