#include "types.hpp"
#include <vector>
#include "hw3_output.hpp"
#include "utils.hpp"
// TYPEClass //
TYPEClass::TYPEClass(const TYPEClass& other)
{
    this->name = std::string(other.name);
    this->type = std::string(other.type);
    this->offset = other.offset;
}
// FUNC //

FuncClass::FuncClass(std::vector<TYPEClass> params, std::string ret_type)
{
    this->params = std::vector<TYPEClass>(params);
    this->ret_type = std::string(ret_type);
}

bool FuncClass::legalRet(std::string ret_type)
{
    return this->ret_type == ret_type;
}

bool FuncClass::legalParams(std::vector<TYPEClass> param_list)
{
    if (this->params.size() != param_list.size())
        return false;
    for (int i = 0; i < params.size(); i++)
        if (!legalAssign(param_list[i].type,params[i].type))
            return false;
    return true;
}

// SYMBOL TABLE //

SymbolTable::SymbolTable(std::string scope_type)
{
    this->scope_type = scope_type;
    this->table = std::vector<TYPEClass*>();
}

SymbolTable::SymbolTable(std::string scope_type, std::string ret_type)
{
    this->scope_type = scope_type;
    this->table = std::vector<TYPEClass*>();
    this->ret_type = ret_type;
}

// SymbolTable::SymbolTable(SymbolTable& other)
// {
//     this->table = std::vector<TYPEClass>(other.table);
//     this->scope_type = std::string(other.scope_type);
//     this->ret_type = std::string(other.ret_type);
// }
        
// SymbolTable& SymbolTable::operator=(SymbolTable& other)
// {
//     this->table = other.table;
//     this->scope_type = other.scope_type;
//     this->ret_type = other.ret_type;
// }

TYPEClass* SymbolTable::get(std::string symbol_name)
{
    for (std::vector<TYPEClass*>::iterator y = table.begin(); y < table.end(); y++)
        if ((*y)->name == symbol_name)
            return (*y);
    return NULL;
}

// TABLE MANAGER //
TableManager::TableManager()
{
    offset_stack = std::vector<int>();
    tables_stack = std::vector<SymbolTable>();
    newScope("global");
    // init print and printi
    std::vector<TYPEClass> printParams;
    std::vector<TYPEClass> printiParams;
    std::string type = "VOID";
    printParams.push_back(TYPEClass("STRING", "STRING"));
    printiParams.push_back(TYPEClass("INT", "INT"));
    FuncClass* print = new FuncClass(printParams, type);
    print->name = "print";
    FuncClass* printi = new FuncClass(printiParams, type);
    printi->name = "printi";
    insert(print);
    insert(printi);
}

void TableManager::insertParams(std::vector<TYPEClass> params)
{
    int offset = -1;
    for (std::vector<TYPEClass>::iterator y = params.begin(); y < params.end(); y++)
    {
        (*y).offset = offset--;
        tables_stack.back().table.push_back(new TYPEClass(*y));
    }
}
/*
* this method is for inserting a new function parameter into the top symbol table (current scope)
*/
void TableManager::insert(TYPEClass* var)
{
    tables_stack.back().table.push_back(var);
}

/*
* this method is for inserting a new var with an offset to the top symbol table
*/
void TableManager::insertID(TYPEClass* id)
{
    id->offset = offset_stack.back()++;
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

void TableManager::newScope(std::string scope_type, std::string ret_type)
{
    tables_stack.push_back(SymbolTable(scope_type, ret_type));
    if (!offset_stack.empty())
        offset_stack.push_back(offset_stack.back());
    else
        offset_stack.push_back(0);

}

void TableManager::popScope()
{
    offset_stack.pop_back();
    SymbolTable current_stack = tables_stack.back();
    for (std::vector<TYPEClass*>::iterator ip = current_stack.table.begin(); ip < current_stack.table.end(); ip++)
    {
        TYPEClass* i = *ip;
        FuncClass* func = dynamic_cast<FuncClass*>(*ip);
        if (func != nullptr)
        {
            std::vector<std::string> types;
            for (TYPEClass y: func->params)
            {
                types.push_back(y.type);
            }
            i->type = output::makeFunctionType(func->ret_type, types);
        }
        output::printID(i->name,i->offset,i->type);
    }
    tables_stack.pop_back();
}


TYPEClass* TableManager::get(std::string symbol_name)
{
    for (std::vector<SymbolTable>::iterator scope = tables_stack.end() - 1; scope >= tables_stack.begin(); scope--)
    {
        for(std::vector<TYPEClass*>::iterator symbolp = scope->table.begin() ; symbolp < scope->table.end(); symbolp++)
        {
            TYPEClass* symbol = *symbolp;
            if (symbol->name == symbol_name)
            {
                return symbol;
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
    for (std::vector<SymbolTable>::iterator scope = tables_stack.end() - 1; scope >= tables_stack.begin(); scope--)
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
    for (std::vector<SymbolTable>::iterator scope = tables_stack.end() - 1; scope >= tables_stack.begin(); scope--) 
    {
        if (scope->scope_type == "func")
        {
            return scope->ret_type == return_type;
        }
    }
    return false;
}