@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [13 x i8] c"Expecting 32\00"
@str2 = internal constant [5 x i8] c"done\00"
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

define i32 @failed2return(i32 , i32 , i32 , i32 ) {
br label %id1
id1:
%t1 = load i32, i32* 
br label %id2
id2:
%t2 = load i32, i32* 
br label %add1
add1:
%t3 = add i32 %t1, %t2
br label %id3
id3:
%t4 = load i32, i32* 
br label %add2
add2:
%t5 = add i32 %t3, %t4
br label %id4
id4:
%t6 = load i32, i32* 
%t7 = trunc i32 %t6 to i8
%t8 = zext i8 %t7 to i32
br label %add3
add3:
%t9 = add i32 %t5, %t8
%ptr1 = alloca i32
store i32 %t9, i32* %ptr1
br label %id5
id5:
%t10 = load i32, i32* %ptr1
br label %id6
id6:
%t11 = load i32, i32* 
br label %mul1
mul1:
%t12 = mul i32 %t10, %t11
%ptr2 = alloca i32
store i32 %t12, i32* %ptr2
br label %id7
id7:
%t13 = load i32, i32* %ptr2
ret i32 %t13
ret i32 0
}
define void @main() {
%ptr3 = getelementptr [13 x i8], [13 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr3)
br label %num1
num1:
br label %num2
num2:
br label %num3
num3:
br label %num4
num4:
br label %num5
num5:
br label %byte1
byte1:
%t14 = call i32 @failed2return(i32 1, i32 1, i32 1, i32 1)
br label %call1
call1:
br label %byte2
byte2:
%t15 = call i32 @failed2return(i32 1, i32 1, i32 %t14, i32 1)
br label %call2
call2:
br label %num6
num6:
br label %num7
num7:
br label %byte3
byte3:
%t16 = call i32 @failed2return(i32 %t15, i32 2, i32 3, i32 4)
br label %call3
call3:
call void @printi(i32 %t16)
%ptr4 = getelementptr [5 x i8], [5 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr4)
ret void 
}
