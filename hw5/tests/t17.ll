@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [27 x i8] c"IDK anymore what is this..\00"
@str2 = internal constant [13 x i8] c"You are good\00"
@str3 = internal constant [12 x i8] c"You are bad\00"
@str4 = internal constant [18 x i8] c"Ari v. Cherchyiil\00"
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
%ptr1 = getelementptr [27 x i8], [27 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %num1
num1:
br label %num2
num2:
br label %reloplabel1
reloplabel1:
%t1 = icmp slt i32 1, 2
br i1 %t1, label %truelabel1, label %endlabel1
br label %truelabel1
truelabel1:
br label %num3
num3:
%ptr2 = alloca i32
store i32 1, i32* %ptr2
%ptr3 = getelementptr [13 x i8], [13 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr3)
br label %endlabel1
endlabel1:
br label %num4
num4:
br label %num5
num5:
br label %reloplabel2
reloplabel2:
%t2 = icmp slt i32 1, 2
br i1 %t2, label %endlabel2, label %truelabel2
br label %not1
not1:
br label %truelabel2
truelabel2:
%ptr4 = getelementptr [12 x i8], [12 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
br label %endlabel2
endlabel2:
%ptr5 = alloca i32
store i32 0, i32* %ptr5
%ptr6 = getelementptr [18 x i8], [18 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr6)
ret void 
}
