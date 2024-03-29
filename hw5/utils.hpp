#ifndef _UTILS_HPP
#define _UTILS_HPP


#include <string>
#include <vector>
#include <iostream>
#include <cstdlib>
#include "hw3_output.hpp"
#include "types.hpp"

bool isValidByte(std::string val);
void checkByte(int val);
bool legalImplicitCast(std::string src_type, std::string dest_type);
bool legalExplicitCast(std::string src_type, std::string dest_type);
bool legalAssign(std::string src_type, std::string dest_type);
bool isBoolean(TYPEClass y);
void checkBoolean(TYPEClass y);
bool isNumeral(TYPEClass y);
void checkNumeral(TYPEClass y);
std::string largestType(std::string type1, std::string type2);
std::string getLargestType(std::string type1, std::string type2);
std::string initialize(std::string type);
std::string getSizeByType(std::string type);
std::string processRelop(std::string relop);
std::string fresh(std::string label);
void mergeContinueBreak(TYPEClass& dest, TYPEClass src1, TYPEClass src2);
void mergeContinueBreak(TYPEClass& dest, TYPEClass src);
void convertByteToInt(TYPEClass* t);
void convertBytesToInt(TYPEClass* x, TYPEClass* y);
void convertIntToByte(TYPEClass* t);
void convertIntToBool(TYPEClass* t);
void convertBoolToInt(TYPEClass* t);
void cast(TYPEClass* t, std::string type);
void truncZext(TYPEClass* t);
void checkByteOverflow(TYPEClass* t);
void implicitCast(TYPEClass* t, std::string type);
std::string fresh2(int num);






#endif // _UTILS_HPP