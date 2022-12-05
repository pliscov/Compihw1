#include <iostream>
#include <string>
#include <vector>

class YYSTYPE {
    protected:
        const string value;
        const string name;
        const string type;
        int offset;
        
    public:
        std::string get_ret_val();
        YYSTYPE(string value, string name, string type):
         value(value), name(name), type(type){}
        
}

class NUM : public YYSTYPE{}

class Func: public YYSTYPE{
    private:
        std::vector<std::string> params;
        std::string ret_val;

    public:
        std::vector<std::string> getParams();
        bool legalRet(std::string ret_type);
}

class SymbolTable{
    private:
        std::vector<YYSTYPE> table;
        std::string scope_type;

    public:
        YYSTYPE get(std::string symbol_name);
        void push();


}

class TableStack{
    private:
        std::vector<SymbolTable> s;
        void Maketable();
    public:
        void insert(YYSTYPE symbol);
        void push(std::string scope_type);
        void pop();
        YYSTYPE get(std::string symbol_name);
        SymbolTable top();


}

class TableManager{
    private:
        TableStack table_stack;
        std::vector<int> offset_stack;
    public:
        TableManager(); //print and printi
        void insert();
        void newScope(std::string scope_type);
        void popScope();
        bool contains(std::string type);
        bool inScope(std::string scope_type);
        bool legalReturn(std::string return_type)
        YYSTYPE get(std::string symbol_name);
}




