#include "types.hpp"
#include <vector>
#include "hw3_output.hpp"
#include "utils.hpp"

extern int yylineno;

// TYPEClass //
TYPEClass::TYPEClass(const TYPEClass& other)
{
    this->name = std::string(other.name);
    this->type = std::string(other.type);
    this->reg = std::string(other.reg);
    this->ptr = std::string(other.ptr);
    this->offset = other.offset;
    this->truelist = other.truelist;
    this->falselist = other.falselist;
    this->continuelist = other.continuelist;
    this->breaklist = other.breaklist;
    this->hooklist = other.hooklist;
    this->hooklabel = other.hooklabel;
    this->isParam = other.isParam;
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

bool FuncClass::legalParams(std::vector<TYPEClass> arg_list)
{
    if (this->params.size() != arg_list.size())
        return false;
    for (int i = 0; i < params.size(); i++)
    {
        if (!legalAssign(arg_list[i].type,params[i].type))
        {
            return false;
        }
    }
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

void ExpListClass::convertParams(std::vector<TYPEClass> formals_list){
    CodeBuffer& buffer = CodeBuffer::instance();
    for (int i = 0; i < formals_list.size(); i++){
        if (list[i].type == "BYTE" && formals_list[i].type == "INT"){
            std::string temp = list[i].reg;
            list[i].reg = fresh("%t");
            buffer.emit(list[i].reg + " = zext i8 " + temp + " to i32");
            list[i].type = "INT";
        }
    }
}

std::string ExpListClass::getParams(){
    std::string res = "";
    std::string type;
    CodeBuffer& buffer = CodeBuffer::instance();
    for (int i = 0; i < list.size(); i++){
        type = getSizeByType(list[i].type);// == "i8" ? "i32" : getSizeByType(list[i].type);
        res += type + " " + list[i].reg + ((i < list.size() - 1) ? ", " : ""); 
        if (/*i >= 1 && */i < list.size() - 1 && list[i].type == "BOOL"){
            buffer.bpatch(list[i].truelist , list[i+1].hooklabel);
            buffer.bpatch(list[i].falselist , list[i+1].hooklabel);
        }
        if (i >= 1 && i < list.size() - 1){
            buffer.bpatch(list[i].hooklist, list[i+1].hooklabel);
        }
    }
    return res;
}



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

void TableManager::insertParams(std::vector<TYPEClass> params, bool isParam)
{
    int offset = -1;
    for (std::vector<TYPEClass>::iterator y = params.begin(); y < params.end(); y++)
    {
        if (contains(y->name))
        {
            output::errorDef(yylineno, y->name);
            exit(1);
        }
        y->offset = offset--;
        y->isParam = isParam;
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
void TableManager::checkMain()
{
    bool found_valid_main = false;
    SymbolTable current_stack = tables_stack.back();
    for (std::vector<TYPEClass*>::iterator ip = current_stack.table.begin(); ip < current_stack.table.end(); ip++)
    {
        TYPEClass* i = *ip;
        FuncClass* func = dynamic_cast<FuncClass*>(*ip);
        if (func != nullptr)
        {
            if (func->name == "main" && (func->params.size() == 0 && func->type == "VOID"))
                found_valid_main = true;
        }
    }
    if (!found_valid_main)
    {
        output::errorMainMissing();
        exit(1);
    }
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
        //output::printID(i->name,i->offset,i->type);
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
            return legalAssign(return_type, scope->ret_type);
        }
    }
    return false;
}

std::string TableManager::getReturnType()
{
    for (std::vector<SymbolTable>::iterator scope = tables_stack.end() - 1; scope >= tables_stack.begin(); scope--) 
    {
        if (scope->scope_type == "func")
        {
            return scope->ret_type;
        }
    }
    cout << "BAD GET RETURN TYPEEEEEE" << endl;
    return "BAD";

}