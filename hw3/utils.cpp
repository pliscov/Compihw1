#include <string>
#include <vector>
#include <iostream>
#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>
#include "hw3_output.hpp"
#include "types.hpp"
#ifndef _UTILS_CPP
#define _UTILS_CPP
extern int yylineno;



bool isValidByte(int val)
{
    return val <= 255 && val >= 0;
}

void checkByte(int val)
{   
    if (!isValidByte(val))
    {
        output::errorByteTooLarge(yylineno, std::to_string(val));
        exit(1);
    }
}

bool legalImplicitCast(std::string src_type, std::string dest_type)
{
    return (src_type == "BYTE" && dest_type == "INT");
}

bool legalExplicitCast(std::string src_type, std::string dest_type)
{
    return false;
}
bool legalAssign(std::string src_type, std::string dest_type)
{
    return legalImplicitCast(src_type, dest_type) || (src_type == dest_type);
}
bool isBoolean(TYPEClass y)
{
    return y.type == "BOOL";
}

void checkBoolean(TYPEClass y)
{
    if (!isBoolean(y))
    {
        output::errorMismatch(yylineno);
        exit(1);
    }
}

bool isNumeral(TYPEClass y)
{
    return (y.type == "BYTE" || y.type == "INT");
}

void checkNumeral(TYPEClass y)
{
    if (!isNumeral(y))
    {
        output::errorMismatch(yylineno);
        exit(1);
    }
}

std::string largestType(std::string type1, std::string type2)
{
    return (type1 == "INT" || type2 == "INT") ? "INT" : "BYTE";
}

#endif //_UTILS_CPP