#ifndef _UTILS_HPP
#define _UTILS_HPP


#include <string>
#include <vector>
#include <iostream>
#include <cstdlib>
#include "hw3_output.hpp"
#include "types.hpp"

bool isValidByte(std::string val);
void checkByteAndValue(TYPEClass y);
bool legalImplicitCast(std::string src_type, std::string dest_type);
bool legalExplicitCast(std::string src_type, std::string dest_type);
bool legalAssign(std::string src_type, std::string dest_type);
bool isBoolean(TYPEClass y);
void checkBoolean(TYPEClass y);
bool isNumeral(TYPEClass y);
void checkNumeral(TYPEClass y);
std::string largestType(std::string type1, std::string type2);







#endif // _UTILS_HPP