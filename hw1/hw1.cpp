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

bool isHexa(char c){
    return ('a' <= c  && c <= 'f')||('A' <= c && c <= 'F')||('0' <= c && c <= '9' );
}

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
        printf("\\");
    else    
        printf("%c", makeEscape(yytext[i+1]));
    i++;
}

void checkEscape(int& i){
    if (yytext[i+1] == 'x'){

        if (i + 3 == yyleng) { // \xD"
            printf("Error undefined escape sequence x\n");
            exit(0);
        }
        if (i + 4 == yyleng) { // \xD"
            printf("Error undefined escape sequence x%c\n", yytext[i+2]);
            exit(0);
        }

        if (i + 5 >= yyleng) 
        if ((!isHexa(yytext[i+2])) || !isHexa(yytext[i+3])){
            printf("Error undefined escape sequence x%c%c\n", yytext[i+2], yytext[i+3]);
            exit(0);
        }

        if (!isHexa(yytext[i+2]) || !isHexa(yytext[i+3])){
            printf("Error undefined escape sequence x%c%c\n", yytext[i+2], yytext[i+3]);
            exit(0);
        }
        char c = makeHexa(i);
        //if (c > 0x7e || (c < 0x20 && (c != '\n' && (c != '\r' && c != '\t')))){

        if ((int)c > 0x7F || (int)c < 0){
            printf("Error undefined escape sequence x%c%c\n", yytext[i+2], yytext[i+3]);
            exit(0);
        }
    }

}


int main() {
	int token;
    while ((token = yylex())) {
        
        // Your code here
        if (token == (int)COMMENT)
            printf("%d COMMENT //\n", yylineno);

        else if (token == (int)STRING) {
            for (int i = 0; i < yyleng; i++) {
                if (isEscape(yytext[i]) && isEscape(yytext[i+1]))
                    i++;
                else if (isEscape(yytext[i]))
                    checkEscape(i);
            }

            printf("%d STRING ", yylineno);

            for (int i = 0; i < yyleng; i++) {
                if (yytext[i] == '\"')
                    continue;
                if (i + 2 < yyleng && yytext[i] == '\\' && yytext[i+1] == '0'){
                    break;
                }

                if (i + 4 < yyleng && yytext[i] == '\\' && yytext[i+1] == 'x' && yytext[i+2] == '0' && yytext[i+3] == '0'){
                    break;
                }
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
