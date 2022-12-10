%{
/* Declarations section */
#include <stdio.h>
#include <string>
#include "types.hpp"
#include "parser.tab.hpp"
#include "hw3_output.hpp"

%}


%option yylineno
%option noyywrap

add             (\+|\-)
mult            (\*|\/)
id              ([a-zA-Z][a-zA-Z0-9]*)
relop           (==|!=|<|>|<=|>=)
num             0|([1-9]+[0-9]*)
whitespace      [\t ]
newline         [\r\n]|(\r\n)

%%

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
{add}                       return ADD;
{mult}                      return MULT;
"and"                       return AND;
"not"                       return NOT;
"false"                     return FALSE;
"if"                        return IF;
"while"                     return WHILE;
{relop}                     return RELOP;
{id}                        { yylval.id = yytext; return ID;};
{num}                       return NUM;
\/\/[^\r\n]*(\r|\n|\r\n)?   {}
\"([^\n\r\"\\]|\\[rnt"\\])+\" return STRING;
{whitespace}                {}
{newline}                   {}
.                           {output::errorLex(yylineno); exit(1);}

%%
