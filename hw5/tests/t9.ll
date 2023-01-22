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
br label %exp1
exp1:
br label %exp2
exp2:
br label %reloplabel1
reloplabel1:
br label %exp3
exp3:
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
br label %exp4
exp4:
%t3 = load i32, i32* %ptr3
br label %idlabel1
idlabel1:
%t4 = icmp eq i32 1, %t3
br i1 %t4, label %truelabel3, label %endlabel3
br label %truelabel3
truelabel3:
br label %exp5
exp5:
call void @printi(i32 1)
br label %endlabel3
endlabel3:
br label %exp6
exp6:
br label %exp7
exp7:
br label %reloplabel2
reloplabel2:
br label %exp8
exp8:
%t5 = icmp slt i32 1, 2
br i1 %t5, label %truelabel4, label %falselabel3
br label %truelabel4
truelabel4:
br label %endlabel4
falselabel3:
br label %endlabel4
endlabel4:
%t6 = phi i32 [1, %truelabel4], [0, %falselabel3]
%ptr4 = alloca i32
store i32 %t6, i32* %ptr4
br label %exp9
exp9:
%t7 = load i32, i32* %ptr4
br label %idlabel2
idlabel2:
%t8 = icmp eq i32 1, %t7
br i1 %t8, label %truelabel6, label %endlabel6
br label %truelabel6
truelabel6:
br label %exp10
exp10:
call void @printi(i32 2)
br label %endlabel6
endlabel6:
br label %exp11
exp11:
br label %exp12
exp12:
br label %reloplabel3
reloplabel3:
br label %exp13
exp13:
%t9 = icmp sle i32 1, 2
br i1 %t9, label %truelabel7, label %falselabel5
br label %truelabel7
truelabel7:
br label %endlabel7
falselabel5:
br label %endlabel7
endlabel7:
%t10 = phi i32 [1, %truelabel7], [0, %falselabel5]
%ptr5 = alloca i32
store i32 %t10, i32* %ptr5
br label %exp14
exp14:
%t11 = load i32, i32* %ptr5
br label %idlabel3
idlabel3:
%t12 = icmp eq i32 1, %t11
br i1 %t12, label %truelabel9, label %endlabel9
br label %truelabel9
truelabel9:
br label %exp15
exp15:
call void @printi(i32 3)
br label %endlabel9
endlabel9:
br label %exp16
exp16:
br label %exp17
exp17:
br label %reloplabel4
reloplabel4:
br label %exp18
exp18:
%t13 = icmp sge i32 1, 2
br i1 %t13, label %truelabel10, label %falselabel7
br label %truelabel10
truelabel10:
br label %endlabel10
falselabel7:
br label %endlabel10
endlabel10:
%t14 = phi i32 [1, %truelabel10], [0, %falselabel7]
%ptr6 = alloca i32
store i32 %t14, i32* %ptr6
br label %exp19
exp19:
%t15 = load i32, i32* %ptr6
br label %idlabel4
idlabel4:
%t16 = icmp eq i32 1, %t15
br i1 %t16, label %truelabel12, label %endlabel12
br label %truelabel12
truelabel12:
br label %exp20
exp20:
call void @printi(i32 4)
br label %endlabel12
endlabel12:
br label %exp21
exp21:
br label %exp22
exp22:
br label %reloplabel5
reloplabel5:
br label %exp23
exp23:
%t17 = icmp eq i32 1, 2
br i1 %t17, label %truelabel13, label %falselabel9
br label %truelabel13
truelabel13:
br label %endlabel13
falselabel9:
br label %endlabel13
endlabel13:
%t18 = phi i32 [1, %truelabel13], [0, %falselabel9]
%ptr7 = alloca i32
store i32 %t18, i32* %ptr7
br label %exp24
exp24:
%t19 = load i32, i32* %ptr7
br label %idlabel5
idlabel5:
%t20 = icmp eq i32 1, %t19
br i1 %t20, label %truelabel15, label %endlabel15
br label %truelabel15
truelabel15:
br label %exp25
exp25:
call void @printi(i32 5)
br label %endlabel15
endlabel15:
br label %exp26
exp26:
br label %exp27
exp27:
br label %reloplabel6
reloplabel6:
br label %exp28
exp28:
%t21 = icmp ne i32 1, 2
br i1 %t21, label %truelabel16, label %falselabel11
br label %truelabel16
truelabel16:
br label %endlabel16
falselabel11:
br label %endlabel16
endlabel16:
%t22 = phi i32 [1, %truelabel16], [0, %falselabel11]
%ptr8 = alloca i32
store i32 %t22, i32* %ptr8
br label %exp29
exp29:
%t23 = load i32, i32* %ptr8
br label %idlabel6
idlabel6:
%t24 = icmp eq i32 1, %t23
br i1 %t24, label %truelabel18, label %endlabel18
br label %truelabel18
truelabel18:
br label %exp30
exp30:
call void @printi(i32 6)
br label %endlabel18
endlabel18:
%ptr9 = getelementptr [15 x i8], [15 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr9)
ret void
}
