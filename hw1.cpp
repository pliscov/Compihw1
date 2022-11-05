#include "tokens.hpp"
#include <vector>
#include <string>
#include <iostream>

const char* convert_enum[29] = {
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
	std::vector<std::string> token;
	while ((token = yylex())) {
	  // Your code here
        printf("%d %s %s\n", yylineno,convert_enum[itoa(token[1])],yytext)
	}
    //this is for simple case of show token as seen in tutorial
    while ((token = yylex())) {
        // Your code here
        printf("%d %s %s\n", yylineno,convert_enum[itoa(token)],yytext)
    }
	return 0;
}
