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
br label %byte1
byte1:
%ptr2 = alloca i32
store i32 100, i32* %ptr2
br label %id1
id1:
%t1 = load i32, i32* %ptr2
%t2 = trunc i32 %t1 to i8
%t3 = zext i8 %t2 to i32
br label %id2
id2:
%t4 = load i32, i32* %ptr2
%t5 = trunc i32 %t4 to i8
%t6 = zext i8 %t5 to i32
br label %byte2
byte2:
br label %add1
add1:
%t7 = add i32 %t6, 156
%t8 = trunc i32 %t7 to i8
%t9 = zext i8 %t8 to i32
br label %div1
div1:
%t11 = icmp eq i32 0, %t9
br i1 %t11, label %divzerolabel1, label %end_divzerolabel1
divzerolabel1:
%ptr3 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr3)
call void @exit(i32 1)
br label %end_divzerolabel1
end_divzerolabel1:
%t10 = udiv i32 %t3, %t9
%t12 = trunc i32 %t10 to i8
%t13 = zext i8 %t12 to i32
store i32 %t13, i32* %ptr2
%ptr4 = getelementptr [35 x i8], [35 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr4)
ret void 
}
