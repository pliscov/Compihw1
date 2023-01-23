@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [13 x i8] c"Expecting 45\00"
@str2 = internal constant [5 x i8] c"done\00"
@str3 = internal constant [7 x i8] c"FAILED\00"
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

define i8 @advancedFunc(i32 ) {
br label %id1
id1:
%t1 = load i32, i32* 
%t2 = trunc i32 %t1 to i8
%t3 = zext i8 %t2 to i32
ret i8 %t3
ret i8 0
}
define i1 @getTrue() {
br label %true1
true1:
br label %truebool1
truebool1:
br label @
ret i1 true
ret i1 false
}
define void @main() {
%ptr1 = getelementptr [13 x i8], [13 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%t4 = call i1@getTrue()
br label %call1
call1:
br label %truelabel1
truelabel1:
br label %num1
num1:
%t5 = call i8 @advancedFunc(i32 45)
br label %call2
call2:
%ptr2 = alloca i32
store i32 %t5, i32* %ptr2
br label %id2
id2:
%t6 = load i32, i32* %ptr2
%t7 = trunc i32 %t6 to i8
%t8 = zext i8 %t7 to i32
call void @printi(i32 %t8)
%ptr3 = getelementptr [5 x i8], [5 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr3)
ret void
br label %endlabel1
endlabel1:
%ptr4 = getelementptr [7 x i8], [7 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
ret void 
}
