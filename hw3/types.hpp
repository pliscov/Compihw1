#include <iostream>
#include <string>
#include <vector>
#ifndef _TYPES_HPP
#define _TYPES_HPP


class TYPEClass {
    public:
        std::string value;
        std::string name;
        std::string type;
        int offset;
        TYPEClass() = default;
        TYPEClass(std::string name, std::string type):
         name(name), type(type){}
        TYPEClass(std::string value, std::string name, std::string type):
         value(value), name(name), type(type){}
        TYPEClass(std::string name, std::string type, int offset):
         name(name), type(type), offset(offset){}
        TYPEClass(const TYPEClass& other);
        virtual ~TYPEClass() = default;
        
};

class FuncClass: public TYPEClass{
    public:
        std::vector<TYPEClass> params;
        std::string ret_type;
        FuncClass() = default;
        FuncClass(std::vector<TYPEClass> params, std::string ret_type);
        bool legalRet(std::string ret_type);
        bool legalParams(std::vector<TYPEClass> param_list);
};

class FormalsListClass{
    public:
        std::vector<TYPEClass> list;
};

class ExpListClass{
public:
    std::vector<TYPEClass> list;
};

typedef class
{
    public:
	int byte;
        std::string id;
        std::string funcid;
        TYPEClass TYPE;
        FuncClass Func;
        FormalsListClass FormalsList;
        ExpListClass ExpList;
} STYPE;

#define YYSTYPE STYPE

class SymbolTable{
    public:
        std::vector<TYPEClass*> table;
        std::string ret_type;
        std::string scope_type;
        SymbolTable(std::string scope_type);
        SymbolTable(std::string scope_type, std::string ret_val);
        // SymbolTable(SymbolTable& other);
        // SymbolTable& operator=(SymbolTable& other);
        TYPEClass* get(std::string symbol_name);


};

class TableManager{
    public:
        std::vector<SymbolTable> tables_stack;
        std::vector<int> offset_stack;
    // public:
        TableManager(); //print and printi
        void insert(TYPEClass* var);
        void insertID(TYPEClass* var);
        void newScope(std::string scope_type);
        void newScope(std::string scope_type, std::string ret_type);
        void popScope();
        void checkMain();
        bool contains(std::string symbol_name);
        bool inScope(std::string scope_type);
        bool legalReturn(std::string return_type);
        void insertParams(std::vector<TYPEClass> params);
        TYPEClass* get(std::string symbol_name);
};

#endif



