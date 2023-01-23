@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [12 x i8] c"original x:\00"
@str2 = internal constant [12 x i8] c"original w:\00"
@str3 = internal constant [15 x i8] c"--n-- 1st loop\00"
@str4 = internal constant [15 x i8] c"--x-- 2nd loop\00"
@str5 = internal constant [15 x i8] c"--w-- 1st loop\00"
@str6 = internal constant [18 x i8] c"Loop in loop test\00"
@str7 = internal constant [6 x i8] c"ERROR\00"
@str8 = internal constant [6 x i8] c"ERROR\00"
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

define i32 @loopLoopLoopLoopLoop(i32 , i32 , i32 , i32 , i32 ) {
br label %id1
id1:
%t1 = load i32, i32* 
%ptr1 = alloca i32
store i32 %t1, i32* %ptr1
br label %id2
id2:
%t2 = load i32, i32* 
%ptr2 = alloca i32
store i32 %t2, i32* %ptr2
%ptr3 = getelementptr [12 x i8], [12 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr3)
br label %id3
id3:
%t3 = load i32, i32* 
call void @printi(i32 %t3)
%ptr4 = getelementptr [12 x i8], [12 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr4)
br label %id4
id4:
%t4 = load i32, i32* 
call void @printi(i32 %t4)
%ptr5 = getelementptr [15 x i8], [15 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr5)
br label %id5
id5:
%t5 = load i32, i32* 
call void @printi(i32 %t5)
br label %id6
id6:
%t6 = load i32, i32* %ptr1
br label %id7
id7:
%t7 = load i32, i32* 
br label %reloplabel1
reloplabel1:
%t8 = icmp slt i32 %t6, %t7
br i1 %t8, label %truelabel1, label %endlabel2
br label %truelabel1
truelabel1:
br label %id8
id8:
%t9 = load i32, i32* %ptr2
br label %id9
id9:
%t10 = load i32, i32* 
br label %reloplabel2
reloplabel2:
%t11 = icmp slt i32 %t9, %t10
br i1 %t11, label %truelabel2, label %endlabel1
br label %truelabel2
truelabel2:
%ptr6 = getelementptr [15 x i8], [15 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr6)
br label %id10
id10:
%t12 = load i32, i32* %ptr2
call void @printi(i32 %t12)
br label %id11
id11:
%t13 = load i32, i32* %ptr2
br label %num1
num1:
br label %add1
add1:
%t14 = add i32 %t13, 1
store i32 %t14, i32* %ptr2
br label %reloplabel2
br label %id12
id12:
%t15 = load i32, i32* %ptr2
br label %num2
num2:
br label %add2
add2:
%t16 = add i32 %t15, 1
store i32 %t16, i32* %ptr2
br label %id8
br label %endlabel1
endlabel1:
br label %id13
id13:
%t17 = load i32, i32* 
store i32 %t17, i32* %ptr2
%ptr7 = getelementptr [15 x i8], [15 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr7)
br label %id14
id14:
%t18 = load i32, i32* %ptr1
br label %num3
num3:
br label %add3
add3:
%t19 = add i32 %t18, 1
store i32 %t19, i32* %ptr1
br label %id15
id15:
%t20 = load i32, i32* %ptr1
call void @printi(i32 %t20)
br label %id6
br label %endlabel2
endlabel2:
br label %num4
num4:
br label %num5
num5:
br label %sub1
sub1:
%t21 = sub i32 0, 1
ret i32 %t21
ret i32 0
}
define void @main() {
%ptr8 = getelementptr [18 x i8], [18 x i8]* @str6, i32 0, i32 0
call void @print(i8* %ptr8)
br label %num6
num6:
br label %num7
num7:
br label %num8
num8:
br label %num9
num9:
br label %num10
num10:
%t22 = call i32 @loopLoopLoopLoopLoop(i32 1, i32 1, i32 1, i32 1, i32 3)
br label %call1
call1:
%ptr9 = alloca i32
store i32 %t22, i32* %ptr9
br label %id16
id16:
%t23 = load i32, i32* %ptr9
call void @printi(i32 %t23)
br label %num11
num11:
br label %num12
num12:
br label %num13
num13:
br label %num14
num14:
br label %num15
num15:
%t24 = call i32 @loopLoopLoopLoopLoop(i32 1, i32 1, i32 1, i32 1, i32 2)
br label %call2
call2:
br label %num16
num16:
br label %num17
num17:
br label %sub2
sub2:
%t25 = sub i32 2, 3
br label %reloplabel3
reloplabel3:
%t26 = icmp ne i32 %t24, %t25
br i1 %t26, label %truelabel3, label %endlabel3
br label %truelabel3
truelabel3:
%ptr10 = getelementptr [6 x i8], [6 x i8]* @str7, i32 0, i32 0
call void @print(i8* %ptr10)
ret void
br label %endlabel3
endlabel3:
br label %num18
num18:
br label %num19
num19:
br label %num20
num20:
br label %num21
num21:
br label %num22
num22:
%t27 = call i32 @loopLoopLoopLoopLoop(i32 2, i32 3, i32 4, i32 1, i32 10)
br label %call3
call3:
br label %num23
num23:
br label %num24
num24:
br label %sub3
sub3:
%t28 = sub i32 2, 3
br label %reloplabel4
reloplabel4:
%t29 = icmp ne i32 %t27, %t28
br i1 %t29, label %truelabel4, label %endlabel4
br label %truelabel4
truelabel4:
%ptr11 = getelementptr [6 x i8], [6 x i8]* @str8, i32 0, i32 0
call void @print(i8* %ptr11)
ret void
br label %endlabel4
endlabel4:
ret void 
}
