@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [9 x i8] c"EPIC INT\00"
@str2 = internal constant [10 x i8] c"EPIC BOOL\00"
@str3 = internal constant [33 x i8] c"You should expect the following:\00"
@str4 = internal constant [74 x i8] c"EPIC INT  |  EPIC BOOL  |  Just as expected  | EPIC INT 19 |  EPIC BOOL 1\00"
@str5 = internal constant [17 x i8] c"Just as expected\00"
@str6 = internal constant [17 x i8] c"Unexpected error\00"
@str7 = internal constant [10 x i8] c"EPIC BYTE\00"
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

define i32 @epicInt(i32 , i32 , i32 ) {
%ptr1 = getelementptr [9 x i8], [9 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %id1
id1:
%t1 = load i32, i32* 
br label %id2
id2:
%t2 = load i32, i32* 
br label %id3
id3:
%t3 = load i32, i32* 
br label %mul1
mul1:
%t4 = mul i32 %t2, %t3
br label %add1
add1:
%t5 = add i32 %t1, %t4
br label %id4
id4:
%t6 = load i32, i32* 
br label %add2
add2:
%t7 = add i32 %t5, %t6
ret i32 %t7
br label %id5
id5:
%t8 = load i32, i32* 
ret i32 %t8
ret i32 0
}
define i32 @epicBool(i1 , i1 , i1 ) {
%ptr2 = getelementptr [10 x i8], [10 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %id6
id6:
%t9 = load i32, i32* 
%t10 = icmp eq i32 1, %t9
br i1 %t10, label %truelabel1, label %endlabel1
br label %truelabel1
truelabel1:
br label %num1
num1:
ret i32 1
br label %endlabel1
endlabel1:
br label %id7
id7:
%t11 = load i32, i32* 
%t12 = icmp eq i32 1, %t11
br i1 %t12, label %truelabel2, label %falselabel1
br label %truelabel2
truelabel2:
br label %num2
num2:
ret i32 2
br label %endlabel3
br label %falselabel1
falselabel1:
br label %id8
id8:
%t13 = load i32, i32* 
%t14 = icmp eq i32 1, %t13
br i1 %t14, label %truelabel3, label %endlabel2
br label %truelabel3
truelabel3:
br label %num3
num3:
ret i32 3
br label %endlabel2
endlabel2:
br label %endlabel3
endlabel3:
br label %id9
id9:
%t15 = load i32, i32* 
%t16 = icmp eq i32 1, %t15
br i1 %t16, label %truelabel4, label %id10
br label %id10
id10:
%t17 = load i32, i32* 
%t18 = icmp eq i32 1, %t17
br i1 %t18, label %truelabel4, label %endlabel4
br label %truelabel4
truelabel4:
br label %num4
num4:
br label %num5
num5:
br label %sub1
sub1:
%t19 = sub i32 0, 1
ret i32 %t19
br label %endlabel4
endlabel4:
ret i32 0
}
define void @main() {
%ptr3 = getelementptr [33 x i8], [33 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr3)
%ptr4 = getelementptr [74 x i8], [74 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr4)
br label %num6
num6:
br label %num7
num7:
br label %num8
num8:
%t20 = call i32 @epicInt(i32 6, i32 1, i32 7)
br label %call1
call1:
br label %true1
true1:
br label %truebool1
truebool1:
br label @
br label %true2
true2:
br label %truebool2
truebool2:
br label @
br label %num9
num9:
br label %num10
num10:
br label %reloplabel1
reloplabel1:
%t21 = icmp sgt i32 1, 2
br i1 %t21, label @, label @
%t22 = call i32 @epicBool(i1 true, i1 true, i1 %t21)
br label %call2
call2:
br label %reloplabel2
reloplabel2:
%t23 = icmp sgt i32 %t20, %t22
br i1 %t23, label %truelabel5, label %falselabel2
br label %truelabel5
truelabel5:
%ptr5 = getelementptr [17 x i8], [17 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr5)
br label %num11
num11:
br label %num12
num12:
br label %num13
num13:
%t24 = call i32 @epicInt(i32 6, i32 1, i32 7)
br label %call3
call3:
call void @printi(i32 %t24)
br label %true3
true3:
br label %truebool3
truebool3:
br label @
br label %true4
true4:
br label %truebool4
truebool4:
br label @
br label %num14
num14:
br label %num15
num15:
br label %reloplabel3
reloplabel3:
%t25 = icmp sgt i32 1, 2
br i1 %t25, label @, label @
%t26 = call i32 @epicBool(i1 true, i1 true, i1 %t25)
br label %call4
call4:
call void @printi(i32 %t26)
br label %endlabel5
br label %falselabel2
falselabel2:
%ptr6 = getelementptr [17 x i8], [17 x i8]* @str6, i32 0, i32 0
call void @print(i8* %ptr6)
br label %num16
num16:
br label %num17
num17:
br label %num18
num18:
%t27 = call i32 @epicInt(i32 6, i32 1, i32 7)
br label %call5
call5:
call void @printi(i32 %t27)
br label %true5
true5:
br label %truebool5
truebool5:
br label @
br label %true6
true6:
br label %truebool6
truebool6:
br label @
br label %num19
num19:
br label %num20
num20:
br label %reloplabel4
reloplabel4:
%t28 = icmp sgt i32 1, 2
br i1 %t28, label @, label @
%t29 = call i32 @epicBool(i1 true, i1 true, i1 %t28)
br label %call6
call6:
call void @printi(i32 %t29)
br label %endlabel5
endlabel5:
ret void 
}
define i32 @epicByte(i32 , i32 , i32 ) {
%ptr7 = getelementptr [10 x i8], [10 x i8]* @str7, i32 0, i32 0
call void @print(i8* %ptr7)
br label %id11
id11:
%t30 = load i32, i32* 
%t31 = trunc i32 %t30 to i8
%t32 = zext i8 %t31 to i32
br label %id12
id12:
%t33 = load i32, i32* 
%t34 = trunc i32 %t33 to i8
%t35 = zext i8 %t34 to i32
br label %id13
id13:
%t36 = load i32, i32* 
%t37 = trunc i32 %t36 to i8
%t38 = zext i8 %t37 to i32
br label %mul2
mul2:
%t39 = mul i32 %t35, %t38
%t40 = trunc i32 %t39 to i8
%t41 = zext i8 %t40 to i32
br label %add3
add3:
%t42 = add i32 %t32, %t41
%t43 = trunc i32 %t42 to i8
%t44 = zext i8 %t43 to i32
br label %id14
id14:
%t45 = load i32, i32* 
%t46 = trunc i32 %t45 to i8
%t47 = zext i8 %t46 to i32
br label %add4
add4:
%t48 = add i32 %t44, %t47
%t49 = trunc i32 %t48 to i8
%t50 = zext i8 %t49 to i32
ret i8 %t50
ret i32 0
}
