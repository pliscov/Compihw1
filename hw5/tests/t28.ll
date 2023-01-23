@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [33 x i8] c"this is a cute single trenary op\00"
@str2 = internal constant [4 x i8] c"Yay\00"
@str3 = internal constant [13 x i8] c"Shame on you\00"
@str4 = internal constant [7 x i8] c"ok Bye\00"
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
%ptr1 = getelementptr [33 x i8], [33 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %true2
true1:
br label %truebool1
truebool1:
br label %truelabel2
br label %truelabel1
br label %true2
true2:
br label %truebool2
truebool2:
br label %true1
br label %false1
false1:
br label %falsebool1
falsebool1:
br label %falselabel2
br label %falselabel1
truelabel1:
br label %endlabel1
falselabel1:
br label %endlabel1
endlabel1:
br label %endlabel2
endlabel2:
br label %truelabel2
truelabel2:
br label %endlabel3
falselabel2:
br label %endlabel3
endlabel3:
%t1 = phi i32 [1, %truelabel2], [0, %falselabel2]
%ptr2 = alloca i32
store i32 %t1, i32* %ptr2
br label %id1
id1:
%t2 = load i32, i32* %ptr2
%t3 = icmp eq i32 1, %t2
br i1 %t3, label %truelabel3, label %id2
br label %id2
id2:
%t4 = load i32, i32* %ptr2
%t5 = icmp eq i32 1, %t4
br i1 %t5, label %truelabel3, label %endlabel4
br label %truelabel3
truelabel3:
%ptr3 = getelementptr [4 x i8], [4 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr3)
br label %endlabel4
endlabel4:
br label %id3
id3:
%t6 = load i32, i32* %ptr2
%t7 = icmp eq i32 1, %t6
br i1 %t7, label %endlabel5, label %truelabel4
br label %not1
not1:
br label %truelabel4
truelabel4:
%ptr4 = getelementptr [13 x i8], [13 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
br label %endlabel5
endlabel5:
%ptr5 = getelementptr [7 x i8], [7 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr5)
ret void
ret void 
}
