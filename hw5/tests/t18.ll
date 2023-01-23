@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [40 x i8] c"Hey, I got one more IDK test for you <3\00"
@str2 = internal constant [29 x i8] c"Should fin immidieijiajietly\00"
@str3 = internal constant [4 x i8] c"Fin\00"
@str4 = internal constant [10 x i8] c"Fin again\00"
@str5 = internal constant [16 x i8] c"Fin again again\00"
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
%ptr1 = getelementptr [40 x i8], [40 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [29 x i8], [29 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %num1
num1:
%ptr3 = alloca i32
store i32 2, i32* %ptr3
br label %id1
id1:
%t1 = load i32, i32* %ptr3
br label %num2
num2:
br label %reloplabel1
reloplabel1:
%t2 = icmp slt i32 %t1, 7
br i1 %t2, label %truelabel1, label %falselabel1
br label %truelabel1
truelabel1:
%ptr4 = getelementptr [4 x i8], [4 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
ret void
br label %endlabel1
br label %falselabel1
falselabel1:
br label %num3
num3:
store i32 0, i32* %ptr3
br label %endlabel1
endlabel1:
%ptr5 = getelementptr [10 x i8], [10 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr5)
ret void
%ptr6 = getelementptr [16 x i8], [16 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr6)
ret void 
}
