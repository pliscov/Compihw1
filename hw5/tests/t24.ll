@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [31 x i8] c"ok this is the last while test\00"
@str2 = internal constant [43 x i8] c"now entering infinite loop, wait for break\00"
@str3 = internal constant [7 x i8] c"BREAK!\00"
@str4 = internal constant [44 x i8] c"Well done! you didn't get stuck in there...\00"
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
%ptr1 = getelementptr [31 x i8], [31 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %num1
num1:
%ptr2 = alloca i32
store i32 0, i32* %ptr2
%ptr3 = getelementptr [43 x i8], [43 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr3)
br label %true1
true1:
br label %truebool1
truebool1:
br label %truelabel1
br label %truelabel1
truelabel1:
br label %id1
id1:
%t1 = load i32, i32* %ptr2
call void @printi(i32 %t1)
br label %id2
id2:
%t2 = load i32, i32* %ptr2
br label %num2
num2:
br label %add1
add1:
%t3 = add i32 %t2, 1
store i32 %t3, i32* %ptr2
br label %id3
id3:
%t4 = load i32, i32* %ptr2
br label %num3
num3:
br label %reloplabel1
reloplabel1:
%t5 = icmp sge i32 %t4, 10
br i1 %t5, label %truelabel2, label %falselabel1
br label %truelabel2
truelabel2:
%ptr4 = getelementptr [7 x i8], [7 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
br label %endlabel2
br label %endlabel1
br label %falselabel1
falselabel1:
br label %num4
num4:
%ptr5 = alloca i32
store i32 0, i32* %ptr5
br label %endlabel1
endlabel1:
br label %true1
br label %endlabel2
endlabel2:
%ptr6 = getelementptr [44 x i8], [44 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr6)
ret void 
}
