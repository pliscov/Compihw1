@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [26 x i8] c"More boolean testing! YAY\00"
@str2 = internal constant [16 x i8] c"expecting false\00"
@str3 = internal constant [13 x i8] c"indeed false\00"
@str4 = internal constant [4 x i8] c"Fin\00"
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
%ptr1 = getelementptr [26 x i8], [26 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [16 x i8], [16 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %true1
true1:
br label %truebool1
truebool1:
br label %true2
br label %true2
true2:
br label %truebool2
truebool2:
br label %true3
br label %true3
true3:
br label %truebool3
truebool3:
br label %true4
br label %true4
true4:
br label %truebool4
truebool4:
br label %true5
br label %true5
true5:
br label %truebool5
truebool5:
br label %true6
br label %true6
true6:
br label %truebool6
truebool6:
br label %falselabel1
br label %not1
not1:
br label %truelabel1
truelabel1:
br label %endlabel1
falselabel1:
br label %endlabel1
endlabel1:
%t1 = phi i32 [1, %truelabel1], [0, %falselabel1]
%ptr3 = alloca i32
store i32 %t1, i32* %ptr3
br label %id1
id1:
%t2 = load i32, i32* %ptr3
%t3 = icmp eq i32 1, %t2
br i1 %t3, label %endlabel2, label %truelabel2
br label %not2
not2:
br label %truelabel2
truelabel2:
%ptr4 = getelementptr [13 x i8], [13 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
br label %endlabel2
endlabel2:
%ptr5 = getelementptr [4 x i8], [4 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr5)
ret void 
}
