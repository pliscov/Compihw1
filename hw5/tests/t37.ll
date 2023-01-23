@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [18 x i8] c"Called basicFunc!\00"
@str2 = internal constant [9 x i8] c"Finished\00"
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

define void @basicFunc() {
%ptr1 = getelementptr [18 x i8], [18 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
ret void 
}
define void @main() {
call void@basicFunc()
%ptr2 = getelementptr [9 x i8], [9 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
ret void 
}
