@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [38 x i8] c"A little nested if test because I can\00"
@str2 = internal constant [41 x i8] c"should print incredibles and 0 (and fin)\00"
@str3 = internal constant [13 x i8] c"INCREDIBLEs!\00"
@str4 = internal constant [4 x i8] c"fin\00"
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
%ptr1 = getelementptr [38 x i8], [38 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [41 x i8], [41 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %true1
true1:
br label %truebool1
truebool1:
br label %truelabel1
br label %truelabel1
truelabel1:
br label %num1
num1:
br label %num2
num2:
br label %reloplabel1
reloplabel1:
%t1 = icmp eq i32 5, 5
br i1 %t1, label %truelabel2, label %falselabel1
br label %truelabel2
truelabel2:
%ptr3 = getelementptr [13 x i8], [13 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr3)
%ptr4 = alloca i32
store i32 0, i32* %ptr4
br label %id1
id1:
%t2 = load i32, i32* %ptr4
call void @printi(i32 %t2)
br label %endlabel1
br label %falselabel1
falselabel1:
%ptr5 = alloca i32
store i32 0, i32* %ptr5
br label %endlabel1
endlabel1:
br label %endlabel2
endlabel2:
%ptr6 = getelementptr [4 x i8], [4 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr6)
ret void 
}
