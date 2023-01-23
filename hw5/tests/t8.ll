@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [74 x i8] c"You thought we were done with byte calculations?? HA! don't make me laugh\00"
@str2 = internal constant [22 x i8] c"Expecting 254 255 254\00"
@str3 = internal constant [7 x i8] c"OK bye\00"
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
%ptr1 = getelementptr [74 x i8], [74 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [22 x i8], [22 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %byte1
byte1:
%ptr3 = alloca i32
store i32 254, i32* %ptr3
br label %id1
id1:
%t1 = load i32, i32* %ptr3
%t2 = trunc i32 %t1 to i8
%t3 = zext i8 %t2 to i32
call void @printi(i32 %t3)
br label %id2
id2:
%t4 = load i32, i32* %ptr3
%t5 = trunc i32 %t4 to i8
%t6 = zext i8 %t5 to i32
br label %byte2
byte2:
br label %add1
add1:
%t7 = add i32 %t6, 1
%t8 = trunc i32 %t7 to i8
%t9 = zext i8 %t8 to i32
store i32 %t9, i32* %ptr3
br label %id3
id3:
%t10 = load i32, i32* %ptr3
%t11 = trunc i32 %t10 to i8
%t12 = zext i8 %t11 to i32
call void @printi(i32 %t12)
br label %id4
id4:
%t13 = load i32, i32* %ptr3
%t14 = trunc i32 %t13 to i8
%t15 = zext i8 %t14 to i32
br label %byte3
byte3:
br label %mul1
mul1:
%t16 = mul i32 %t15, 2
%t17 = trunc i32 %t16 to i8
%t18 = zext i8 %t17 to i32
store i32 %t18, i32* %ptr3
br label %id5
id5:
%t19 = load i32, i32* %ptr3
%t20 = trunc i32 %t19 to i8
%t21 = zext i8 %t20 to i32
call void @printi(i32 %t21)
%ptr4 = getelementptr [7 x i8], [7 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
ret void 
}
