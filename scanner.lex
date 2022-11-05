%{
/* Declarations section */
#include <stdio.h>
void showToken(tokentype token);
#include "tokens.hpp"

void showToken(char* name);
%}

%option yylineno
%option noyywrap
INT             (int)
BYTE            (byte)
BOOL            (bool)
OR              (or)
TRUE            (true)
RETURN          (return)
ELSE            (else)
BREAK           (break)
SC              (;)
ASSIGN          (=)
BINOP           (+|-|*|\/)
ID              ([a-zA-z][a-zA-z0-9]*)
STRING          ("([\x20\x21\x23-\x7E]|\\\\|\\"|\\n|\\r|\\t|\\0|\\x[0-9A-Ea-e][0-9A-Ea-e]|[\x20])*")


digit           ([0-9])
letter          ([a-zA-z])
whitespace      ([\t\n])

relop           (==|!=|<|>|<=|>=)
newline         \n|\r|\r\n
comment         //[^(\r\n)]*
num             [1-9]+[0-9]*

%%
STRING                      showToken(STRING);
INT                         showToken(INT);
BYTE                        showToken(BYTE);
BOOL                        showToken(BOOL);
OR                          showToken(OR);
TRUE                        showToken(TRUE);
RETURN                      showToken(RETURN);
ELSE                        showToken(ELSE);
BREAK                       showToken(BREAK);
SC                          showToken(SC);
ASSIGN                      showToken(ASSIGN);
BINOP                       showToken(BINOP);

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

void showToken(tokentype token){
        printf("%d %d %s", idk, token,
        printf("token is %s",name);
        printf("lexeme is %s",yytext);
        printf("length is ""%d",yyleng);
}