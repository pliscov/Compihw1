@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [15 x i8] c"Expecting true\00"
@str2 = internal constant [12 x i8] c"res == true\00"
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
%ptr1 = getelementptr [15 x i8], [15 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %true1
true1:
br label %truebool1
truebool1:
br label %truelabel1
br label %truelabel1
truelabel1:
br label %endlabel1
falselabel1:
br label %endlabel1
endlabel1:
%t1 = phi i32 [1, %truelabel1], [0, %falselabel1]
%ptr2 = alloca i32
store i32 %t1, i32* %ptr2
br label %false1
false1:
br label %falsebool1
falsebool1:
br label %falselabel2
br label %truelabel2
truelabel2:
br label %endlabel2
falselabel2:
br label %endlabel2
endlabel2:
%t2 = phi i32 [1, %truelabel2], [0, %falselabel2]
%ptr3 = alloca i32
store i32 %t2, i32* %ptr3
br label %id1
id1:
%t3 = load i32, i32* %ptr2
%t4 = icmp eq i32 1, %t3
br i1 %t4, label %truelabel3, label %id2
br label %id2
id2:
%t5 = load i32, i32* %ptr3
%t6 = icmp eq i32 1, %t5
br i1 %t6, label %truelabel3, label %falselabel3
br label %truelabel3
truelabel3:
br label %endlabel3
falselabel3:
br label %endlabel3
endlabel3:
%t7 = phi i32 [1, %truelabel3], [0, %falselabel3]
%ptr4 = alloca i32
store i32 %t7, i32* %ptr4
br label %id3
id3:
%t8 = load i32, i32* %ptr4
%t9 = icmp eq i32 1, %t8
br i1 %t9, label %truelabel4, label %endlabel4
br label %truelabel4
truelabel4:
%ptr5 = getelementptr [12 x i8], [12 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr5)
br label %endlabel4
endlabel4:
%ptr6 = getelementptr [4 x i8], [4 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr6)
ret void 
}
