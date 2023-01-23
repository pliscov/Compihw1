@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [37 x i8] c"HA! I lied this is also a while test\00"
@str2 = internal constant [70 x i8] c"more infinite loops for you - should break after one iteration though\00"
@str3 = internal constant [42 x i8] c"Make sure not to compute the incomputable\00"
@str4 = internal constant [15 x i8] c"YOU ARE BRAVE!\00"
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
%ptr1 = getelementptr [37 x i8], [37 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %num1
num1:
%ptr2 = alloca i32
store i32 0, i32* %ptr2
%ptr3 = getelementptr [70 x i8], [70 x i8]* @str2, i32 0, i32 0
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
br label %endlabel1
br label %id2
id2:
%t2 = load i32, i32* %ptr2
call void @printi(i32 %t2)
br label %true1
br label %endlabel1
endlabel1:
%ptr4 = getelementptr [42 x i8], [42 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
br label %num2
num2:
br label %num3
num3:
br label %false1
div1:
%t4 = icmp eq i32 0, 0
br i1 %t4, label %divzerolabel1, label %end_divzerolabel1
divzerolabel1:
%ptr5 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr5)
call void @exit(i32 1)
br label %end_divzerolabel1
end_divzerolabel1:
%t3 = sdiv i32 1, 0
br label %truelabel2
br label %false1
false1:
br label %falsebool1
falsebool1:
br label %num4
br label %num4
num4:
br label %falselabel1
truelabel2:
br label %endlabel2
falselabel1:
br label %endlabel2
endlabel2:
%t5 = phi i32 [%t3, %truelabel2 ], [1, %falselabel1 ]
%ptr6 = alloca i32
store i32 %t5, i32* %ptr6
%ptr7 = getelementptr [15 x i8], [15 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr7)
ret void 
}
