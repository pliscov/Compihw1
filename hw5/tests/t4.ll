@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [28 x i8] c"X should be 1, but you got:\00"
@str2 = internal constant [35 x i8] c"Y should be -4 (x-5), but you got:\00"
@str3 = internal constant [17 x i8] c"fucking loser...\00"
@str4 = internal constant [9 x i8] c"I'M DONE\00"
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
br label %num1
num1:
br label %num2
num2:
br label %sub1
sub1:
%t1 = sub i32 4, 3
%ptr1 = alloca i32
store i32 %t1, i32* %ptr1
%ptr2 = getelementptr [28 x i8], [28 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr2)
br label %id1
id1:
%t2 = load i32, i32* %ptr1
call void @printi(i32 %t2)
br label %id2
id2:
%t3 = load i32, i32* %ptr1
br label %num3
num3:
br label %sub2
sub2:
%t4 = sub i32 %t3, 5
%ptr3 = alloca i32
store i32 %t4, i32* %ptr3
%ptr4 = getelementptr [35 x i8], [35 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr4)
br label %id3
id3:
%t5 = load i32, i32* %ptr3
call void @printi(i32 %t5)
br label %id4
id4:
%t6 = load i32, i32* %ptr3
br label %num4
num4:
br label %num5
num5:
br label %sub3
sub3:
%t7 = sub i32 0, 4
br label %reloplabel1
reloplabel1:
%t8 = icmp ne i32 %t6, %t7
br i1 %t8, label %truelabel1, label %falselabel1
br label %truelabel1
truelabel1:
%ptr5 = getelementptr [17 x i8], [17 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr5)
br label %endlabel1
br label %falselabel1
falselabel1:
%ptr6 = getelementptr [9 x i8], [9 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr6)
br label %endlabel1
endlabel1:
ret void 
}
