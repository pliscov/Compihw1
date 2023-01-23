@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [25 x i8] c"Now testing boolean shit\00"
@str2 = internal constant [15 x i8] c"Expecting true\00"
@str3 = internal constant [5 x i8] c"true\00"
@str4 = internal constant [6 x i8] c"false\00"
@str5 = internal constant [36 x i8] c"Why are you here?? that's illeagal!\00"
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
%ptr1 = getelementptr [25 x i8], [25 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
%ptr2 = getelementptr [15 x i8], [15 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
br label %true1
true1:
br label %truebool1
truebool1:
br label %truelabel1
br label %false1
false1:
br label %falsebool1
falsebool1:
br label %false2
br label %false2
false2:
br label %falsebool2
falsebool2:
br label %false3
br label %false3
false3:
br label %falsebool3
falsebool3:
br label %false4
br label %false4
false4:
br label %falsebool4
falsebool4:
br label %falselabel1
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
br i1 %t3, label %truelabel2, label %falselabel2
br label %truelabel2
truelabel2:
%ptr4 = getelementptr [5 x i8], [5 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
ret void
br label %endlabel2
br label %falselabel2
falselabel2:
%ptr5 = getelementptr [6 x i8], [6 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr5)
ret void
br label %endlabel2
endlabel2:
ret void
%ptr6 = getelementptr [36 x i8], [36 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr6)
ret void 
}
