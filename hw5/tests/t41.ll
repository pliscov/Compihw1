@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [21 x i8] c"expecting returning4\00"
@str2 = internal constant [11 x i8] c"returning1\00"
@str3 = internal constant [11 x i8] c"returning2\00"
@str4 = internal constant [11 x i8] c"returning3\00"
@str5 = internal constant [11 x i8] c"returning4\00"
@str6 = internal constant [6 x i8] c"Cat\n\00"
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
%ptr1 = getelementptr [21 x i8], [21 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
br label %false1
false1:
br label %falsebool1
falsebool1:
br label %endlabel1
br label %false2
false2:
br label %falsebool2
falsebool2:
br label %endlabel1
br label %truelabel1
truelabel1:
%ptr2 = getelementptr [11 x i8], [11 x i8]* @str2, i32 0, i32 0
call void @print(i8* %ptr2)
ret void
br label %endlabel1
endlabel1:
br label %true1
true1:
br label %truebool1
truebool1:
br label %false3
br label %false3
false3:
br label %falsebool3
falsebool3:
br label %endlabel2
br label %truelabel2
truelabel2:
%ptr3 = getelementptr [11 x i8], [11 x i8]* @str3, i32 0, i32 0
call void @print(i8* %ptr3)
ret void
br label %endlabel2
endlabel2:
br label %false4
false4:
br label %falsebool4
falsebool4:
br label %endlabel3
br label %true2
true2:
br label %truebool2
truebool2:
br label %truelabel3
br label %truelabel3
truelabel3:
%ptr4 = getelementptr [11 x i8], [11 x i8]* @str4, i32 0, i32 0
call void @print(i8* %ptr4)
ret void
br label %endlabel3
endlabel3:
br label %true3
true3:
br label %truebool3
truebool3:
br label %true4
br label %true4
true4:
br label %truebool4
truebool4:
br label %truelabel4
br label %truelabel4
truelabel4:
%ptr5 = getelementptr [11 x i8], [11 x i8]* @str5, i32 0, i32 0
call void @print(i8* %ptr5)
ret void
br label %endlabel4
endlabel4:
%ptr6 = getelementptr [6 x i8], [6 x i8]* @str6, i32 0, i32 0
call void @print(i8* %ptr6)
ret void 
}
