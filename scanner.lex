%{
/* Declarations section */
#include <stdio.h>
#include "tokens.hpp"

void showToken(char* name);
%}
    printf("%s, %s, %d\n",name,yytext,yyleng);

%option yylineno
%option noyywrap

relop           (==|!=|<|>|<=|>=)
newline         \n|\r|\r\n
comment         //[^(\r\n)]*
num             [1-9]+[0-9]*

%%                    

(void)                      showToken(VOID);
(byte)                      showToken(BYTE);
(bool)                      showToken(BOOL);
(and)                       showToken(AND);
(not)                       showToken(NOT);
(false)                     showToken(FALSE);
(if)                        showToken(IF);
(while)                     showToken(WHILE);
relop                       showToken(RELOP);
comment                     showToken(COMMENT);
num                         showToken(NUM);

.                           printf("Lex doesnt know what that is!\n");


%%

void showToken(char* name){
        printf("token is %s",name);
        printf("lexeme is %s",yytext);
        printf("length is ""%d",yyleng);
}