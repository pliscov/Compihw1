@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [31 x i8] c"This is a long one - buckle up\00"
@str2 = internal constant [34 x i8] c"expecting true, true, 5b >=5, fin\00"
@str3 = internal constant [10 x i8] c"x is true\00"
@str4 = internal constant [10 x i8] c"y is true\00"
@str5 = internal constant [8 x i8] c"5b >= 5\00"
@str6 = internal constant [4 x i8] c"fin\00"
@str7 = internal constant [7 x i8] c"5b < 5\00"
@str8 = internal constant [8 x i8] c"GO AWAY\00"
@str9 = internal constant [25 x i8] c"YOU ARE NOTE WANTED HERE\00"
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
%ptr2 = getelementptr [34 x i8], [34 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %true1
true1:
br label %truebool1
truebool1:
br label %truelabel1
br label %truelabel1
truelabel1:
br label %endlabel1
falselabel1:
br label %endlabel1
endlabel1:
%t1 = phi i32 [1, %truelabel1], [0, %falselabel1]
%ptr3 = alloca i32
store i32 %t1, i32* %ptr3
br label %num1
num1:
br label %num2
num2:
br label %reloplabel1
reloplabel1:
%t2 = icmp slt i32 7, 9
br i1 %t2, label %truelabel2, label %falselabel2
br label %truelabel2
truelabel2:
br label %endlabel2
falselabel2:
br label %endlabel2
endlabel2:
%t3 = phi i32 [1, %truelabel2], [0, %falselabel2]
%ptr4 = alloca i32
store i32 %t3, i32* %ptr4
br label %id1
id1:
%t4 = load i32, i32* %ptr3
%t5 = icmp eq i32 1, %t4
br i1 %t5, label %truelabel3, label %endlabel3
br label %truelabel3
truelabel3:
%ptr5 = getelementptr [10 x i8], [10 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr5)
br label %endlabel3
endlabel3:
br label %id2
id2:
%t6 = load i32, i32* %ptr4
%t7 = icmp eq i32 1, %t6
br i1 %t7, label %truelabel4, label %endlabel4
br label %truelabel4
truelabel4:
%ptr6 = getelementptr [10 x i8], [10 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr6)
br label %endlabel4
endlabel4:
br label %id3
id3:
%t8 = load i32, i32* %ptr3
%t9 = icmp eq i32 1, %t8
br i1 %t9, label %truelabel5, label %falselabel5
br label %truelabel5
truelabel5:
br label %num3
num3:
%ptr7 = alloca i32
store i32 5, i32* %ptr7
br label %byte1
byte1:
%ptr8 = alloca i32
store i32 5, i32* %ptr8
br label %id4
id4:
%t10 = load i32, i32* %ptr8
%t11 = trunc i32 %t10 to i8
%t12 = zext i8 %t11 to i32
br label %id5
id5:
%t13 = load i32, i32* %ptr7
br label %reloplabel2
reloplabel2:
%t14 = icmp sge i32 %t12, %t13
br i1 %t14, label %truelabel6, label %falselabel3
br label %truelabel6
truelabel6:
br label %endlabel5
falselabel3:
br label %endlabel5
endlabel5:
%t15 = phi i32 [1, %truelabel6], [0, %falselabel3]
%ptr9 = alloca i32
store i32 %t15, i32* %ptr9
br label %id6
id6:
%t16 = load i32, i32* %ptr9
%t17 = icmp eq i32 1, %t16
br i1 %t17, label %truelabel7, label %falselabel4
br label %truelabel7
truelabel7:
%ptr10 = getelementptr [8 x i8], [8 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr10)
%ptr11 = getelementptr [4 x i8], [4 x i8]* @str6, i32 0, i32 0
call void @print(i8* %ptr11)
ret void
br label %endlabel6
br label %falselabel4
falselabel4:
%ptr12 = getelementptr [7 x i8], [7 x i8]* @str7, i32 0, i32 0
call void @print(i8* %ptr12)
ret void
br label %endlabel6
endlabel6:
br label %endlabel11
br label %falselabel5
falselabel5:
%ptr13 = getelementptr [8 x i8], [8 x i8]* @str8, i32 0, i32 0
call void @print(i8* %ptr13)
br label %num4
num4:
br label %num5
num5:
br label %reloplabel3
reloplabel3:
%t18 = icmp eq i32 8, 9
br i1 %t18, label %truelabel8, label %falselabel6
br label %truelabel8
truelabel8:
br label %endlabel7
falselabel6:
br label %endlabel7
endlabel7:
%t19 = phi i32 [1, %truelabel8], [0, %falselabel6]
%ptr14 = alloca i32
store i32 %t19, i32* %ptr14
br label %num6
num6:
br label %num7
num7:
br label %reloplabel4
reloplabel4:
%t20 = icmp ne i32 6, 2
br i1 %t20, label %truelabel9, label %falselabel7
br label %truelabel9
truelabel9:
br label %endlabel8
falselabel7:
br label %endlabel8
endlabel8:
%t21 = phi i32 [1, %truelabel9], [0, %falselabel7]
%ptr15 = alloca i32
store i32 %t21, i32* %ptr15
br label %id7
id7:
%t22 = load i32, i32* %ptr14
%t23 = icmp eq i32 1, %t22
br i1 %t23, label %truelabel10, label %id8
br label %id8
id8:
%t24 = load i32, i32* %ptr15
%t25 = icmp eq i32 1, %t24
br i1 %t25, label %id9, label %falselabel8
br label %id9
id9:
%t26 = load i32, i32* %ptr14
%t27 = icmp eq i32 1, %t26
br i1 %t27, label %truelabel10, label %falselabel8
br label %truelabel10
truelabel10:
ret void
br label %endlabel10
br label %falselabel8
falselabel8:
br label %id10
id10:
%t28 = load i32, i32* %ptr15
%t29 = icmp eq i32 1, %t28
br i1 %t29, label %id11, label %falselabel9
br label %id11
id11:
%t30 = load i32, i32* %ptr14
%t31 = icmp eq i32 1, %t30
br i1 %t31, label %truelabel11, label %falselabel9
br label %truelabel11
truelabel11:
ret void
br label %endlabel9
br label %falselabel9
falselabel9:
ret void
br label %endlabel9
endlabel9:
br label %endlabel10
endlabel10:
br label %num8
num8:
%ptr16 = alloca i32
store i32 5, i32* %ptr16
br label %endlabel11
endlabel11:
%ptr17 = getelementptr [25 x i8], [25 x i8]* @str9, i32 0, i32 0
call void @print(i8* %ptr17)
ret void
ret void 
}
