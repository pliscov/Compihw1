@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [22 x i8] c"Bool thingies for you\00"
@str2 = internal constant [22 x i8] c"Expecting 7 8 9 10 13\00"
@str3 = internal constant [4 x i8] c"Fin\00"
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
%ptr1 = getelementptr [22 x i8], [22 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [22 x i8], [22 x i8]* @str2, i32 0, i32 0
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
br label %exp5
exp5:
br label %reloplabel2
reloplabel2:
br label %exp6
exp6:
%t3 = icmp slt i32 1, 2
br i1 %t3, label %truelabel2, label %falselabel2
br label %truelabel2
truelabel2:
br label %endlabel2
falselabel2:
br label %endlabel2
endlabel2:
%t4 = phi i32 [1, %truelabel2], [0, %falselabel2]
%ptr4 = alloca i32
store i32 %t4, i32* %ptr4
br label %exp7
exp7:
br label %exp8
exp8:
br label %reloplabel3
reloplabel3:
br label %exp9
exp9:
%t5 = icmp sle i32 1, 2
br i1 %t5, label %truelabel3, label %falselabel3
br label %truelabel3
truelabel3:
br label %endlabel3
falselabel3:
br label %endlabel3
endlabel3:
%t6 = phi i32 [1, %truelabel3], [0, %falselabel3]
%ptr5 = alloca i32
store i32 %t6, i32* %ptr5
br label %exp10
exp10:
br label %exp11
exp11:
br label %reloplabel4
reloplabel4:
br label %exp12
exp12:
%t7 = icmp sge i32 1, 2
br i1 %t7, label %truelabel4, label %falselabel4
br label %truelabel4
truelabel4:
br label %endlabel4
falselabel4:
br label %endlabel4
endlabel4:
%t8 = phi i32 [1, %truelabel4], [0, %falselabel4]
%ptr6 = alloca i32
store i32 %t8, i32* %ptr6
br label %exp13
exp13:
br label %exp14
exp14:
br label %reloplabel5
reloplabel5:
br label %exp15
exp15:
%t9 = icmp eq i32 1, 2
br i1 %t9, label %truelabel5, label %falselabel5
br label %truelabel5
truelabel5:
br label %endlabel5
falselabel5:
br label %endlabel5
endlabel5:
%t10 = phi i32 [1, %truelabel5], [0, %falselabel5]
%ptr7 = alloca i32
store i32 %t10, i32* %ptr7
br label %exp16
exp16:
br label %exp17
exp17:
br label %reloplabel6
reloplabel6:
br label %exp18
exp18:
%t11 = icmp ne i32 1, 2
br i1 %t11, label %truelabel6, label %falselabel6
br label %truelabel6
truelabel6:
br label %endlabel6
falselabel6:
br label %endlabel6
endlabel6:
%t12 = phi i32 [1, %truelabel6], [0, %falselabel6]
%ptr8 = alloca i32
store i32 %t12, i32* %ptr8
br label %exp19
exp19:
%t13 = load i32, i32* %ptr8
br label %idlabel1
idlabel1:
%t14 = icmp eq i32 1, %t13
br i1 %t14, label %idlabel2, label %falselabel9
br label %exp20
exp20:
%t15 = load i32, i32* %ptr4
br label %idlabel2
idlabel2:
%t16 = icmp eq i32 1, %t15
br i1 %t16, label %truelabel9, label %falselabel9
br label %exp21
exp21:
br label %truelabel9
truelabel9:
br label %endlabel9
falselabel9:
br label %endlabel9
endlabel9:
%t17 = phi i32 [1, %truelabel9], [0, %falselabel9]
%ptr9 = alloca i32
store i32 %t17, i32* %ptr9
br label %exp22
exp22:
%t18 = load i32, i32* %ptr9
br label %idlabel3
idlabel3:
%t19 = icmp eq i32 1, %t18
br i1 %t19, label %truelabel11, label %endlabel11
br label %truelabel11
truelabel11:
br label %exp23
exp23:
call void @printi(i32 7)
br label %endlabel11
endlabel11:
br label %exp24
exp24:
%t20 = load i32, i32* %ptr3
br label %idlabel4
idlabel4:
%t21 = icmp eq i32 1, %t20
br i1 %t21, label %truelabel14, label %idlabel5
br label %exp25
exp25:
%t22 = load i32, i32* %ptr4
br label %idlabel5
idlabel5:
%t23 = icmp eq i32 1, %t22
br i1 %t23, label %truelabel14, label %falselabel13
br label %exp26
exp26:
br label %truelabel14
truelabel14:
br label %endlabel14
falselabel13:
br label %endlabel14
endlabel14:
%t24 = phi i32 [1, %truelabel14], [0, %falselabel13]
%ptr10 = alloca i32
store i32 %t24, i32* %ptr10
br label %exp27
exp27:
%t25 = load i32, i32* %ptr10
br label %idlabel6
idlabel6:
%t26 = icmp eq i32 1, %t25
br i1 %t26, label %truelabel16, label %endlabel16
br label %truelabel16
truelabel16:
br label %exp28
exp28:
call void @printi(i32 8)
br label %endlabel16
endlabel16:
br label %exp29
exp29:
%t27 = load i32, i32* %ptr3
br label %idlabel7
idlabel7:
%t28 = icmp eq i32 1, %t27
br i1 %t28, label %falselabel17, label %idlabel8
br label %exp30
exp30:
br label %exp31
exp31:
%t29 = load i32, i32* %ptr8
br label %idlabel8
idlabel8:
%t30 = icmp eq i32 1, %t29
br i1 %t30, label %truelabel19, label %falselabel17
br label %exp32
exp32:
br label %truelabel19
truelabel19:
br label %endlabel19
falselabel17:
br label %endlabel19
endlabel19:
%t31 = phi i32 [1, %truelabel19], [0, %falselabel17]
%ptr11 = alloca i32
store i32 %t31, i32* %ptr11
br label %exp33
exp33:
%t32 = load i32, i32* %ptr11
br label %idlabel9
idlabel9:
%t33 = icmp eq i32 1, %t32
br i1 %t33, label %truelabel21, label %endlabel21
br label %truelabel21
truelabel21:
br label %exp34
exp34:
call void @printi(i32 9)
br label %endlabel21
endlabel21:
br label %exp35
exp35:
%t34 = load i32, i32* %ptr3
br label %idlabel10
idlabel10:
%t35 = icmp eq i32 1, %t34
br i1 %t35, label %truelabel24, label %idlabel11
br label %exp36
exp36:
%t36 = load i32, i32* %ptr10
br label %idlabel11
idlabel11:
%t37 = icmp eq i32 1, %t36
br i1 %t37, label %truelabel24, label %falselabel21
br label %exp37
exp37:
br label %truelabel24
truelabel24:
br label %endlabel24
falselabel21:
br label %endlabel24
endlabel24:
%t38 = phi i32 [1, %truelabel24], [0, %falselabel21]
%ptr12 = alloca i32
store i32 %t38, i32* %ptr12
br label %exp38
exp38:
%t39 = load i32, i32* %ptr12
br label %idlabel12
idlabel12:
%t40 = icmp eq i32 1, %t39
br i1 %t40, label %truelabel26, label %endlabel26
br label %truelabel26
truelabel26:
br label %exp39
exp39:
call void @printi(i32 10)
br label %endlabel26
endlabel26:
br label %exp40
exp40:
%t41 = load i32, i32* %ptr9
br label %idlabel13
idlabel13:
%t42 = icmp eq i32 1, %t41
br i1 %t42, label %falselabel24, label %truelabel28
br label %exp41
exp41:
br label %truelabel28
truelabel28:
br label %endlabel28
falselabel24:
br label %endlabel28
endlabel28:
%t43 = phi i32 [1, %truelabel28], [0, %falselabel24]
%ptr13 = alloca i32
store i32 %t43, i32* %ptr13
br label %exp42
exp42:
%t44 = load i32, i32* %ptr13
br label %idlabel14
idlabel14:
%t45 = icmp eq i32 1, %t44
br i1 %t45, label %truelabel30, label %endlabel30
br label %truelabel30
truelabel30:
br label %exp43
exp43:
call void @printi(i32 11)
br label %endlabel30
endlabel30:
br label %exp44
exp44:
%t46 = load i32, i32* %ptr9
br label %idlabel15
idlabel15:
%t47 = icmp eq i32 1, %t46
br i1 %t47, label %false1, label %true1
br label %exp45
exp45:
br label %exp46
exp46:
br label %exp47
exp47:
br label %true1
true1:
br label %end1
false1:
br label %end1
end1:
%t48 = phi i32 [1, %true1], [0, %false1]
%ptr14 = alloca i32
store i32 %t48, i32* %ptr14
br label %exp48
exp48:
%t49 = load i32, i32* %ptr14
br label %idlabel16
idlabel16:
%t50 = icmp eq i32 1, %t49
br i1 %t50, label %truelabel33, label %endlabel33
br label %truelabel33
truelabel33:
br label %exp49
exp49:
call void @printi(i32 12)
br label %endlabel33
endlabel33:
br label %exp50
exp50:
%t51 = load i32, i32* %ptr9
br label %idlabel17
idlabel17:
%t52 = icmp eq i32 1, %t51
br i1 %t52, label %truebool1, label %true2
br label %exp51
exp51:
br label %exp52
exp52:
br label %exp53
exp53:
br label %truebool1
truebool1:
br label %exp54
exp54:
br label %true2
br label %exp55
exp55:
br label %true2
true2:
br label %end2
false2:
br label %end2
end2:
%t53 = phi i32 [1, %true2], [0, %false2]
%ptr15 = alloca i32
store i32 %t53, i32* %ptr15
br label %exp56
exp56:
%t54 = load i32, i32* %ptr15
br label %idlabel18
idlabel18:
%t55 = icmp eq i32 1, %t54
br i1 %t55, label %truelabel36, label %endlabel36
br label %truelabel36
truelabel36:
br label %exp57
exp57:
call void @printi(i32 13)
br label %endlabel36
endlabel36:
%ptr16 = getelementptr [4 x i8], [4 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr16)
ret void
}
