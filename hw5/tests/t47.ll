@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [15 x i8] c"Advanced funky\00"
@str2 = internal constant [7 x i8] c"got x:\00"
@str3 = internal constant [7 x i8] c"got y:\00"
@str4 = internal constant [37 x i8] c"Trenary op with func params incoming\00"
@str5 = internal constant [7 x i8] c"z == x\00"
@str6 = internal constant [7 x i8] c"z == y\00"
@str7 = internal constant [13 x i8] c"Expecting 47\00"
@str8 = internal constant [40 x i8] c"Calling advancedFunc with params 47, 50\00"
@str9 = internal constant [15 x i8] c"actual result:\00"
@str10 = internal constant [5 x i8] c"done\00"
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

define i32 @advancedFunc(i32 , i32 ) {
%ptr1 = getelementptr [15 x i8], [15 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [7 x i8], [7 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %id1
id1:
%t1 = load i32, i32* 
call void @printi(i32 %t1)
%ptr3 = getelementptr [7 x i8], [7 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr3)
br label %id2
id2:
%t2 = load i32, i32* 
call void @printi(i32 %t2)
%ptr4 = getelementptr [37 x i8], [37 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr4)
br label %true1
id3:
%t3 = load i32, i32* 
br label %truelabel1
br label %true1
true1:
br label %truebool1
truebool1:
br label %id3
br label %id4
id4:
%t4 = load i32, i32* 
br label %falselabel1
truelabel1:
br label %endlabel1
falselabel1:
br label %endlabel1
endlabel1:
%t5 = phi i32 [%t3, %truelabel1 ], [%t4, %falselabel1 ]
%ptr5 = alloca i32
store i32 %t5, i32* %ptr5
br label %id5
id5:
%t6 = load i32, i32* %ptr5
br label %id6
id6:
%t7 = load i32, i32* 
br label %reloplabel1
reloplabel1:
%t8 = icmp eq i32 %t6, %t7
br i1 %t8, label %truelabel2, label %endlabel2
br label %truelabel2
truelabel2:
%ptr6 = getelementptr [7 x i8], [7 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr6)
br label %endlabel2
endlabel2:
br label %id7
id7:
%t9 = load i32, i32* %ptr5
br label %id8
id8:
%t10 = load i32, i32* 
br label %reloplabel2
reloplabel2:
%t11 = icmp eq i32 %t9, %t10
br i1 %t11, label %truelabel3, label %endlabel3
br label %truelabel3
truelabel3:
%ptr7 = getelementptr [7 x i8], [7 x i8]* @str6, i32 0, i32 0
call void @print(i8* %ptr7)
br label %endlabel3
endlabel3:
br label %id9
id9:
%t12 = load i32, i32* %ptr5
ret i32 %t12
ret i32 0
}
define i1 @getTrue() {
br label %true2
true2:
br label %truebool2
truebool2:
br label @
ret i1 true
ret i1 false
}
define void @main() {
%ptr8 = getelementptr [13 x i8], [13 x i8]* @str7, i32 0, i32 0
call void @print(i8* %ptr8)
%ptr9 = getelementptr [40 x i8], [40 x i8]* @str8, i32 0, i32 0
call void @print(i8* %ptr9)
br label %num1
num1:
br label %num2
num2:
%t13 = call i32 @advancedFunc(i32 47, i32 50)
br label %call1
call1:
%ptr10 = alloca i32
store i32 %t13, i32* %ptr10
%ptr11 = getelementptr [15 x i8], [15 x i8]* @str9, i32 0, i32 0
call void @print(i8* %ptr11)
br label %id10
id10:
%t14 = load i32, i32* %ptr10
call void @printi(i32 %t14)
%ptr12 = getelementptr [5 x i8], [5 x i8]* @str10, i32 0, i32 0
call void @print(i8* %ptr12)
ret void 
}
