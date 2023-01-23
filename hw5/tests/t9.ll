@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [15 x i8] c"Bool thingies.\00"
@str2 = internal constant [16 x i8] c"Expecting 2 3 6\00"
@str3 = internal constant [15 x i8] c"Peace out yall\00"
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
%ptr1 = getelementptr [15 x i8], [15 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [16 x i8], [16 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %num1
num1:
br label %num2
num2:
br label %reloplabel1
reloplabel1:
%t1 = icmp sgt i32 1, 2
br i1 %t1, label %truelabel1, label %falselabel1
br label %truelabel1
truelabel1:
br label %endlabel1
falselabel1:
br label %endlabel1
endlabel1:
%t2 = phi i32 [1, %truelabel1], [0, %falselabel1]
%ptr3 = alloca i32
store i32 %t2, i32* %ptr3
br label %id1
id1:
%t3 = load i32, i32* %ptr3
%t4 = icmp eq i32 1, %t3
br i1 %t4, label %truelabel2, label %endlabel2
br label %truelabel2
truelabel2:
br label %num3
num3:
call void @printi(i32 1)
br label %endlabel2
endlabel2:
br label %num4
num4:
br label %num5
num5:
br label %reloplabel2
reloplabel2:
%t5 = icmp slt i32 1, 2
br i1 %t5, label %truelabel3, label %falselabel2
br label %truelabel3
truelabel3:
br label %endlabel3
falselabel2:
br label %endlabel3
endlabel3:
%t6 = phi i32 [1, %truelabel3], [0, %falselabel2]
%ptr4 = alloca i32
store i32 %t6, i32* %ptr4
br label %id2
id2:
%t7 = load i32, i32* %ptr4
%t8 = icmp eq i32 1, %t7
br i1 %t8, label %truelabel4, label %endlabel4
br label %truelabel4
truelabel4:
br label %num6
num6:
call void @printi(i32 2)
br label %endlabel4
endlabel4:
br label %num7
num7:
br label %num8
num8:
br label %reloplabel3
reloplabel3:
%t9 = icmp sle i32 1, 2
br i1 %t9, label %truelabel5, label %falselabel3
br label %truelabel5
truelabel5:
br label %endlabel5
falselabel3:
br label %endlabel5
endlabel5:
%t10 = phi i32 [1, %truelabel5], [0, %falselabel3]
%ptr5 = alloca i32
store i32 %t10, i32* %ptr5
br label %id3
id3:
%t11 = load i32, i32* %ptr5
%t12 = icmp eq i32 1, %t11
br i1 %t12, label %truelabel6, label %endlabel6
br label %truelabel6
truelabel6:
br label %num9
num9:
call void @printi(i32 3)
br label %endlabel6
endlabel6:
br label %num10
num10:
br label %num11
num11:
br label %reloplabel4
reloplabel4:
%t13 = icmp sge i32 1, 2
br i1 %t13, label %truelabel7, label %falselabel4
br label %truelabel7
truelabel7:
br label %endlabel7
falselabel4:
br label %endlabel7
endlabel7:
%t14 = phi i32 [1, %truelabel7], [0, %falselabel4]
%ptr6 = alloca i32
store i32 %t14, i32* %ptr6
br label %id4
id4:
%t15 = load i32, i32* %ptr6
%t16 = icmp eq i32 1, %t15
br i1 %t16, label %truelabel8, label %endlabel8
br label %truelabel8
truelabel8:
br label %num12
num12:
call void @printi(i32 4)
br label %endlabel8
endlabel8:
br label %num13
num13:
br label %num14
num14:
br label %reloplabel5
reloplabel5:
%t17 = icmp eq i32 1, 2
br i1 %t17, label %truelabel9, label %falselabel5
br label %truelabel9
truelabel9:
br label %endlabel9
falselabel5:
br label %endlabel9
endlabel9:
%t18 = phi i32 [1, %truelabel9], [0, %falselabel5]
%ptr7 = alloca i32
store i32 %t18, i32* %ptr7
br label %id5
id5:
%t19 = load i32, i32* %ptr7
%t20 = icmp eq i32 1, %t19
br i1 %t20, label %truelabel10, label %endlabel10
br label %truelabel10
truelabel10:
br label %num15
num15:
call void @printi(i32 5)
br label %endlabel10
endlabel10:
br label %num16
num16:
br label %num17
num17:
br label %reloplabel6
reloplabel6:
%t21 = icmp ne i32 1, 2
br i1 %t21, label %truelabel11, label %falselabel6
br label %truelabel11
truelabel11:
br label %endlabel11
falselabel6:
br label %endlabel11
endlabel11:
%t22 = phi i32 [1, %truelabel11], [0, %falselabel6]
%ptr8 = alloca i32
store i32 %t22, i32* %ptr8
br label %id6
id6:
%t23 = load i32, i32* %ptr8
%t24 = icmp eq i32 1, %t23
br i1 %t24, label %truelabel12, label %endlabel12
br label %truelabel12
truelabel12:
br label %num18
num18:
call void @printi(i32 6)
br label %endlabel12
endlabel12:
%ptr9 = getelementptr [15 x i8], [15 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr9)
ret void 
}
