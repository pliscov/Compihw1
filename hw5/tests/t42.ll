@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [14 x i8] c"expecting 1 2\00"
@str2 = internal constant [2 x i8] c"1\00"
@str3 = internal constant [2 x i8] c"2\00"
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

define i1 @getTrue() {
br label %true1
true1:
br label %truebool1
truebool1:
br label @
ret i1 true
ret i1 false
}
define void @main() {
%ptr1 = getelementptr [14 x i8], [14 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %false1
false1:
br label %falsebool1
falsebool1:
br label %falselabel1
br label %truelabel1
truelabel1:
br label %endlabel1
falselabel1:
br label %endlabel1
endlabel1:
%t1 = phi i32 [1, %truelabel1], [0, %falselabel1]
%ptr2 = alloca i32
store i32 %t1, i32* %ptr2
br label %true2
true2:
br label %truebool2
truebool2:
br label %truelabel2
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
%t3 = load i32, i32* %ptr3
%t4 = icmp eq i32 1, %t3
br i1 %t4, label %truelabel3, label %id2
br label %id2
id2:
%t5 = load i32, i32* %ptr2
%t6 = icmp eq i32 1, %t5
br i1 %t6, label %truelabel3, label %endlabel3
br label %truelabel3
truelabel3:
%ptr4 = getelementptr [2 x i8], [2 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr4)
br label %endlabel3
endlabel3:
br label %id3
id3:
%t7 = load i32, i32* %ptr2
%t8 = icmp eq i32 1, %t7
br i1 %t8, label %truelabel4, label %id4
br label %id4
id4:
%t9 = load i32, i32* %ptr3
%t10 = icmp eq i32 1, %t9
br i1 %t10, label %truelabel4, label %endlabel4
br label %truelabel4
truelabel4:
%ptr5 = getelementptr [2 x i8], [2 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr5)
br label %endlabel4
endlabel4:
ret void 
}
