@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [21 x i8] c"surprise while test!\00"
@str2 = internal constant [46 x i8] c"div by 0 should appear by the 256th iteration\00"
@str3 = internal constant [22 x i8] c"infinite loop coming:\00"
@str4 = internal constant [12 x i8] c"iteration: \00"
@str5 = internal constant [19 x i8] c"Shouldn't get here\00"
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
%ptr2 = getelementptr [46 x i8], [46 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %byte1
byte1:
%ptr3 = alloca i32
store i32 0, i32* %ptr3
%ptr4 = getelementptr [22 x i8], [22 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
br label %true1
true1:
br label %truebool1
truebool1:
br label %truelabel1
br label %truelabel1
truelabel1:
br label %byte2
byte2:
%ptr5 = alloca i32
store i32 255, i32* %ptr5
br label %id1
id1:
%t1 = load i32, i32* %ptr3
%t2 = trunc i32 %t1 to i8
%t3 = zext i8 %t2 to i32
br label %byte3
byte3:
br label %add1
add1:
%t4 = add i32 %t3, 1
%t5 = trunc i32 %t4 to i8
%t6 = zext i8 %t5 to i32
store i32 %t6, i32* %ptr3
%ptr6 = getelementptr [12 x i8], [12 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr6)
br label %id2
id2:
%t7 = load i32, i32* %ptr3
%t8 = trunc i32 %t7 to i8
%t9 = zext i8 %t8 to i32
call void @printi(i32 %t9)
br label %id3
id3:
%t10 = load i32, i32* %ptr5
%t11 = trunc i32 %t10 to i8
%t12 = zext i8 %t11 to i32
br label %id4
id4:
%t13 = load i32, i32* %ptr3
%t14 = trunc i32 %t13 to i8
%t15 = zext i8 %t14 to i32
br label %div1
div1:
%t17 = icmp eq i32 0, %t15
br i1 %t17, label %divzerolabel1, label %end_divzerolabel1
divzerolabel1:
%ptr7 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr7)
call void @exit(i32 1)
br label %end_divzerolabel1
end_divzerolabel1:
%t16 = udiv i32 %t12, %t15
%t18 = trunc i32 %t16 to i8
%t19 = zext i8 %t18 to i32
store i32 %t19, i32* %ptr5
br label %true1
br label %endlabel1
endlabel1:
%ptr8 = getelementptr [19 x i8], [19 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr8)
ret void 
}
