@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [26 x i8] c"A while test just for you\00"
@str2 = internal constant [40 x i8] c"Expecting 0...11 and then 'I hate this'\00"
@str3 = internal constant [19 x i8] c"iteration number: \00"
@str4 = internal constant [18 x i8] c"YOU ARE A FAILURE\00"
@str5 = internal constant [34 x i8] c"I hate this, but you good.... Bye\00"
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
%ptr1 = getelementptr [26 x i8], [26 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [40 x i8], [40 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %num1
num1:
%ptr3 = alloca i32
store i32 0, i32* %ptr3
br label %true1
true1:
br label %truebool1
truebool1:
br label %truelabel1
br label %truelabel1
truelabel1:
%ptr4 = getelementptr [19 x i8], [19 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
br label %id1
id1:
%t1 = load i32, i32* %ptr3
call void @printi(i32 %t1)
%ptr5 = alloca i32
store i32 0, i32* %ptr5
br label %id2
id2:
%t2 = load i32, i32* %ptr3
br label %num2
num2:
br label %add1
add1:
%t3 = add i32 %t2, 1
store i32 %t3, i32* %ptr3
br label %id3
id3:
%t4 = load i32, i32* %ptr3
br label %num3
num3:
br label %reloplabel1
reloplabel1:
%t5 = icmp eq i32 %t4, 12
br i1 %t5, label %truelabel2, label %endlabel1
br label %truelabel2
truelabel2:
br label %endlabel2
br label %endlabel1
endlabel1:
br label %truebool1
%ptr6 = getelementptr [18 x i8], [18 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr6)
br label %true1
br label %endlabel2
endlabel2:
%ptr7 = getelementptr [34 x i8], [34 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr7)
ret void 
}
