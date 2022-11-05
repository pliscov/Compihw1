#include "tokens.hpp"
#include <vector>
#include <string>
#include <iostream>

const char* convert_enum[30] = {
        "dummy",
        "VOID",
        "INT",
        "BYTE",
        "B",
        "BOOL",
        "AND",
        "OR",
        "NOT",
        "TRUE",
        "FALSE",
        "RETURN",
        "IF",
        "ELSE",
        "WHILE",
        "BREAK",
        "CONTINUE",
        "SC",
        "COMMA",
        "LPAREN",
        "RPAREN",
        "LBRACE",
        "RBRACE",
        "ASSIGN",
        "RELOP",
        "BINOP",
        "COMMENT",
        "ID",
        "NUM",
        "STRING"
};



int main()
{
	int token;

    while ((token = yylex())) {
        printf("%d %s %s\n", yylineno,convert_enum[token],yytext);
    }
	return 0;
}
