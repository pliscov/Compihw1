@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [40 x i8] c"This is trenary op in loop in loop test\00"
@str2 = internal constant [45 x i8] c"What is the drug dealer's favorite variable?\00"
@str3 = internal constant [4 x i8] c"SUM\00"
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

define i32 @dumbFunc(i32 , i32 ) {
br label %id1
id1:
%t1 = load i32, i32* 
br label %id2
id2:
%t2 = load i32, i32* 
%t3 = trunc i32 %t2 to i8
%t4 = zext i8 %t3 to i32
br label %add1
add1:
%t5 = add i32 %t1, %t4
br label %id3
id3:
%t6 = load i32, i32* 
br label %id4
id4:
%t7 = load i32, i32* 
%t8 = trunc i32 %t7 to i8
%t9 = zext i8 %t8 to i32
br label %add2
add2:
%t10 = add i32 %t6, %t9
br label %mul1
mul1:
%t11 = mul i32 %t5, %t10
ret i32 %t11
ret i32 0
}
define void @main() {
%ptr1 = getelementptr [40 x i8], [40 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %num1
num1:
%ptr2 = alloca i32
store i32 0, i32* %ptr2
br label %id5
id5:
%t12 = load i32, i32* %ptr2
br label %num2
num2:
br label %reloplabel1
reloplabel1:
%t13 = icmp slt i32 %t12, 10
br i1 %t13, label %truelabel1, label %endlabel4
br label %truelabel1
truelabel1:
br label %num3
num3:
%ptr3 = alloca i32
store i32 0, i32* %ptr3
br label %true1
true1:
br label %truebool1
truebool1:
br label %truelabel2
br label %truelabel2
truelabel2:
br label %call1
id6:
%t14 = load i32, i32* %ptr3
br label %truelabel3
br label %id7
id7:
%t15 = load i32, i32* %ptr3
br label %id8
id8:
%t16 = load i32, i32* %ptr2
br label %sub1
sub1:
%t17 = sub i32 %t15, %t16
br label %byte1
byte1:
%t18 = call i32 @dumbFunc(i32 %t17, i32 0)
br label %call1
call1:
br label %num4
num4:
br label %reloplabel2
reloplabel2:
%t19 = icmp sge i32 %t18, 0
br i1 %t19, label %id6, label %id9
br label %id9
id9:
%t20 = load i32, i32* %ptr2
br label %falselabel1
truelabel3:
br label %endlabel1
falselabel1:
br label %endlabel1
endlabel1:
%t21 = phi i32 [%t14, %truelabel3 ], [%t20, %falselabel1 ]
store i32 %t21, i32* %ptr3
br label %id10
id10:
%t22 = load i32, i32* %ptr3
br label %num5
num5:
br label %reloplabel3
reloplabel3:
%t23 = icmp sge i32 %t22, 3
br i1 %t23, label %truelabel4, label %endlabel2
br label %truelabel4
truelabel4:
br label %endlabel3
br label %endlabel2
endlabel2:
%ptr4 = getelementptr [45 x i8], [45 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr4)
br label %id11
id11:
%t24 = load i32, i32* %ptr3
br label %num6
num6:
br label %add3
add3:
%t25 = add i32 %t24, 1
store i32 %t25, i32* %ptr3
br label %true1
br label %endlabel3
endlabel3:
br label %id12
id12:
%t26 = load i32, i32* %ptr2
br label %num7
num7:
br label %add4
add4:
%t27 = add i32 %t26, 1
store i32 %t27, i32* %ptr2
br label %id5
br label %endlabel4
endlabel4:
%ptr5 = getelementptr [4 x i8], [4 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr5)
ret void 
}
define void @dumberfuncer() {
ret void
ret void
ret void
ret void
ret void
ret void
ret void
ret void
ret void
ret void
ret void
ret void
ret void
ret void
ret void
ret void
ret void 
}
