#ifndef _UTILS_CPP
#define _UTILS_CPP

#include <string>
#include <vector>
#include <iostream>
#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>
#include "hw3_output.hpp"
#include "types.hpp"
#include <map>
#include "bp.hpp"
extern int yylineno;
extern char* yytext;
extern int yyleng;


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

std::string getLargestType(std::string type1, std::string type2){
    return (largestType(type1, type2) == "INT") ? "i32" : "i8";
}

std::string getSizeByType(std::string type){
    if (type == "INT")
        return "i32";
    else if (type == "BYTE")
        return "i8";
    else if (type == "BOOL")
        return "i1";
    else if (type == "VOID")
        return "void";
    else if (type == "STRING")
        return "i8*";
    return "<<BAD SIZE!!!>>";
}
std::string initialize(std::string type){
    if (type == "BOOL"){
        return std::string("false");
    }
    else if (type == "INT" || type == "BYTE"){
        return std::string(0);
    }
    else if (type == "VOID" || type == "STRING"){
        return "";
    }
    return "<THIS SHOULD NOT BE PRINTED>";
}

std::string processRelop(std::string relop){ //this could be WRONG
    if (relop == "==")
        return "eq";
    else if (relop == "!=")
        return "ne";
    else if (relop == ">")
        return "sgt";
    else if (relop == ">=")
        return "sge";
    else if (relop == "<")
        return "slt";
    else if (relop == "<=")
        return "sle";
    return(" <<matan tarif ha ktana me pluga BET>> ");
} 

std::string fresh(std::string label){
    static std::map<std::string, int> m = std::map<std::string, int>();
    if (m.find(label) == m.end())
        m[label] = 1;
    return std::string(label + std::to_string(m[label]++));

}

void mergeContinueBreak(TYPEClass& dest, TYPEClass src1, TYPEClass src2){
    dest.continuelist = CodeBuffer::merge(src1.continuelist, src2.continuelist);
    dest.breaklist = CodeBuffer::merge(src1.breaklist, src2.breaklist);
}

void mergeContinueBreak(TYPEClass& dest, TYPEClass src){
    dest.continuelist = src.continuelist;
    dest.breaklist = src.breaklist;
}

#endif //_UTILS_CPP
