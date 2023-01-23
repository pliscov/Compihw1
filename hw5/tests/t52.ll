@divzero = internal constant [23 x i8] c"Error division by zero\00"
@str1 = internal constant [31 x i8] c"You should be seeing 6 'Good's\00"
@str2 = internal constant [5 x i8] c"Good\00"
@str3 = internal constant [4 x i8] c"BAD\00"
@str4 = internal constant [4 x i8] c"BAD\00"
@str5 = internal constant [5 x i8] c"Good\00"
@str6 = internal constant [5 x i8] c"Good\00"
@str7 = internal constant [4 x i8] c"BAD\00"
@str8 = internal constant [5 x i8] c"Good\00"
@str9 = internal constant [4 x i8] c"BAD\00"
@str10 = internal constant [4 x i8] c"BAD\00"
@str11 = internal constant [5 x i8] c"Good\00"
@str12 = internal constant [4 x i8] c"BAD\00"
@str13 = internal constant [5 x i8] c"Good\00"
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
%ptr1 = getelementptr [31 x i8], [31 x i8]* @str1, i32 0, i32 0
call void @print(i8* %ptr1)
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
define i1 @getTrueButNested() {
%t1 = call i1@getTrue()
br label %call1
call1:
ret i1 %t1
ret i1 false
}
define void @main() {
call void@soGood()
%ptr2 = getelementptr [5 x i8], [5 x i8]* @str2, i32 0, i32 0
br label %truelabel1
br label %true2
true2:
br label %truebool2
truebool2:
br label %
%ptr3 = getelementptr [4 x i8], [4 x i8]* @str3, i32 0, i32 0
br label %falselabel1
truelabel1:
br label %endlabel1
falselabel1:
br label %endlabel1
endlabel1:
br label %endlabel2
endlabel2:
call void @print(i8* %ptr2)
%ptr4 = getelementptr [4 x i8], [4 x i8]* @str4, i32 0, i32 0
br label %truelabel2
br label %false1
false1:
br label %falsebool1
falsebool1:
br label %
%ptr5 = getelementptr [5 x i8], [5 x i8]* @str5, i32 0, i32 0
br label %falselabel2
truelabel2:
br label %endlabel3
falselabel2:
br label %endlabel3
endlabel3:
br label %endlabel4
endlabel4:
call void @print(i8* %ptr4)
%ptr6 = getelementptr [5 x i8], [5 x i8]* @str6, i32 0, i32 0
br label %truelabel3
%t2 = call i1@getTrue()
br label %call2
call2:
%ptr7 = getelementptr [4 x i8], [4 x i8]* @str7, i32 0, i32 0
br label %falselabel3
truelabel3:
br label %endlabel5
falselabel3:
br label %endlabel5
endlabel5:
br label %endlabel6
endlabel6:
call void @print(i8* %ptr6)
%ptr8 = getelementptr [5 x i8], [5 x i8]* @str8, i32 0, i32 0
br label %truelabel4
%t3 = call i1@getTrueButNested()
br label %call3
call3:
%ptr9 = getelementptr [4 x i8], [4 x i8]* @str9, i32 0, i32 0
br label %falselabel4
truelabel4:
br label %endlabel7
falselabel4:
br label %endlabel7
endlabel7:
br label %endlabel8
endlabel8:
call void @print(i8* %ptr8)
%ptr10 = getelementptr [4 x i8], [4 x i8]* @str10, i32 0, i32 0
br label %truelabel6
br label %false2
false2:
br label %falsebool2
falsebool2:
br label %call4
%ptr11 = getelementptr [5 x i8], [5 x i8]* @str11, i32 0, i32 0
br label %truelabel5
%t4 = call i1@getTrueButNested()
br label %call4
call4:
%t5 = call i1@getTrueButNested()
br label %call5
call5:
%t6 = call i1@getTrueButNested()
br label %call6
call6:
%ptr12 = getelementptr [4 x i8], [4 x i8]* @str12, i32 0, i32 0
br label %falselabel5
truelabel5:
br label %endlabel9
falselabel5:
br label %endlabel9
endlabel9:
br label %endlabel10
endlabel10:
br label %falselabel6
truelabel6:
br label %endlabel11
falselabel6:
br label %endlabel11
endlabel11:
br label %endlabel12
endlabel12:
call void @print(i8* %ptr10)
%ptr13 = getelementptr [5 x i8], [5 x i8]* @str13, i32 0, i32 0
call void @print(i8* %ptr13)
call void@soGood()
ret void 
}
