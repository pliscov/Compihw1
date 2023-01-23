@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [31 x i8] c"This is another nested trenary\00"
@str2 = internal constant [12 x i8] c"You failed!\00"
@str3 = internal constant [25 x i8] c"Good job!..... this time\00"
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
%ptr1 = getelementptr [31 x i8], [31 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %true2
true1:
br label %truebool1
truebool1:
br label %truelabel3
br label %truelabel1
br label %false1
false1:
br label %falsebool1
falsebool1:
br label %falsebool2
br label %false2
false2:
br label %falsebool2
falsebool2:
br label %falselabel3
br label %falselabel1
truelabel1:
br label %endlabel1
falselabel1:
br label %endlabel1
endlabel1:
br label %endlabel2
endlabel2:
br label %truelabel2
br label %true2
true2:
br label %truebool2
truebool2:
br label %false1
br label %false3
false3:
br label %falsebool3
falsebool3:
br label %falselabel3
br label %falselabel2
truelabel2:
br label %endlabel3
falselabel2:
br label %endlabel3
endlabel3:
br label %endlabel4
endlabel4:
br label %truelabel3
truelabel3:
br label %endlabel5
falselabel3:
br label %endlabel5
endlabel5:
%t1 = phi i32 [1, %truelabel3], [0, %falselabel3]
%ptr2 = alloca i32
store i32 %t1, i32* %ptr2
br label %id1
id1:
%t2 = load i32, i32* %ptr2
%t3 = icmp eq i32 1, %t2
br i1 %t3, label %truelabel4, label %falselabel4
br label %truelabel4
truelabel4:
%ptr3 = getelementptr [12 x i8], [12 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr3)
br label %endlabel6
br label %falselabel4
falselabel4:
%ptr4 = getelementptr [25 x i8], [25 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr4)
br label %endlabel6
endlabel6:
ret void 
}
