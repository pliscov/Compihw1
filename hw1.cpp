#include "tokens.hpp"
#include <vector>
#include <string>
#include <iostream>
#include <string.h>

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



bool isEscape(char c) {
    return (c == '\\');
}
char makeEscape(char c){
    switch (c)
    {
        case 'n': return '\n';
        case 't': return '\t';
        case '0': return '\0';
        case 'r': return '\r';
        case '\\': return '\\';
        case '\"': return '\"';
        default:{
            printf("this is from cpp file and shouldn't happen\n");
            printf("Error undefined escape sequence %c\n", c);
            exit(0);
        }
    }
}

int makeHexaDigit(char c){ // converts a char [0-9a-fA-F] to its integer value between 0 and 16

    if (c >= '0' && c <= '9')
        return (int)(c - '0');
    if (c >= 'a' && c <= 'f')
        return (int)(c - 'a' + 10);
    return (int)(c - 'A' + 10);
}
char makeHexa(int index){ // makes a hexa number out of two hexa chars

    // index+2 and index+3 are the hexa digits
    return makeHexaDigit(yytext[index+2])*16 + makeHexaDigit(yytext[index+3]);
}

void handleEscape(int& i){ // one function to handle escapes, it isn't pretty and isn't complete either
    if (yytext[i+1] == 'x'){
        printf("%c", makeHexa(i));
        i += 2;
    }
    else if (isEscape(yytext[i+1]))
        printf("\\\\");
    else    
        printf("%c", makeEscape(yytext[i+1]));
    i++;
}


int main() {
	int token;
    while ((token = yylex())) {
        
        // Your code here

        if (token == (int)COMMENT)
            printf("%d COMMENT //\n", yylineno);

        else if (token == (int)STRING) {
            printf("%d STRING ", yylineno);
            for (int i = 0; i < yyleng; i++) {
                if (yytext[i] == '\"')
                    continue;
                if (isEscape(yytext[i]))
                    handleEscape(i);
                else
                    printf("%c", yytext[i]);
            }
            printf("\n");
        }

        else /* not string or a comment */
            printf("%d %s %s\n", yylineno,convert_enum[token],yytext);

    }
	return 0;
}
