#include <iostream>
#include <string>
#include <vector>

class YYSTYPE {
    public:
        std::vector<std::string> values;
        const string name;
        const string type;
        int offset;
        YYSTYPE() = default;
        YYSTYPE(string name, string type):
         name(name), type(type){}
        YYSTYPE(string values, string name, string type):
         values(values), name(name), type(type){}
        YYSTYPE(string name, string type, int offset):
         name(name), type(type), offset(offset){}

        
}

class Func: public YYSTYPE{
    public:
        std::vector<std::string> types;
        std::string ret_type;

        Func(std::vector<std::string> types, std::string ret_type);
        bool legalRet(std::string ret_type);
        bool legalParams(std::string param_list);
}

class FormalsList{
    public:
        std::vector<YYSTYPE> list;
}

class SymbolTable{
    private:
        std::vector<YYSTYPE> table;

    public:
        const std::string ret_val;
        const std::string scope_type;
        SymbolTable(std::string scope_type);
        SymbolTable(std::string scope_type, std::string ret_val);
        YYSTYPE* get(std::string symbol_name);
        void push();


}

// class TableStack{
//     private:
//         std::vector<SymbolTable> s;
//         void Maketable();
//     public:
//         void insert(YYSTYPE symbol);
//         void push(std::string scope_type);
//         void pop();
//         YYSTYPE get(std::string symbol_name);
//         SymbolTable top();


// }

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
        bool contains(std::string type);
        bool inScope(std::string scope_type);
        //bool legalReturn(std::string return_type)     instead of this i put a ret_type on a scope as an optional field -alon
        YYSTYPE* get(std::string symbol_name);
}


