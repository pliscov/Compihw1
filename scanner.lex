%{
/* Declarations section */
#include <stdio.h>
#include "tokens.hpp"
void showToken(tokentype token);
%}

%option yylineno
%option noyywrap
binop           (+|-|*|\/)
id              ([a-zA-z][a-zA-z0-9]*)
string          ("([\x20\x21\x23-\x7E]|\\\\|\\"|\\n|\\r|\\t|\\0|\\x[0-9A-Ea-e][0-9A-Ea-e]|[\x20])*")
relop           (==|!=|<|>|<=|>=)
newline         \n|\r|\r\n
comment         //[^(\r\n)]*
num             [1-9]+[0-9]*

%%
(void)                      showToken(VOID);
(int)                       showToken(INT);
(b)                         showToken(B);
(byte)                      showToken(BYTE);
(bool)                      showToken(BOOL);
(or)                        showToken(OR);
(true)                      showToken(TRUE);
(return)                    showToken(RETURN);
(else)                      showToken(ELSE);
(break)                     showToken(BREAK);
(continue)                  showToken(CONTINUE);
(;)                         showToken(SC);
(,)                         showToken(COMMA);
(\()                        showToken(RPAREN);
(\))                        showToken(LPAREN);
(\{)                        showToken(LBRACE);
(\})                        showToken(RBRACE);
(=)                         showToken(ASSIGN);
binop                       showToken(BINOP);
(byte)                      showToken(BYTE);
(bool)                      showToken(BOOL);
(and)                       showToken(AND);
(not)                       showToken(NOT);
(false)                     showToken(FALSE);
(if)                        showToken(IF);
(while)                     showToken(WHILE);
relop                       showToken(RELOP);
id                          showToken(ID);
comment                     showToken(COMMENT);
num                         showToken(NUM);
string                      showToken(STRING);
.                           printf("Lex doesnt know what that is!\n");
%%




%%

void showToken(tokentype token){
        printf("%d %d %s", idk, token,
        printf("token is %s",name);
        printf("lexeme is %s",yytext);
        printf("length is ""%d",yyleng);
}