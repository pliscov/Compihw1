@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [21 x i8] c"anotha while for you\00"
@str2 = internal constant [14 x i8] c"OK youre good\00"
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
%ptr1 = getelementptr [21 x i8], [21 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %num1
num1:
%ptr2 = alloca i32
store i32 0, i32* %ptr2
br label %id1
id1:
%t1 = load i32, i32* %ptr2
br label %num2
num2:
br label %reloplabel1
reloplabel1:
%t2 = icmp slt i32 %t1, 2
br i1 %t2, label %truelabel1, label %endlabel1
br label %truelabel1
truelabel1:
br label %id2
id2:
%t3 = load i32, i32* %ptr2
call void @printi(i32 %t3)
br label %id3
id3:
%t4 = load i32, i32* %ptr2
br label %num3
num3:
br label %add1
add1:
%t5 = add i32 %t4, 1
store i32 %t5, i32* %ptr2
br label %id1
br label %endlabel1
endlabel1:
%ptr3 = getelementptr [14 x i8], [14 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr3)
ret void
ret void 
}
