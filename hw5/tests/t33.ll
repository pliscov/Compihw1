@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [42 x i8] c"Make sure not to evaluate the div by zero\00"
@str2 = internal constant [12 x i8] c"you did it!\00"
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
%ptr1 = getelementptr [42 x i8], [42 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %num1
num1:
%ptr2 = alloca i32
store i32 0, i32* %ptr2
br label %num2
num2:
br label %id1
id1:
%t1 = load i32, i32* %ptr2
br label %id2
div1:
%t3 = icmp eq i32 0, %t1
br i1 %t3, label %divzerolabel1, label %end_divzerolabel1
divzerolabel1:
%ptr3 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr3)
call void @exit(i32 1)
br label %end_divzerolabel1
end_divzerolabel1:
%t2 = sdiv i32 5, %t1
br label %truelabel1
br label %id2
id2:
%t4 = load i32, i32* %ptr2
br label %num3
num3:
br label %reloplabel1
reloplabel1:
%t5 = icmp ne i32 %t4, 0
br i1 %t5, label %div1, label %num4
br label %num4
num4:
br label %falselabel1
truelabel1:
br label %endlabel1
falselabel1:
br label %endlabel1
endlabel1:
%t6 = phi i32 [%t2, %truelabel1 ], [0, %falselabel1 ]
%ptr4 = alloca i32
store i32 %t6, i32* %ptr4
br label %id3
id3:
%t7 = load i32, i32* %ptr4
call void @printi(i32 %t7)
%ptr5 = getelementptr [12 x i8], [12 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr5)
ret void 
}
