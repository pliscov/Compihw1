@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [50 x i8] c"This is a recursive function called in trenary op\00"
@str2 = internal constant [10 x i8] c"Good luck\00"
@str3 = internal constant [13 x i8] c"round 1 - OK\00"
@str4 = internal constant [14 x i8] c"Sucks to suck\00"
@str5 = internal constant [47 x i8] c"Now will call recursive func in NESTED trinary\00"
@str6 = internal constant [13 x i8] c"round 2 - OK\00"
@str7 = internal constant [18 x i8] c"You are a failure\00"
@str8 = internal constant [54 x i8] c"Now will call recursive func in double NESTED trinary\00"
@str9 = internal constant [13 x i8] c"round 3 - OK\00"
@str10 = internal constant [19 x i8] c"UNLUCKY you failed\00"
@str11 = internal constant [8 x i8] c"ok bye!\00"
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

define i32 @fact(i32 ) {
br label %id1
id1:
%t1 = load i32, i32* 
br label %num1
num1:
br label %reloplabel1
reloplabel1:
%t2 = icmp sle i32 %t1, 1
br i1 %t2, label %truelabel1, label %endlabel1
br label %truelabel1
truelabel1:
br label %num2
num2:
ret i32 1
br label %endlabel1
endlabel1:
br label %id2
id2:
%t3 = load i32, i32* 
br label %num3
num3:
br label %sub1
sub1:
%t4 = sub i32 %t3, 1
%t5 = call i32 @fact(i32 %t4)
br label %call1
call1:
br label %id3
id3:
%t6 = load i32, i32* 
br label %mul1
mul1:
%t7 = mul i32 %t5, %t6
ret i32 %t7
ret i32 0
}
define void @main() {
%ptr1 = getelementptr [50 x i8], [50 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [10 x i8], [10 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %num4
num4:
%t8 = call i32 @fact(i32 2)
br label %call3
call2:
br label %truelabel2
br label %num5
num5:
%t9 = call i32 @fact(i32 5)
br label %call3
call3:
br label %num6
num6:
br label %reloplabel2
reloplabel2:
%t10 = icmp slt i32 %t9, 3
br i1 %t10, label %call2, label %call4
br label %num7
num7:
%t11 = call i32 @fact(i32 7)
br label %call4
call4:
br label %falselabel1
truelabel2:
br label %endlabel2
falselabel1:
br label %endlabel2
endlabel2:
%t12 = phi i32 [%t8, %truelabel2 ], [%t11, %falselabel1 ]
%ptr3 = alloca i32
store i32 %t12, i32* %ptr3
br label %id4
id4:
%t13 = load i32, i32* %ptr3
br label %num8
num8:
%t14 = call i32 @fact(i32 7)
br label %call5
call5:
br label %reloplabel3
reloplabel3:
%t15 = icmp eq i32 %t13, %t14
br i1 %t15, label %truelabel3, label %falselabel2
br label %truelabel3
truelabel3:
%ptr4 = getelementptr [13 x i8], [13 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
br label %endlabel3
br label %falselabel2
falselabel2:
%ptr5 = getelementptr [14 x i8], [14 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr5)
br label %endlabel3
endlabel3:
%ptr6 = getelementptr [47 x i8], [47 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr6)
br label %num9
num9:
%t16 = call i32 @fact(i32 0)
br label %call9
call6:
br label %truelabel4
br label %num10
num10:
%t17 = call i32 @fact(i32 60)
br label %call7
call7:
br label %num11
num11:
br label %reloplabel4
reloplabel4:
%t18 = icmp slt i32 %t17, 8
br i1 %t18, label %call6, label %call8
br label %num12
num12:
%t19 = call i32 @fact(i32 3)
br label %call8
call8:
br label %falselabel3
truelabel4:
br label %endlabel4
falselabel3:
br label %endlabel4
endlabel4:
%t20 = phi i32 [%t16, %truelabel4 ], [%t19, %falselabel3 ]
br label %truelabel5
br label %num13
num13:
%t21 = call i32 @fact(i32 5)
br label %call9
call9:
br label %num14
num14:
br label %reloplabel5
reloplabel5:
%t22 = icmp sgt i32 %t21, 3
br i1 %t22, label %call7, label %call10
br label %num15
num15:
%t23 = call i32 @fact(i32 20)
br label %call10
call10:
br label %falselabel4
truelabel5:
br label %endlabel5
falselabel4:
br label %endlabel5
endlabel5:
%t24 = phi i32 [%t20, %truelabel5 ], [%t23, %falselabel4 ]
%ptr7 = alloca i32
store i32 %t24, i32* %ptr7
br label %id5
id5:
%t25 = load i32, i32* %ptr7
br label %num16
num16:
%t26 = call i32 @fact(i32 0)
br label %call11
call11:
br label %reloplabel6
reloplabel6:
%t27 = icmp eq i32 %t25, %t26
br i1 %t27, label %truelabel6, label %falselabel5
br label %truelabel6
truelabel6:
%ptr8 = getelementptr [13 x i8], [13 x i8]* @str6, i32 0, i32 0
call void @print(i8* %ptr8)
br label %endlabel6
br label %falselabel5
falselabel5:
%ptr9 = getelementptr [18 x i8], [18 x i8]* @str7, i32 0, i32 0
call void @print(i8* %ptr9)
br label %endlabel6
endlabel6:
%ptr10 = getelementptr [54 x i8], [54 x i8]* @str8, i32 0, i32 0
call void @print(i8* %ptr10)
br label %num17
num17:
%t28 = call i32 @fact(i32 0)
br label %call15
call12:
br label %truelabel7
br label %num18
num18:
%t29 = call i32 @fact(i32 60)
br label %call13
call13:
br label %num19
num19:
br label %reloplabel7
reloplabel7:
%t30 = icmp slt i32 %t29, 8
br i1 %t30, label %call12, label %call14
br label %num20
num20:
%t31 = call i32 @fact(i32 3)
br label %call14
call14:
br label %falselabel6
truelabel7:
br label %endlabel7
falselabel6:
br label %endlabel7
endlabel7:
%t32 = phi i32 [%t28, %truelabel7 ], [%t31, %falselabel6 ]
br label %truelabel9
br label %num21
num21:
%t33 = call i32 @fact(i32 5)
br label %call15
call15:
br label %num22
num22:
br label %reloplabel8
reloplabel8:
%t34 = icmp slt i32 %t33, 3
br i1 %t34, label %call13, label %call17
br label %num23
num23:
%t35 = call i32 @fact(i32 20)
br label %call17
call16:
br label %truelabel8
br label %num24
num24:
%t36 = call i32 @fact(i32 2)
br label %call17
call17:
br label %num25
num25:
br label %reloplabel9
reloplabel9:
%t37 = icmp sgt i32 %t36, 0
br i1 %t37, label %call16, label %call18
br label %num26
num26:
%t38 = call i32 @fact(i32 0)
br label %call18
call18:
br label %falselabel7
truelabel8:
br label %endlabel8
falselabel7:
br label %endlabel8
endlabel8:
%t39 = phi i32 [%t35, %truelabel8 ], [%t38, %falselabel7 ]
br label %falselabel8
truelabel9:
br label %endlabel9
falselabel8:
br label %endlabel9
endlabel9:
%t40 = phi i32 [%t32, %truelabel9 ], [%t39, %falselabel8 ]
%ptr11 = alloca i32
store i32 %t40, i32* %ptr11
br label %id6
id6:
%t41 = load i32, i32* %ptr11
br label %num27
num27:
%t42 = call i32 @fact(i32 20)
br label %call19
call19:
br label %reloplabel10
reloplabel10:
%t43 = icmp eq i32 %t41, %t42
br i1 %t43, label %truelabel10, label %falselabel9
br label %truelabel10
truelabel10:
%ptr12 = getelementptr [13 x i8], [13 x i8]* @str9, i32 0, i32 0
call void @print(i8* %ptr12)
br label %endlabel10
br label %falselabel9
falselabel9:
%ptr13 = getelementptr [19 x i8], [19 x i8]* @str10, i32 0, i32 0
call void @print(i8* %ptr13)
br label %endlabel10
endlabel10:
%ptr14 = getelementptr [8 x i8], [8 x i8]* @str11, i32 0, i32 0
call void @print(i8* %ptr14)
ret void 
}
