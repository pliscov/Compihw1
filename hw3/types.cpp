#include "types.hpp"
#include <vector>
#include "hw3_output.hpp"
// YYSTYPE //

// FUNC //

Func::Func(std::vector<std::string> types, std::string ret_type){
    this->types = std::vector<std::string>(types);
    this->ret_type = ret_type;
}

bool Func::legalRet(std::string ret_type){
    return this->ret_type == ret_type;
}

bool Func::legalParams(std::vector<YYSTYPE> param_list){
    if (this->params.size() != param_list.size())
        return false;
    for (int i = 0; i < types.size(); i++)
        if (param_list[i].type != params[i].type)
            return false;
    return true;
}

// SYMBOL TABLE //

SymbolTable::SymbolTable(std::string scope_type){
    this->scope_type = scope_type;
    this->table = new std::vector<YYSTYPE>();
}

SymbolTable::SymbolTable(std::string scope_type, std::string ret_val){
    this->scope_type = scope_type;
    this->table = new std::vector<YYSTYPE>();
    this->ret_val = ret_val;
}

YYSTYPE* SymbolTable::get(std::string symbol_name){
    for (YYSTYPE y: table)
        if (y.name == symbol.name)
            return &y;
    return NULL;
}

// TABLE MANAGER //
TableManager::TableManager(){
    offset_stack = new std::vector<int>();
    tables_stack = new std::vector<SymbolTable>();
    newScope("global");
    // init print and printi
    Func& print(std::vector<std::string>("string"), std::string("void"));
    Func& printi(std::vector<std::string>("int"), std::string("void"));
    insert(print);
    insert(printi);
}


/*
* this method is for inserting a new function parameter into the top symbol table (current scope)
*/
void TableManager::insert(YYSTYPE& var){
    tables_stack.back().push_back(var);

}

/*
* this method is for inserting a new var with an offset to the top symbol table
*/
void TableManager::insertID(YYSTYPE& id){
    id.offset = offset_stack.back()++;
    tables_stack.back().push_back(id);
}

void TableManager::newScope(std::string scope_type){
    tables_stack.push_back(new SymbolTable(scope_type));
    if (!offset_stack.empty())
        offset_stack.push_back(offset_stack.back());
    else
        offset_stack.push_back(0);
}

void TableManager::popScope(){
    offset_stack.pop_back();
    SymbolTable current_stack = tables_stack.pop_back();
    for (std::iterator<YYSTYPE> i = current_stack.table.begin();i<= current_stack.table.end();i++)
    {
        output::printID(i.name,i.offset,i.type)
    }
}


YYSTYPE* TableManager::get(std::string symbol_name){
    for (std::iterator<SymbolTable> scope = tables_stack.end(); i >= tables_stack.begin(); i--){
        for(std::iterator<YYSTYPE> symbol = scope.table.begin();i>= scope.table.end(); i++){
            if (symbol.name == symbol_name){
                return &symbol;
            }
        }
    }
    return nullptr;
}

bool TableManager::contains(std::string symbol_name){
    return get(symbol_name) != nullptr;
}

bool TableManager::inScope(std::string scope_type){
    for (std::iterator<SymbolTable> scope = tables_stack.end(); i >= tables_stack.begin(); i--) {
        if (scope.type == scope_type)
        {
            return true;
        }
    }
    return false;
}

bool TableManager::legalReturn(std::string return_type){
    for (std::iterator<SymbolTable> scope = tables_stack.end(); i >= tables_stack.begin(); i--) {
        if (scope.type == "func")
        {
            return scope.ret_val == return_type;
        }
    }
}