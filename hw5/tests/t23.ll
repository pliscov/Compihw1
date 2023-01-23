@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [17 x i8] c"MORE while tests\00"
@str2 = internal constant [63 x i8] c"will be calculating x + 1 in each iteration starting from x= 0\00"
@str3 = internal constant [7 x i8] c"x is: \00"
@str4 = internal constant [13 x i8] c"You are good\00"
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
%ptr1 = getelementptr [17 x i8], [17 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [63 x i8], [63 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %num1
num1:
%ptr3 = alloca i32
store i32 0, i32* %ptr3
br label %id1
id1:
%t1 = load i32, i32* %ptr3
br label %num2
num2:
br label %reloplabel1
reloplabel1:
%t2 = icmp slt i32 %t1, 23
br i1 %t2, label %truelabel1, label %false1
br label %false1
false1:
br label %falsebool1
falsebool1:
br label %endlabel1
br label %truelabel1
truelabel1:
%ptr4 = getelementptr [7 x i8], [7 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
br label %id2
id2:
%t3 = load i32, i32* %ptr3
call void @printi(i32 %t3)
br label %id3
id3:
%t4 = load i32, i32* %ptr3
br label %num3
num3:
br label %add1
add1:
%t5 = add i32 %t4, 1
store i32 %t5, i32* %ptr3
br label %id1
br label %id4
id4:
%t6 = load i32, i32* %ptr3
br label %id5
id5:
%t7 = load i32, i32* %ptr3
br label %sub1
sub1:
%t8 = sub i32 %t6, %t7
%ptr5 = alloca i32
store i32 %t8, i32* %ptr5
br label %id6
id6:
%t9 = load i32, i32* %ptr5
br label %id7
id7:
%t10 = load i32, i32* %ptr5
br label %div1
div1:
%t12 = icmp eq i32 0, %t10
br i1 %t12, label %divzerolabel1, label %end_divzerolabel1
divzerolabel1:
%ptr6 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr6)
call void @exit(i32 1)
br label %end_divzerolabel1
end_divzerolabel1:
%t11 = sdiv i32 %t9, %t10
store i32 %t11, i32* %ptr5
br label %id1
br label %endlabel1
endlabel1:
%ptr7 = getelementptr [13 x i8], [13 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr7)
ret void 
}
