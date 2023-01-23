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
br label %num3
num3:
br label %num4
num4:
br label %reloplabel2
reloplabel2:
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
br label %num5
num5:
br label %num6
num6:
br label %reloplabel3
reloplabel3:
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
br label %num7
num7:
br label %num8
num8:
br label %reloplabel4
reloplabel4:
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
br label %num9
num9:
br label %num10
num10:
br label %reloplabel5
reloplabel5:
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
br label %num11
num11:
br label %num12
num12:
br label %reloplabel6
reloplabel6:
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
br label %id1
id1:
%t13 = load i32, i32* %ptr8
%t14 = icmp eq i32 1, %t13
br i1 %t14, label %id2, label %falselabel7
br label %id2
id2:
%t15 = load i32, i32* %ptr4
%t16 = icmp eq i32 1, %t15
br i1 %t16, label %truelabel7, label %falselabel7
br label %truelabel7
truelabel7:
br label %endlabel7
falselabel7:
br label %endlabel7
endlabel7:
%t17 = phi i32 [1, %truelabel7], [0, %falselabel7]
%ptr9 = alloca i32
store i32 %t17, i32* %ptr9
br label %id3
id3:
%t18 = load i32, i32* %ptr9
%t19 = icmp eq i32 1, %t18
br i1 %t19, label %truelabel8, label %endlabel8
br label %truelabel8
truelabel8:
br label %num13
num13:
call void @printi(i32 7)
br label %endlabel8
endlabel8:
br label %id4
id4:
%t20 = load i32, i32* %ptr3
%t21 = icmp eq i32 1, %t20
br i1 %t21, label %truelabel9, label %id5
br label %id5
id5:
%t22 = load i32, i32* %ptr4
%t23 = icmp eq i32 1, %t22
br i1 %t23, label %truelabel9, label %falselabel8
br label %truelabel9
truelabel9:
br label %endlabel9
falselabel8:
br label %endlabel9
endlabel9:
%t24 = phi i32 [1, %truelabel9], [0, %falselabel8]
%ptr10 = alloca i32
store i32 %t24, i32* %ptr10
br label %id6
id6:
%t25 = load i32, i32* %ptr10
%t26 = icmp eq i32 1, %t25
br i1 %t26, label %truelabel10, label %endlabel10
br label %truelabel10
truelabel10:
br label %num14
num14:
call void @printi(i32 8)
br label %endlabel10
endlabel10:
br label %id7
id7:
%t27 = load i32, i32* %ptr3
%t28 = icmp eq i32 1, %t27
br i1 %t28, label %falselabel9, label %id8
br label %not1
not1:
br label %id8
id8:
%t29 = load i32, i32* %ptr8
%t30 = icmp eq i32 1, %t29
br i1 %t30, label %truelabel11, label %falselabel9
br label %truelabel11
truelabel11:
br label %endlabel11
falselabel9:
br label %endlabel11
endlabel11:
%t31 = phi i32 [1, %truelabel11], [0, %falselabel9]
%ptr11 = alloca i32
store i32 %t31, i32* %ptr11
br label %id9
id9:
%t32 = load i32, i32* %ptr11
%t33 = icmp eq i32 1, %t32
br i1 %t33, label %truelabel12, label %endlabel12
br label %truelabel12
truelabel12:
br label %num15
num15:
call void @printi(i32 9)
br label %endlabel12
endlabel12:
br label %id10
id10:
%t34 = load i32, i32* %ptr3
%t35 = icmp eq i32 1, %t34
br i1 %t35, label %truelabel13, label %id11
br label %id11
id11:
%t36 = load i32, i32* %ptr10
%t37 = icmp eq i32 1, %t36
br i1 %t37, label %truelabel13, label %falselabel10
br label %truelabel13
truelabel13:
br label %endlabel13
falselabel10:
br label %endlabel13
endlabel13:
%t38 = phi i32 [1, %truelabel13], [0, %falselabel10]
%ptr12 = alloca i32
store i32 %t38, i32* %ptr12
br label %id12
id12:
%t39 = load i32, i32* %ptr12
%t40 = icmp eq i32 1, %t39
br i1 %t40, label %truelabel14, label %endlabel14
br label %truelabel14
truelabel14:
br label %num16
num16:
call void @printi(i32 10)
br label %endlabel14
endlabel14:
br label %id13
id13:
%t41 = load i32, i32* %ptr9
%t42 = icmp eq i32 1, %t41
br i1 %t42, label %falselabel11, label %truelabel15
br label %not2
not2:
br label %truelabel15
truelabel15:
br label %endlabel15
falselabel11:
br label %endlabel15
endlabel15:
%t43 = phi i32 [1, %truelabel15], [0, %falselabel11]
%ptr13 = alloca i32
store i32 %t43, i32* %ptr13
br label %id14
id14:
%t44 = load i32, i32* %ptr13
%t45 = icmp eq i32 1, %t44
br i1 %t45, label %truelabel16, label %endlabel16
br label %truelabel16
truelabel16:
br label %num17
num17:
call void @printi(i32 11)
br label %endlabel16
endlabel16:
br label %id15
id15:
%t46 = load i32, i32* %ptr9
%t47 = icmp eq i32 1, %t46
br i1 %t47, label %false1, label %true1
br label %not3
not3:
br label %not4
not4:
br label %not5
not5:
br label %true1
true1:
br label %end1
false1:
br label %end1
end1:
%t48 = phi i32 [1, %true1], [0, %false1]
%ptr14 = alloca i32
store i32 %t48, i32* %ptr14
br label %id16
id16:
%t49 = load i32, i32* %ptr14
%t50 = icmp eq i32 1, %t49
br i1 %t50, label %truelabel17, label %endlabel17
br label %truelabel17
truelabel17:
br label %num18
num18:
call void @printi(i32 12)
br label %endlabel17
endlabel17:
br label %id17
id17:
%t51 = load i32, i32* %ptr9
%t52 = icmp eq i32 1, %t51
br i1 %t52, label %true2, label %true3
br label %not6
not6:
br label %not7
not7:
br label %not8
not8:
br label %true2
true2:
br label %truebool1
truebool1:
br label %true3
br label %true3
true3:
br label %end2
false2:
br label %end2
end2:
%t53 = phi i32 [1, %true3], [0, %false2]
%ptr15 = alloca i32
store i32 %t53, i32* %ptr15
br label %id18
id18:
%t54 = load i32, i32* %ptr15
%t55 = icmp eq i32 1, %t54
br i1 %t55, label %truelabel18, label %endlabel18
br label %truelabel18
truelabel18:
br label %num19
num19:
call void @printi(i32 13)
br label %endlabel18
endlabel18:
%ptr16 = getelementptr [4 x i8], [4 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr16)
ret void 
}
