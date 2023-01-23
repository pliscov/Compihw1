@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [39 x i8] c"Side effect you shouldn't be seeing...\00"
@str2 = internal constant [42 x i8] c"This is the print you should be seeing =D\00"
@str3 = internal constant [50 x i8] c"This is call to function inside a trenary op test\00"
@str4 = internal constant [32 x i8] c"May GOD have mercy on your soul\00"
@str5 = internal constant [52 x i8] c" >>> You should be expecting 'You survived' 3 times\00"
@str6 = internal constant [14 x i8] c"You survived!\00"
@str7 = internal constant [19 x i8] c"Disgrace upon you!\00"
@str8 = internal constant [14 x i8] c"You survived!\00"
@str9 = internal constant [26 x i8] c"Disgrace upon your family\00"
@str10 = internal constant [14 x i8] c"You survived!\00"
@str11 = internal constant [23 x i8] c"Disgrace upon your dog\00"
@str12 = internal constant [12 x i8] c"Bye bitches\00"
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

define i1 @divByZero(i32 ) {
%ptr1 = getelementptr [39 x i8], [39 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %id1
id1:
%t1 = load i32, i32* 
call void @printi(i32 %t1)
br label %id2
id2:
%t2 = load i32, i32* 
br label %num1
num1:
br label %div1
div1:
%t4 = icmp eq i32 0, 0
br i1 %t4, label %divzerolabel1, label %end_divzerolabel1
divzerolabel1:
%ptr2 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr2)
call void @exit(i32 1)
br label %end_divzerolabel1
end_divzerolabel1:
%t3 = sdiv i32 %t2, 0
br label %num2
num2:
br label %reloplabel1
reloplabel1:
%t5 = icmp sgt i32 %t3, 0
br i1 %t5, label %truelabel1, label %endlabel1
br label %truelabel1
truelabel1:
br label %true1
true1:
br label %truebool1
truebool1:
br label @
ret i1 true
br label %endlabel1
endlabel1:
ret i1 false
}
define i1 @divByOne(i32 ) {
%ptr3 = getelementptr [42 x i8], [42 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr3)
br label %id3
id3:
%t6 = load i32, i32* 
call void @printi(i32 %t6)
br label %id4
id4:
%t7 = load i32, i32* 
br label %num3
num3:
br label %div2
div2:
%t9 = icmp eq i32 0, 1
br i1 %t9, label %divzerolabel2, label %end_divzerolabel2
divzerolabel2:
%ptr4 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr4)
call void @exit(i32 1)
br label %end_divzerolabel2
end_divzerolabel2:
%t8 = sdiv i32 %t7, 1
br label %num4
num4:
br label %reloplabel2
reloplabel2:
%t10 = icmp sgt i32 %t8, 0
br i1 %t10, label %truelabel2, label %endlabel2
br label %truelabel2
truelabel2:
br label %true2
true2:
br label %truebool2
truebool2:
br label @
ret i1 true
br label %endlabel2
endlabel2:
ret i1 false
}
define void @main() {
%ptr5 = getelementptr [50 x i8], [50 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr5)
%ptr6 = getelementptr [32 x i8], [32 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr6)
%ptr7 = getelementptr [52 x i8], [52 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr7)
br label %num5
num5:
br label %num6
num6:
br label %mul1
mul1:
%t11 = mul i32 2, 5
%t12 = call i1 @divByZero(i32 %t11)
br label %sub1
call1:
br label %truelabel3
br label %num7
num7:
br label %num8
num8:
br label %sub1
sub1:
%t13 = sub i32 8, 2
br label %num9
num9:
br label %num10
num10:
br label %sub2
sub2:
%t14 = sub i32 2, 8
br label %reloplabel3
reloplabel3:
%t15 = icmp sle i32 %t13, %t14
br i1 %t15, label %call1, label %
br label %num11
num11:
%t16 = call i1 @divByOne(i32 527284)
br label %call2
call2:
br label %falselabel1
truelabel3:
br label %endlabel3
falselabel1:
br label %endlabel3
endlabel3:
br label %endlabel4
endlabel4:
br label %truelabel4
truelabel4:
br label %endlabel5
falselabel2:
br label %endlabel5
endlabel5:
%t17 = phi i32 [1, %truelabel4], [0, %falselabel2]
%ptr8 = alloca i32
store i32 %t17, i32* %ptr8
br label %id5
id5:
%t18 = load i32, i32* %ptr8
%t19 = icmp eq i32 1, %t18
br i1 %t19, label %truelabel5, label %falselabel3
br label %truelabel5
truelabel5:
%ptr9 = getelementptr [14 x i8], [14 x i8]* @str6, i32 0, i32 0
call void @print(i8* %ptr9)
br label %endlabel6
br label %falselabel3
falselabel3:
%ptr10 = getelementptr [19 x i8], [19 x i8]* @str7, i32 0, i32 0
call void @print(i8* %ptr10)
br label %endlabel6
endlabel6:
br label %num12
num12:
%t20 = call i1 @divByOne(i32 699953)
br label %sub3
call3:
br label %truelabel6
br label %num13
num13:
br label %num14
num14:
br label %sub3
sub3:
%t21 = sub i32 8, 2
br label %num15
num15:
br label %num16
num16:
br label %sub4
sub4:
%t22 = sub i32 2, 8
br label %reloplabel4
reloplabel4:
%t23 = icmp sge i32 %t21, %t22
br i1 %t23, label %call3, label %
br label %num17
num17:
br label %num18
num18:
br label %sub5
sub5:
%t24 = sub i32 1290767, 134312
%t25 = call i1 @divByZero(i32 %t24)
br label %call4
call4:
br label %falselabel4
truelabel6:
br label %endlabel7
falselabel4:
br label %endlabel7
endlabel7:
br label %endlabel8
endlabel8:
br label %true3
true3:
br label %end1
false1:
br label %end1
end1:
%t26 = phi i32 [1, %true3], [0, %false1]
%ptr11 = alloca i32
store i32 %t26, i32* %ptr11
br label %id6
id6:
%t27 = load i32, i32* %ptr11
%t28 = icmp eq i32 1, %t27
br i1 %t28, label %truelabel7, label %falselabel5
br label %truelabel7
truelabel7:
%ptr12 = getelementptr [14 x i8], [14 x i8]* @str8, i32 0, i32 0
call void @print(i8* %ptr12)
br label %endlabel9
br label %falselabel5
falselabel5:
%ptr13 = getelementptr [26 x i8], [26 x i8]* @str9, i32 0, i32 0
call void @print(i8* %ptr13)
br label %endlabel9
endlabel9:
br label %num19
num19:
%t29 = call i1 @divByOne(i32 84563128)
br label %call6
call5:
br label %truelabel8
br label %num20
num20:
br label %num21
num21:
br label %mul2
mul2:
%t30 = mul i32 17, 800
br label %num22
num22:
br label %sub6
sub6:
%t31 = sub i32 %t30, 7000
%t32 = call i1 @divByOne(i32 %t31)
br label %call6
call6:
br label %num23
num23:
%t33 = call i1 @divByZero(i32 13460)
br label %call7
call7:
br label %falselabel6
truelabel8:
br label %endlabel10
falselabel6:
br label %endlabel10
endlabel10:
br label %endlabel11
endlabel11:
br label %true4
true4:
br label %end2
false2:
br label %end2
end2:
%t34 = phi i32 [1, %true4], [0, %false2]
%ptr14 = alloca i32
store i32 %t34, i32* %ptr14
br label %id7
id7:
%t35 = load i32, i32* %ptr14
%t36 = icmp eq i32 1, %t35
br i1 %t36, label %truelabel9, label %falselabel7
br label %truelabel9
truelabel9:
%ptr15 = getelementptr [14 x i8], [14 x i8]* @str10, i32 0, i32 0
call void @print(i8* %ptr15)
br label %endlabel12
br label %falselabel7
falselabel7:
%ptr16 = getelementptr [23 x i8], [23 x i8]* @str11, i32 0, i32 0
call void @print(i8* %ptr16)
br label %endlabel12
endlabel12:
%ptr17 = getelementptr [12 x i8], [12 x i8]* @str12, i32 0, i32 0
call void @print(i8* %ptr17)
ret void 
}
