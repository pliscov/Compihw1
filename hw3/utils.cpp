#include <string>
#include <vector>
#include <iostream>
#include <cstdlib>
#include "hw3_output.hpp"
#include "types.hpp"

extern int yylineno;

bool legalImplicitCast(std::string src_type, std::string dest_type)
{
    return (src_type == "INT" && dest_type == "BYTE");
}

bool isValidByte(std::string val)
{
    return (stoi(val) <= 255 && stoi(val) >= 0);
}

void checkByteAndValue(YYSTYPE y)
{   
    if (y.type == "BYTE" && !isValidByte(y.value))
    {
        output::errorByteTooLarge(yylineno, y.value);
        exit(1);
    }
}

bool legalExplicitCast(std::string src_type, std::string dest_type)
{
    return false;
}

bool isBoolean(YYSTYPE y)
{
    return y.type == "BOOL";
}

void checkBoolean(YYSTYPE y)
{
    if (!isBoolean(y))
    {
        output::errorMismatch(yylineno);
        exit(1);
    }
}

bool isNumeral(YYSTYPE y)
{
    return (y.type == "BYTE" || y.type == "INT");
}

void checkNumeral(YYSTYPE y)
{
    if (y.type != "BYTE" && y.type != "INT")
    {
        output::errorMismatch(yylineno);
        exit(1);
    }
}

std::string largestType(std::string type1, std::string type2)
{
    return (type1 == "INT" || type2 == "INT") ? "INT" : "BYTE";
}