@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [23 x i8] c"this is recursion test\00"
@str2 = internal constant [33 x i8] c"we will calculate factorial num:\00"
@str3 = internal constant [34 x i8] c"factorial(2) should be 2. actual:\00"
@str4 = internal constant [37 x i8] c"factorial(7) should be 5040. actual:\00"
@str5 = internal constant [34 x i8] c"factorial(0) should be 1. actual:\00"
@str6 = internal constant [8 x i8] c"OK bye!\00"
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

define i32 @factorial(i32 ) {
br label %id1
id1:
%t1 = load i32, i32* 
br label %num1
num1:
br label %reloplabel1
reloplabel1:
%t2 = icmp sle i32 %t1, 1
br i1 %t2, label %truelabel1, label %endlabel1
br label %truelabel1
truelabel1:
br label %num2
num2:
ret i32 1
br label %endlabel1
endlabel1:
br label %id2
id2:
%t3 = load i32, i32* 
br label %num3
num3:
br label %sub1
sub1:
%t4 = sub i32 %t3, 1
%t5 = call i32 @factorial(i32 %t4)
br label %call1
call1:
br label %id3
id3:
%t6 = load i32, i32* 
br label %mul1
mul1:
%t7 = mul i32 %t5, %t6
ret i32 %t7
ret i32 0
}
define void @main() {
%ptr1 = getelementptr [23 x i8], [23 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [33 x i8], [33 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %num4
num4:
%t8 = call i32 @factorial(i32 2)
br label %call2
call2:
%ptr3 = alloca i32
store i32 %t8, i32* %ptr3
br label %num5
num5:
%t9 = call i32 @factorial(i32 7)
br label %call3
call3:
%ptr4 = alloca i32
store i32 %t9, i32* %ptr4
br label %num6
num6:
%t10 = call i32 @factorial(i32 0)
br label %call4
call4:
%ptr5 = alloca i32
store i32 %t10, i32* %ptr5
%ptr6 = getelementptr [34 x i8], [34 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr6)
br label %id4
id4:
%t11 = load i32, i32* %ptr3
call void @printi(i32 %t11)
%ptr7 = getelementptr [37 x i8], [37 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr7)
br label %id5
id5:
%t12 = load i32, i32* %ptr4
call void @printi(i32 %t12)
%ptr8 = getelementptr [34 x i8], [34 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr8)
br label %id6
id6:
%t13 = load i32, i32* %ptr5
call void @printi(i32 %t13)
%ptr9 = getelementptr [8 x i8], [8 x i8]* @str6, i32 0, i32 0
call void @print(i8* %ptr9)
ret void 
}
