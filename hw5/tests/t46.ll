@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [18 x i8] c"Called basicFunc!\00"
@str2 = internal constant [16 x i8] c"Should print 38\00"
@str3 = internal constant [9 x i8] c"Finished\00"
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

define i32 @basicFunc() {
%ptr1 = getelementptr [18 x i8], [18 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %num1
num1:
ret i32 38
ret i32 0
}
define void @main() {
%ptr2 = getelementptr [16 x i8], [16 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
%t1 = call i32@basicFunc()
br label %call1
call1:
call void @printi(i32 %t1)
%ptr3 = getelementptr [9 x i8], [9 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr3)
ret void 
}
