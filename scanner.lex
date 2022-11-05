%{
/* Declarations section */
#include <stdio.h>
void showToken(char* name);
%}
    printf("%s, %s, %d\n",name,yytext,yyleng);

%option yylineno
%option noyywrap
digit           ([0-9])
letter          ([a-zA-z])
whitespace      ([\t\n])

%%
(digit)+                    showToken("number");
(letter)+@(letter)+\.com    showToken("email address");
(whitespace)                ;
.                           printf("Lex doesnt know what that is!\n");
%%

void showToken(char* name){
        printf("token is %s",name);
        printf("lexeme is %s",yytext);
        printf("length is ""%d",yyleng);
}