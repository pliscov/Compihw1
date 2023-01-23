@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [30 x i8] c"Should be seeing 90 (I think)\00"
@str2 = internal constant [29 x i8] c"Should be seeing 8 (I think)\00"
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

define void @soGood() {
ret void
ret void
ret void
ret void
ret void
ret void 
}
define i32 @nest1(i32 , i32 , i32 ) {
br label %id1
id1:
%t1 = load i32, i32* 
br label %id2
id2:
%t2 = load i32, i32* 
br label %add1
add1:
%t3 = add i32 %t1, %t2
br label %id3
id3:
%t4 = load i32, i32* 
br label %add2
add2:
%t5 = add i32 %t3, %t4
ret i32 %t5
ret i32 0
}
define i8 @nest2(i32 , i32 ) {
%ptr1 = alloca i32
store i32 0, i32* %ptr1
br label %id4
id4:
%t6 = load i32, i32* 
%t7 = trunc i32 %t6 to i8
%t8 = zext i8 %t7 to i32
br label %id5
id5:
%t9 = load i32, i32* 
%t10 = trunc i32 %t9 to i8
%t11 = zext i8 %t10 to i32
br label %add3
add3:
%t12 = add i32 %t8, %t11
%t13 = trunc i32 %t12 to i8
%t14 = zext i8 %t13 to i32
store i32 %t14, i32* %ptr1
br label %id6
id6:
%t15 = load i32, i32* %ptr1
%t16 = trunc i32 %t15 to i8
%t17 = zext i8 %t16 to i32
br label %id7
id7:
%t18 = load i32, i32* %ptr1
%t19 = trunc i32 %t18 to i8
%t20 = zext i8 %t19 to i32
br label %id8
id8:
%t21 = load i32, i32* %ptr1
%t22 = trunc i32 %t21 to i8
%t23 = zext i8 %t22 to i32
%t24 = call i32 @nest1(i32 %t17, i32 %t20, i32 %t23)
br label %call1
call1:
%t25 = trunc i32 %t24 to i8
%t26 = zext i8 %t25 to i32
ret i8 %t26
ret i8 0
}
define i8 @nest3(i32 , i32 ) {
br label %id9
id9:
%t27 = load i32, i32* 
%t28 = trunc i32 %t27 to i8
%t29 = zext i8 %t28 to i32
br label %num1
num1:
br label %div1
div1:
%t31 = icmp eq i32 0, 2
br i1 %t31, label %divzerolabel1, label %end_divzerolabel1
divzerolabel1:
%ptr2 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr2)
call void @exit(i32 1)
br label %end_divzerolabel1
end_divzerolabel1:
%t30 = sdiv i32 %t29, 2
br label %id10
id10:
%t32 = load i32, i32* 
%t33 = trunc i32 %t32 to i8
%t34 = zext i8 %t33 to i32
br label %num2
num2:
br label %div2
div2:
%t36 = icmp eq i32 0, 3
br i1 %t36, label %divzerolabel2, label %end_divzerolabel2
divzerolabel2:
%ptr3 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr3)
call void @exit(i32 1)
br label %end_divzerolabel2
end_divzerolabel2:
%t35 = sdiv i32 %t34, 3
%t37 = call i8 @nest2(i32 %t30, i32 %t35)
br label %call2
call2:
br label %id11
id11:
%t38 = load i32, i32* 
%t39 = trunc i32 %t38 to i8
%t40 = zext i8 %t39 to i32
br label %num3
num3:
br label %div3
div3:
%t42 = icmp eq i32 0, 2
br i1 %t42, label %divzerolabel3, label %end_divzerolabel3
divzerolabel3:
%ptr4 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr4)
call void @exit(i32 1)
br label %end_divzerolabel3
end_divzerolabel3:
%t41 = sdiv i32 %t40, 2
br label %id12
id12:
%t43 = load i32, i32* 
%t44 = trunc i32 %t43 to i8
%t45 = zext i8 %t44 to i32
br label %num4
num4:
br label %div4
div4:
%t47 = icmp eq i32 0, 3
br i1 %t47, label %divzerolabel4, label %end_divzerolabel4
divzerolabel4:
%ptr5 = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0
call void @print(i8* %ptr5)
call void @exit(i32 1)
br label %end_divzerolabel4
end_divzerolabel4:
%t46 = sdiv i32 %t45, 3
%t48 = call i8 @nest2(i32 %t41, i32 %t46)
br label %call3
call3:
br label %add4
add4:
%t49 = add i32 %t37, %t48
%t50 = trunc i32 %t49 to i8
%t51 = zext i8 %t50 to i32
ret i8 %t51
ret i8 0
}
define void @main() {
%ptr6 = getelementptr [30 x i8], [30 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr6)
br label %byte1
byte1:
br label %byte2
byte2:
%t52 = call i8 @nest3(i32 6, i32 30)
br label %call4
call4:
call void @printi(i32 %t52)
%ptr7 = getelementptr [29 x i8], [29 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr7)
br label %byte3
byte3:
br label %byte4
byte4:
%t53 = call i8 @nest3(i32 71, i32 37)
br label %call5
call5:
call void @printi(i32 %t53)
ret void 
}
