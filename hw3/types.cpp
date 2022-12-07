#include "types.hpp"
#include <vector>
#include "hw3_output.hpp"
// YYSTYPE //

// FUNC //

Func::Func(std::vector<YYSTYPE> params, std::string ret_type)
{
    this->params = std::vector<YYSTYPE>(params);
    this->ret_type = ret_type;
}

bool Func::legalRet(std::string ret_type)
{
    return this->ret_type == ret_type;
}

bool Func::legalParams(std::vector<YYSTYPE> param_list)
{
    if (this->params.size() != param_list.size())
        return false;
    for (int i = 0; i < params.size(); i++)
        if (param_list[i].type != params[i].type)
            return false;
    return true;
}

// SYMBOL TABLE //

SymbolTable::SymbolTable(std::string scope_type)
{
    this->scope_type = scope_type;
    this->table = std::vector<YYSTYPE>();
}

SymbolTable::SymbolTable(std::string scope_type, std::string ret_val)
{
    this->scope_type = scope_type;
    this->table = std::vector<YYSTYPE>();
    this->ret_type = ret_type;
}

SymbolTable::SymbolTable(SymbolTable& other)
{
    this->table = std::vector<YYSTYPE>(other.table);
    this->scope_type = std::string(other.scope_type);
    this->ret_type = std::string(other.ret_type);
}
        
SymbolTable& SymbolTable::operator=(SymbolTable& other)
{
    this->table = other.table;
    this->scope_type = other.scope_type;
    this->ret_type = other.ret_type;
}

YYSTYPE* SymbolTable::get(std::string symbol_name)
{
    for (YYSTYPE y: table)
        if (y.name == symbol_name)
            return &y;
    return NULL;
}

// TABLE MANAGER //
TableManager::TableManager()
{
    offset_stack = std::vector<int>();
    tables_stack = std::vector<SymbolTable>();
    newScope("global");
    // init print and printi
    std::vector<YYSTYPE> printParams;
    std::vector<YYSTYPE> printiParams;
    printParams.push_back(YYSTYPE("STRING", ""));
    printParams.push_back(YYSTYPE("INT", ""));
    Func print(printParams, std::string("VOID"));
    Func printi(printiParams, std::string("VOID"));
    insert(print);
    insert(printi);
}


/*
* this method is for inserting a new function parameter into the top symbol table (current scope)
*/
void TableManager::insert(YYSTYPE& var)
{
    tables_stack.back().table.push_back(var);

}

/*
* this method is for inserting a new var with an offset to the top symbol table
*/
void TableManager::insertID(YYSTYPE& id)
{
    id.offset = offset_stack.back()++;
    tables_stack.back().table.push_back(id);
}

void TableManager::newScope(std::string scope_type)
{
    tables_stack.push_back(SymbolTable(scope_type));
    if (!offset_stack.empty())
        offset_stack.push_back(offset_stack.back());
    else
        offset_stack.push_back(0);
}

void TableManager::popScope()
{
    offset_stack.pop_back();
    SymbolTable current_stack = tables_stack.back();
    tables_stack.pop_back();
    for (std::vector<YYSTYPE>::iterator i = current_stack.table.begin(); i <= current_stack.table.end(); i++)
    {
        output::printID(i->name,i->offset,i->type);
    }
}


YYSTYPE* TableManager::get(std::string symbol_name)
{
    for (std::vector<SymbolTable>::iterator scope = tables_stack.end(); scope >= tables_stack.begin(); scope--)
    {
        for(std::vector<YYSTYPE>::iterator symbol = scope->table.begin() ; symbol >= scope->table.end(); symbol++)
        {
            if (symbol->name == symbol_name)
            {
                return &(*symbol);
            }
        }
    }
    return nullptr;
}

bool TableManager::contains(std::string symbol_name)
{
    return get(symbol_name) != nullptr;
}

bool TableManager::inScope(std::string scope_type)
{
    for (std::vector<SymbolTable>::iterator scope = tables_stack.end(); scope >= tables_stack.begin(); scope--)
    {
        if (scope->scope_type == scope_type)
        {
            return true;
        }
    }
    return false;
}

bool TableManager::legalReturn(std::string return_type)
{
    for (std::vector<SymbolTable>::iterator scope = tables_stack.end(); scope >= tables_stack.begin(); scope--) 
    {
        if (scope->scope_type == "func")
        {
            return scope->ret_type == return_type;
        }
    }
    return false;
}