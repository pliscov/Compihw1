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
binop           (+|-|*|\/)
id              ([a-zA-z][a-zA-z0-9]*)
            
string          ([\x20\x21\x23-\x7E]|\\\\|\\"|\\n|\\r|\\t|\\0|\\x[0-9A-Fa-f][0-9A-Fa-f])*
relop           (==|!=|<|>|<=|>=)
newline         \n|\r|\r\n
comment         \/\/[^(\n)]*
num             [1-9]+[0-9]*
whitespace      [\t\x20\r\n]
unprintable     ^([\x20-\x7E]|[\t\r\n])
illegal_escape  \\^([nrt0\\])|(x..)

%x STR

%%
comment                     return COMMENT;    
\"                          BEGIN(STR);
<STR>string                 {}
<STR>newline                throwError(2);
<STR>illegal_escape         throwError(3);
<STR>string\"               {
                                BEGIN(INITIAL);
                                return STRING;
                            }
<STR>unprintable            throwError(1);
unprintable                 throwError(1);
(void)                      return VOID;
(int)                       return INT;
(b)                         return B;
(byte)                      return BYTE;
(bool)                      return BOOL;
(or)                        return OR;
(true)                      return TRUE;
(return)                    return RETURN;
(else)                      return ELSE;
(break)                     return BREAK;
(continue)                  return CONTINUE;
(;)                         return SC;
(,)                         return COMMA;
(\()                        return RPAREN;
(\))                        return LPAREN;
(\{)                        return LBRACE;
(\})                        return RBRACE;
(=)                         return ASSIGN;
binop                       return BINOP;
(and)                       return AND;
(not)                       return NOT;
(false)                     return FALSE;
(if)                        return IF;
(while)                     return WHILE;
relop                       return RELOP;
id                          return ID;
num                         return NUM;
string                      return STRING;
whitespace                  ;
newline                     yylineno++;
%%


void throwError(int num){
    if (num == 1)
        printf("Error %c\n", yytext);
    else if (num == 2)
        printf("Error unclosed string\n");
    else if (num == 3)
        printf("Error undefined escape sequence %s\n", yytext);
    exit(0);
}
