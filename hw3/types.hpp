#include <iostream>
#include <string>
#include <vector>

class YYSTYPE {
    public:
        std::string value;
        std::string name;
        std::string type;
        int offset;
        YYSTYPE() = default;
        YYSTYPE(string name, string type):
         name(name), type(type){}
        YYSTYPE(string value, string name, string type):
         value(value), name(name), type(type){}
        YYSTYPE(string name, string type, int offset):
         name(name), type(type), offset(offset){}
        
};

class Func: public YYSTYPE{
    public:
        std::vector<YYSTYPE> params;
        std::string ret_type;

        Func(std::vector<YYSTYPE> params, std::string ret_type);
        bool legalRet(std::string ret_type);
        bool legalParams(std::vector<YYSTYPE> param_list);
};

class FormalsList{
    public:
        std::vector<YYSTYPE> list;
};

class ExpList{
public:
    std::vector<YYSTYPE> list;
};

class SymbolTable{
    public:
        std::vector<YYSTYPE> table;
        std::string ret_type;
        std::string scope_type;
        SymbolTable(std::string scope_type);
        SymbolTable(std::string scope_type, std::string ret_val);
        SymbolTable(SymbolTable& other);
        SymbolTable& operator=(SymbolTable& other);
        YYSTYPE* get(std::string symbol_name);
        void push(YYSTYPE symbol);


};

class TableManager{
    private:
        std::vector<SymbolTable> tables_stack;
        std::vector<int> offset_stack;
    public:
        TableManager(); //print and printi
        void insert(YYSTYPE& var);
        void insertID(YYSTYPE& var);
        void newScope(std::string scope_type);
        void popScope();
        bool contains(std::string symbol_name);
        bool inScope(std::string scope_type);
        bool legalReturn(std::string return_type);
        YYSTYPE* get(std::string symbol_name);
};





