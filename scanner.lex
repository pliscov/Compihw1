%{
/* Declarations section */
#include <stdio.h>
#include "tokens.hpp"
#include <vector>
#include <string>
void throwError(int);

%}

%option yylineno
%option noyywrap
binop           (\+|\-|\*|\/)
id              ([a-zA-z][a-zA-z0-9]*)
comment         (//)
relop           (==|!=|<|>|<=|>=)
newline         \n|\r|\r\n
escape          (\\(n|\\r|\\t|\\0|\\))|(\\x[0-9A-Fa-f][0-9A-Fa-f])
chars           [ !\x23-\x5B\x5D-\x7E]
illegal_escape  \\[^nrt0x\\]
str             ({chars}|{escape})*
unclosed_str    \"{str}{newline}
illegal_str     \"{str}{illegal_escape}



num             0|([1-9]+[0-9]*)
whitespace      [\t ]
unprintable     [^\x20-\x7E\t\r\n]

%x COMM

%%

{unprintable}               throwError(1);
"void"                      return VOID;
"int"                       return INT;
"b"                         return B;
"byte"                      return BYTE;
"bool"                      return BOOL;
"or"                        return OR;
"true"                      return TRUE;
"return"                    return RETURN;
"else"                      return ELSE;
"break"                     return BREAK;
"continue"                  return CONTINUE;
";"                         return SC;
","                         return COMMA;
"\("                        return LPAREN;
"\)"                        return RPAREN;
"\{"                        return LBRACE;
"\}"                        return RBRACE;
"="                         return ASSIGN;
{binop}                     return BINOP;
"and"                       return AND;
"not"                       return NOT;
"false"                     return FALSE;
"if"                        return IF;
"while"                     return WHILE;
{relop}                     return RELOP;
{id}                        return ID;
{num}                       return NUM;
{unclosed_str}              throwError(2);
{illegal_str}               throwError(3); 
\"{str}\"                   return STRING;
{whitespace}                {}
\/\/                        {BEGIN(COMM); return COMMENT;}
\n                          {yylineno++; yylineno--;}
<COMM>\n                    BEGIN(INITIAL);
<COMM>[^\n]                 {}           



%%


void throwError(int num){
    if (num == 0)
        printf("Error unrecognized character\n");
    else if (num == 1)
        printf("Error %c\n", yytext);
    else if (num == 2)
        printf("Error unclosed string\n");
    else if (num == 3)
        printf("Error undefined escape sequence %c\n", yytext[yyleng - 1]);
    exit(0);
}
