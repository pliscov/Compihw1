@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [34 x i8] c"This is another nested trenary op\00"
@str2 = internal constant [28 x i8] c"I am sick of this, are you?\00"
@str3 = internal constant [32 x i8] c"expected res is 8 and you got: \00"
@str4 = internal constant [4 x i8] c"Bye\00"
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
%ptr1 = getelementptr [34 x i8], [34 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [28 x i8], [28 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %num1
num1:
br label %num2
num2:
br label %num3
add1:
%t1 = add i32 7, 3
br label %truelabel2
br label %num3
num3:
br label %num4
num4:
br label %reloplabel1
reloplabel1:
%t2 = icmp slt i32 5, 3
br i1 %t2, label %add1, label %num6
br label %num6
num5:
br label %truelabel1
br label %num6
num6:
br label %num7
num7:
br label %reloplabel2
reloplabel2:
%t3 = icmp eq i32 6, 6
br i1 %t3, label %num5, label %num8
br label %num8
num8:
br label %falselabel1
truelabel1:
br label %endlabel1
falselabel1:
br label %endlabel1
endlabel1:
%t4 = phi i32 [8, %truelabel1 ], [9, %falselabel1 ]
br label %falselabel2
truelabel2:
br label %endlabel2
falselabel2:
br label %endlabel2
endlabel2:
%t5 = phi i32 [%t1, %truelabel2 ], [%t4, %falselabel2 ]
%ptr3 = alloca i32
store i32 %t5, i32* %ptr3
%ptr4 = getelementptr [32 x i8], [32 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
br label %id1
id1:
%t6 = load i32, i32* %ptr3
call void @printi(i32 %t6)
%ptr5 = getelementptr [4 x i8], [4 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr5)
ret void 
}
