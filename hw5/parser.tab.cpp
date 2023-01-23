/* A Bison parser, made by GNU Bison 3.7.6.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30706

/* Bison version string.  */
#define YYBISON_VERSION "3.7.6"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "parser.ypp"

	#include <iostream>
	#include <cstdlib>
	#include <memory>
	#include "bp.hpp"
	#include "hw3_output.hpp"
	#include "types.hpp"
	#include "utils.hpp"
	#include <fstream>
	#include <sstream>

	TableManager manager;
	CodeBuffer& buffer = CodeBuffer::instance();
	bool inPrintArgs = false;
	extern int yylex();
	extern int yylineno;
	extern int yyleng;
	extern char* yytext;
	int freshNum = 0;
	int yyerror(const char * message);
	void zext(TYPEClass* exp1, TYPEClass* exp2)
	{
		if (exp1->type != exp2->type)
		{
			TYPEClass* e = exp1->type == "BYTE" ? exp1 : exp2;
			std::string temp = e->reg;
			e->reg = fresh("%t");
			buffer.emit(e->reg + " = zext i8 " + temp + " to i32");
		}
	}

	

	void hook(TYPEClass* exp, std::string prompt){
		exp->hooklabel = fresh(prompt);
		exp->hooklist.push_back(std::pair<int, BranchLabelIndex>(buffer.emit("br label @"), FIRST));
		buffer.emit(exp->hooklabel + ":");
	}

	void hook(TYPEClass* exp){
		hook(exp, "exp");
	}

	void bphook(TYPEClass* exp){
		buffer.bpatch(exp->hooklist, exp->hooklabel);
	}



#line 121 "parser.tab.cpp"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "parser.tab.hpp"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_IF = 3,                         /* IF  */
  YYSYMBOL_ELSE = 4,                       /* ELSE  */
  YYSYMBOL_VOID = 5,                       /* VOID  */
  YYSYMBOL_INT = 6,                        /* INT  */
  YYSYMBOL_BYTE = 7,                       /* BYTE  */
  YYSYMBOL_B = 8,                          /* B  */
  YYSYMBOL_BOOL = 9,                       /* BOOL  */
  YYSYMBOL_TRUE = 10,                      /* TRUE  */
  YYSYMBOL_FALSE = 11,                     /* FALSE  */
  YYSYMBOL_RETURN = 12,                    /* RETURN  */
  YYSYMBOL_WHILE = 13,                     /* WHILE  */
  YYSYMBOL_BREAK = 14,                     /* BREAK  */
  YYSYMBOL_CONTINUE = 15,                  /* CONTINUE  */
  YYSYMBOL_SC = 16,                        /* SC  */
  YYSYMBOL_COMMA = 17,                     /* COMMA  */
  YYSYMBOL_ASSIGN = 18,                    /* ASSIGN  */
  YYSYMBOL_RELOP = 19,                     /* RELOP  */
  YYSYMBOL_ID = 20,                        /* ID  */
  YYSYMBOL_NUM = 21,                       /* NUM  */
  YYSYMBOL_STRING = 22,                    /* STRING  */
  YYSYMBOL_OR = 23,                        /* OR  */
  YYSYMBOL_AND = 24,                       /* AND  */
  YYSYMBOL_ADD = 25,                       /* ADD  */
  YYSYMBOL_SUB = 26,                       /* SUB  */
  YYSYMBOL_MULT = 27,                      /* MULT  */
  YYSYMBOL_DIV = 28,                       /* DIV  */
  YYSYMBOL_NOT = 29,                       /* NOT  */
  YYSYMBOL_LBRACE = 30,                    /* LBRACE  */
  YYSYMBOL_RBRACE = 31,                    /* RBRACE  */
  YYSYMBOL_LPAREN = 32,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 33,                    /* RPAREN  */
  YYSYMBOL_YYACCEPT = 34,                  /* $accept  */
  YYSYMBOL_Program = 35,                   /* Program  */
  YYSYMBOL_Funcs = 36,                     /* Funcs  */
  YYSYMBOL_FuncsDecl = 37,                 /* FuncsDecl  */
  YYSYMBOL_38_1 = 38,                      /* $@1  */
  YYSYMBOL_RetType = 39,                   /* RetType  */
  YYSYMBOL_Formals = 40,                   /* Formals  */
  YYSYMBOL_FormalsList = 41,               /* FormalsList  */
  YYSYMBOL_FormalDecl = 42,                /* FormalDecl  */
  YYSYMBOL_NEWSCOPE = 43,                  /* NEWSCOPE  */
  YYSYMBOL_ENDSCOPE = 44,                  /* ENDSCOPE  */
  YYSYMBOL_BoolExp = 45,                   /* BoolExp  */
  YYSYMBOL_Statements = 46,                /* Statements  */
  YYSYMBOL_TRUELABEL = 47,                 /* TRUELABEL  */
  YYSYMBOL_FALSELABEL = 48,                /* FALSELABEL  */
  YYSYMBOL_GOTO = 49,                      /* GOTO  */
  YYSYMBOL_Statement = 50,                 /* Statement  */
  YYSYMBOL_51_2 = 51,                      /* $@2  */
  YYSYMBOL_52_3 = 52,                      /* $@3  */
  YYSYMBOL_53_4 = 53,                      /* $@4  */
  YYSYMBOL_54_5 = 54,                      /* $@5  */
  YYSYMBOL_55_6 = 55,                      /* $@6  */
  YYSYMBOL_Call = 56,                      /* Call  */
  YYSYMBOL_57_7 = 57,                      /* $@7  */
  YYSYMBOL_FuncID = 58,                    /* FuncID  */
  YYSYMBOL_ExpList = 59,                   /* ExpList  */
  YYSYMBOL_Type = 60,                      /* Type  */
  YYSYMBOL_Exp = 61                        /* Exp  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_int8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

#if defined __GNUC__ && ! defined __ICC && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                            \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  10
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   257

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  34
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  28
/* YYNRULES -- Number of rules.  */
#define YYNRULES  65
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  121

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   288


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    88,    88,    90,    91,    94,    93,   134,   135,   137,
     138,   143,   144,   146,   157,   158,   159,   163,   169,   180,
     181,   182,   183,   183,   192,   212,   212,   271,   271,   343,
     345,   357,   368,   385,   385,   410,   410,   433,   444,   455,
     455,   492,   519,   520,   525,   531,   532,   533,   536,   540,
     612,   625,   638,   665,   677,   718,   725,   730,   736,   752,
     767,   779,   789,   807,   823,   850
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "IF", "ELSE", "VOID",
  "INT", "BYTE", "B", "BOOL", "TRUE", "FALSE", "RETURN", "WHILE", "BREAK",
  "CONTINUE", "SC", "COMMA", "ASSIGN", "RELOP", "ID", "NUM", "STRING",
  "OR", "AND", "ADD", "SUB", "MULT", "DIV", "NOT", "LBRACE", "RBRACE",
  "LPAREN", "RPAREN", "$accept", "Program", "Funcs", "FuncsDecl", "$@1",
  "RetType", "Formals", "FormalsList", "FormalDecl", "NEWSCOPE",
  "ENDSCOPE", "BoolExp", "Statements", "TRUELABEL", "FALSELABEL", "GOTO",
  "Statement", "$@2", "$@3", "$@4", "$@5", "$@6", "Call", "$@7", "FuncID",
  "ExpList", "Type", "Exp", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_int16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288
};
#endif

#define YYPACT_NINF (-26)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-43)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      59,   -26,   -26,   -26,   -26,     2,   -26,    59,   -14,   -26,
     -26,   -26,   -26,    -6,    15,   -26,   -26,     1,     7,     5,
      15,   -26,    10,   -26,   127,     4,   221,    18,    19,    39,
      31,   -26,    87,   -26,    53,    38,    52,   225,   -26,   -26,
     -26,    31,    65,   -26,   225,   139,   -26,   150,   225,   -26,
     -26,    57,   127,   -26,   -26,   -26,    43,    61,    46,   202,
     -26,   -26,    47,     6,    50,   -26,   225,   225,   225,   225,
     225,   225,   225,    54,   225,   107,   -26,   225,   -26,    67,
     -26,   225,   -26,   -26,    98,   -12,    78,   -23,   -23,   -26,
     -26,   -26,   164,   -26,    55,   176,   225,   -26,   -26,   225,
     -26,   -26,   -26,   225,   191,   127,    34,   127,   -26,   -26,
     -26,    88,   -26,   104,   225,   -26,   202,   -26,   -26,   127,
     -26
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       3,     8,    45,    46,    47,     0,     2,     3,     0,     7,
       1,     4,    42,     0,     9,     5,    10,    11,     0,     0,
       0,    13,     0,    12,     0,     0,     0,     0,     0,     0,
      27,    22,     0,    17,     0,     0,     0,     0,    59,    60,
      30,    54,    56,    58,     0,     0,    55,     0,     0,    37,
      38,     0,     0,     6,    18,    29,    39,    25,     0,    16,
      57,    61,     0,     0,     0,    31,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    41,     0,    24,     0,
      19,     0,    48,    21,    64,    63,    62,    50,    51,    53,
      52,    35,     0,    23,     0,    43,     0,    14,    65,     0,
      19,    28,    40,     0,     0,     0,     0,     0,    44,    26,
      15,     0,    36,    32,     0,    21,    49,    33,    20,     0,
      34
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -26,   -26,    84,   -26,   -26,   -26,   -26,    89,   -26,   -26,
     -26,    63,    60,    28,   -26,     0,   -21,   -26,   -26,   -26,
     -26,   -26,   -24,   -26,   121,    29,     3,   -25
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,     5,     6,     7,    19,     8,    15,    16,    17,   105,
     113,    58,    32,    97,   119,    99,    33,    52,    79,    51,
     118,   100,    46,    77,    35,    94,    36,    59
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int8 yytable[] =
{
      34,    47,    10,     9,    71,    72,    12,    66,    34,    64,
       9,    54,    68,    69,    70,    71,    72,    18,    20,    61,
      63,     2,     3,    18,     4,    66,    14,    21,    34,    67,
      68,    69,    70,    71,    72,    49,    37,    64,    22,    82,
      24,    84,    85,    86,    87,    88,    89,    90,    62,    92,
      48,    34,    95,    66,    54,    50,    98,    67,    68,    69,
      70,    71,    72,   -42,     1,     2,     3,   111,     4,    55,
      56,   104,    57,    60,   106,    74,    76,    78,    95,    80,
      81,    34,    83,    34,   110,    96,   112,    91,   102,   116,
      25,    11,   114,     2,     3,    34,     4,    66,   120,    26,
      27,    28,    29,    69,    70,    71,    72,    30,   115,    23,
      25,    73,    75,     2,     3,   117,     4,    31,    53,    26,
      27,    28,    29,    69,    70,    71,    72,    30,   107,    13,
      25,     0,   108,     2,     3,     0,     4,    31,    93,    26,
      27,    28,    29,     0,     0,     2,     3,    30,     4,    38,
      39,     0,     0,    64,     0,     0,     0,    31,     0,    41,
      42,    43,     0,     0,     0,     0,    65,    64,    44,    66,
       0,    45,     0,    67,    68,    69,    70,    71,    72,    64,
     101,     0,     0,    66,     0,     0,     0,    67,    68,    69,
      70,    71,    72,   103,    64,    66,     0,     0,     0,    67,
      68,    69,    70,    71,    72,    64,     0,   109,     0,     0,
      66,     0,     0,     0,    67,    68,    69,    70,    71,    72,
       0,    66,     0,     0,     0,    67,    68,    69,    70,    71,
      72,    38,    39,     0,     0,    38,    39,    40,     0,     0,
       0,    41,    42,    43,     0,    41,    42,    43,     0,     0,
      44,     0,     0,    45,    44,     0,     0,    45
};

static const yytype_int8 yycheck[] =
{
      24,    26,     0,     0,    27,    28,    20,    19,    32,     3,
       7,    32,    24,    25,    26,    27,    28,    14,    17,    44,
      45,     6,     7,    20,     9,    19,    32,    20,    52,    23,
      24,    25,    26,    27,    28,    16,    32,     3,    33,    33,
      30,    66,    67,    68,    69,    70,    71,    72,    45,    74,
      32,    75,    77,    19,    75,    16,    81,    23,    24,    25,
      26,    27,    28,    32,     5,     6,     7,    33,     9,    16,
      32,    96,    20,     8,    99,    18,    33,    16,   103,    33,
      33,   105,    32,   107,   105,    18,   107,    33,    33,   114,
       3,     7,     4,     6,     7,   119,     9,    19,   119,    12,
      13,    14,    15,    25,    26,    27,    28,    20,     4,    20,
       3,    48,    52,     6,     7,   115,     9,    30,    31,    12,
      13,    14,    15,    25,    26,    27,    28,    20,   100,     8,
       3,    -1,   103,     6,     7,    -1,     9,    30,    31,    12,
      13,    14,    15,    -1,    -1,     6,     7,    20,     9,    10,
      11,    -1,    -1,     3,    -1,    -1,    -1,    30,    -1,    20,
      21,    22,    -1,    -1,    -1,    -1,    16,     3,    29,    19,
      -1,    32,    -1,    23,    24,    25,    26,    27,    28,     3,
      16,    -1,    -1,    19,    -1,    -1,    -1,    23,    24,    25,
      26,    27,    28,    17,     3,    19,    -1,    -1,    -1,    23,
      24,    25,    26,    27,    28,     3,    -1,    16,    -1,    -1,
      19,    -1,    -1,    -1,    23,    24,    25,    26,    27,    28,
      -1,    19,    -1,    -1,    -1,    23,    24,    25,    26,    27,
      28,    10,    11,    -1,    -1,    10,    11,    16,    -1,    -1,
      -1,    20,    21,    22,    -1,    20,    21,    22,    -1,    -1,
      29,    -1,    -1,    32,    29,    -1,    -1,    32
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     5,     6,     7,     9,    35,    36,    37,    39,    60,
       0,    36,    20,    58,    32,    40,    41,    42,    60,    38,
      17,    20,    33,    41,    30,     3,    12,    13,    14,    15,
      20,    30,    46,    50,    56,    58,    60,    32,    10,    11,
      16,    20,    21,    22,    29,    32,    56,    61,    32,    16,
      16,    53,    51,    31,    50,    16,    32,    20,    45,    61,
       8,    61,    60,    61,     3,    16,    19,    23,    24,    25,
      26,    27,    28,    45,    18,    46,    33,    57,    16,    52,
      33,    33,    33,    32,    61,    61,    61,    61,    61,    61,
      61,    33,    61,    31,    59,    61,    18,    47,    61,    49,
      55,    16,    33,    17,    61,    43,    61,    47,    59,    16,
      50,    33,    50,    44,     4,     4,    61,    49,    54,    48,
      50
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_int8 yyr1[] =
{
       0,    34,    35,    36,    36,    38,    37,    39,    39,    40,
      40,    41,    41,    42,    43,    44,    45,    46,    46,    47,
      48,    49,    51,    50,    50,    52,    50,    53,    50,    50,
      50,    50,    50,    54,    50,    55,    50,    50,    50,    57,
      56,    56,    58,    59,    59,    60,    60,    60,    61,    61,
      61,    61,    61,    61,    61,    61,    61,    61,    61,    61,
      61,    61,    61,    61,    61,    61
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     0,     2,     0,     9,     1,     1,     0,
       1,     1,     3,     2,     0,     0,     1,     1,     2,     0,
       0,     0,     0,     4,     3,     0,     6,     0,     5,     2,
       2,     3,     8,     0,    13,     0,     7,     2,     2,     0,
       5,     3,     1,     1,     3,     1,     1,     1,     3,     8,
       3,     3,     3,     3,     1,     1,     1,     2,     1,     1,
       1,     2,     3,     3,     3,     4
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
# ifndef YY_LOCATION_PRINT
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif


# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yykind < YYNTOKENS)
    YYPRINT (yyo, yytoknum[yykind], *yyvaluep);
# endif
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    goto yyexhaustedlab;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* Program: Funcs  */
#line 88 "parser.ypp"
                                {}
#line 1283 "parser.tab.cpp"
    break;

  case 3: /* Funcs: %empty  */
#line 90 "parser.ypp"
                                        {}
#line 1289 "parser.tab.cpp"
    break;

  case 4: /* Funcs: FuncsDecl Funcs  */
#line 91 "parser.ypp"
                                                {}
#line 1295 "parser.tab.cpp"
    break;

  case 5: /* $@1: %empty  */
#line 94 "parser.ypp"
                        {
				//freshNum = 0;
				if (manager.get((yyvsp[-2].funcid)) != nullptr)
				{
					output::errorDef(yylineno, (yyvsp[-2].funcid));
					exit(1);
				}
				FuncClass* func = new FuncClass();

				func->name = (yyvsp[-2].funcid);
			    func->type = (yyvsp[-3].TYPE).type;
				func->params = (yyvsp[0].ExpList).list;
				func->ret_type = (yyvsp[-3].TYPE).type;

				if (manager.contains((yyvsp[-2].funcid)))
				{
					output::errorDef(yylineno, (yyvsp[-2].funcid));
					exit(1);
				}

                manager.insert(func);
				manager.newScope("func", func->ret_type);
				manager.insertParams((yyvsp[0].ExpList).list);
				buffer.emit("define " + getSizeByType(func->ret_type) + " @" + func->name + "(" + (yyvsp[0].ExpList).getParams() + ") {");


			}
#line 1327 "parser.tab.cpp"
    break;

  case 6: /* FuncsDecl: RetType FuncID LPAREN Formals $@1 RPAREN LBRACE Statements RBRACE  */
#line 121 "parser.ypp"
                        {
				FuncClass *func = dynamic_cast<FuncClass*>(manager.get((yyvsp[-7].funcid)));
				if (func == nullptr)
				{
					printf("bad pointer");
					exit(1);
				}
				///*output::endScope*/();
				manager.popScope();
				buffer.emit("ret " + getSizeByType(func->ret_type) + " " + initialize(func->ret_type));
				buffer.emit("}");
			}
#line 1344 "parser.tab.cpp"
    break;

  case 7: /* RetType: Type  */
#line 134 "parser.ypp"
                        {(yyval.TYPE).type = (yyval.TYPE).name = (yyvsp[0].TYPE).type;}
#line 1350 "parser.tab.cpp"
    break;

  case 8: /* RetType: VOID  */
#line 135 "parser.ypp"
                                {(yyval.TYPE).type = "VOID";}
#line 1356 "parser.tab.cpp"
    break;

  case 9: /* Formals: %empty  */
#line 137 "parser.ypp"
                              {}
#line 1362 "parser.tab.cpp"
    break;

  case 10: /* Formals: FormalsList  */
#line 138 "parser.ypp"
                                        {
								(yyval.ExpList).list = (yyvsp[0].ExpList).list;

							}
#line 1371 "parser.tab.cpp"
    break;

  case 11: /* FormalsList: FormalDecl  */
#line 143 "parser.ypp"
                         {(yyval.ExpList).list.push_back(TYPEClass((yyvsp[0].TYPE)));}
#line 1377 "parser.tab.cpp"
    break;

  case 12: /* FormalsList: FormalDecl COMMA FormalsList  */
#line 144 "parser.ypp"
                                                       { (yyval.ExpList).list.push_back((yyvsp[-2].TYPE)); (yyval.ExpList).list.insert( (yyval.ExpList).list.end(), (yyvsp[0].ExpList).list.begin(), (yyvsp[0].ExpList).list.end() );}
#line 1383 "parser.tab.cpp"
    break;

  case 13: /* FormalDecl: Type ID  */
#line 146 "parser.ypp"
                                {
							if(manager.contains(yylval.id))
							{
								output::errorDef(yylineno, yylval.id);
								exit(1);
							}
							(yyval.TYPE).type = (yyvsp[-1].TYPE).type;
							(yyval.TYPE).name = yylval.id;
							//$$.reg = fresh2(freshNum++);
						}
#line 1398 "parser.tab.cpp"
    break;

  case 14: /* NEWSCOPE: %empty  */
#line 157 "parser.ypp"
           {manager.newScope("if");}
#line 1404 "parser.tab.cpp"
    break;

  case 15: /* ENDSCOPE: %empty  */
#line 158 "parser.ypp"
           {/*output::endScope();*/manager.popScope();}
#line 1410 "parser.tab.cpp"
    break;

  case 16: /* BoolExp: Exp  */
#line 159 "parser.ypp"
                                                        {
										checkBoolean((yyvsp[0].TYPE)); 
										(yyval.TYPE) = (yyvsp[0].TYPE);
									}
#line 1419 "parser.tab.cpp"
    break;

  case 17: /* Statements: Statement  */
#line 163 "parser.ypp"
                                                {
										(yyval.TYPE) = (yyvsp[0].TYPE);
										(yyval.TYPE).continuelist = (yyvsp[0].TYPE).continuelist;
										(yyval.TYPE).breaklist = (yyvsp[0].TYPE).breaklist;
										
									}
#line 1430 "parser.tab.cpp"
    break;

  case 18: /* Statements: Statements Statement  */
#line 169 "parser.ypp"
                                                { 
										(yyval.TYPE) = (yyvsp[-1].TYPE);
										buffer.bpatch((yyvsp[-1].TYPE).nextlist, (yyvsp[0].TYPE).label);
										(yyval.TYPE).nextlist = (yyvsp[0].TYPE).nextlist;
										(yyval.TYPE).continuelist = CodeBuffer::merge((yyvsp[-1].TYPE).continuelist, (yyvsp[0].TYPE).continuelist);
										(yyval.TYPE).breaklist = CodeBuffer::merge((yyvsp[-1].TYPE).breaklist, (yyvsp[0].TYPE).breaklist);
										
									}
#line 1443 "parser.tab.cpp"
    break;

  case 19: /* TRUELABEL: %empty  */
#line 180 "parser.ypp"
            {(yyval.TYPE).label = fresh("truelabel"); buffer.emit("br label %" + (yyval.TYPE).label); buffer.emit((yyval.TYPE).label + ":");}
#line 1449 "parser.tab.cpp"
    break;

  case 20: /* FALSELABEL: %empty  */
#line 181 "parser.ypp"
             {(yyval.TYPE).label = fresh("falselabel"); buffer.emit("br label %" + (yyval.TYPE).label); buffer.emit((yyval.TYPE).label + ":");}
#line 1455 "parser.tab.cpp"
    break;

  case 21: /* GOTO: %empty  */
#line 182 "parser.ypp"
       {(yyval.TYPE).nextlist.push_back(std::pair<int, BranchLabelIndex>(buffer.emit("br label @"), FIRST));}
#line 1461 "parser.tab.cpp"
    break;

  case 22: /* $@2: %empty  */
#line 183 "parser.ypp"
                         {manager.newScope("regular");}
#line 1467 "parser.tab.cpp"
    break;

  case 23: /* Statement: LBRACE $@2 Statements RBRACE  */
#line 184 "parser.ypp"
                                                                        {
										(yyval.TYPE) = (yyvsp[-1].TYPE);
										/*output::endScope();*/
										manager.popScope();
										
										
									}
#line 1479 "parser.tab.cpp"
    break;

  case 24: /* Statement: Type ID SC  */
#line 192 "parser.ypp"
                                                        { 

										/* insert new symbol */
										if (manager.contains(yylval.id))
										{
											output::errorDef(yylineno, yylval.id);
											exit(1);
										}
										else
										{

											TYPEClass* y = new TYPEClass(yylval.id, (yyvsp[-2].TYPE).type);
											y->ptr = fresh("%ptr");
											buffer.emit(y->ptr + " = alloca i32");
											buffer.emit("store i32 0, i32* " + y->ptr);
											manager.insertID(y);
											
										}

									}
#line 1504 "parser.tab.cpp"
    break;

  case 25: /* $@3: %empty  */
#line 212 "parser.ypp"
                                  { (yyvsp[0].id) = std::string(yylval.id);}
#line 1510 "parser.tab.cpp"
    break;

  case 26: /* Statement: Type ID $@3 ASSIGN Exp SC  */
#line 212 "parser.ypp"
                                                                                {
										bphook(&(yyvsp[-1].TYPE));
										/* insert a symbol, maybe cast */
										if (manager.contains((yyvsp[-4].id)))
										{
											output::errorDef(yylineno, (yyvsp[-4].id));
											exit(1);
										}
										if (!legalAssign((yyvsp[-1].TYPE).type, (yyvsp[-5].TYPE).type))
										{
											output::errorMismatch(yylineno);
											exit(1);
										}
										else
										{
											
											TYPEClass* y = new TYPEClass((yyvsp[-4].id), (yyvsp[-5].TYPE).type);
											if (y->type == "BOOL")
											{
												

												y->ptr = fresh("%ptr");
												std::string truelabel = fresh("truelabel"), falselabel = fresh("falselabel"), endlabel = fresh("endlabel");
												buffer.emit("br label %" + truelabel);
												buffer.emit(truelabel + ":");
												buffer.emit("br label %" + endlabel);
												buffer.emit(falselabel + ":");
												buffer.emit("br label %" + endlabel);
												buffer.emit(endlabel + ":");
												std::string temp = fresh("%t");
												buffer.emit(temp + " = phi i32 [1, %" + truelabel + "], [0, %" + falselabel + "]");
												buffer.emit(y->ptr + " = alloca i32");
												buffer.emit("store i32 " + temp +", i32* " + y->ptr);
												buffer.bpatch((yyvsp[-1].TYPE).truelist, truelabel);
												buffer.bpatch((yyvsp[-1].TYPE).falselist, falselabel);
												manager.insertID(y);

												
											}
											else
											{
												y->ptr = fresh("%ptr");
												buffer.emit(y->ptr + " = alloca i32");
												std::string zextvar = fresh("%z");
												zextvar = (yyvsp[-1].TYPE).reg;
												////////////////////////// MAY CAUSE BUGS : ZEXT I32 TO I32 ????? /////////////
												/*
												if ($5.type != "INT")
													buffer.emit(zextvar + " = zext " + getSizeByType($5.type) + " " + $5.reg + " to i32");
												else
													zextvar = $5.reg;
												*/
												buffer.emit("store i32 " + zextvar + ", i32* " + y->ptr);
												manager.insertID(y);
											}
										}
										
										/*todo*/
									}
#line 1574 "parser.tab.cpp"
    break;

  case 27: /* $@4: %empty  */
#line 271 "parser.ypp"
                             {(yyvsp[0].id) = yylval.id;}
#line 1580 "parser.tab.cpp"
    break;

  case 28: /* Statement: ID $@4 ASSIGN Exp SC  */
#line 271 "parser.ypp"
                                                                { 
										bphook(&(yyvsp[-1].TYPE));
										/* maybe cast */
										TYPEClass* y = manager.get((yyvsp[-4].id));

										if (y == nullptr)
										{
											output::errorUndef(yylineno, (yyvsp[-4].id));
											exit(1);
										}

										FuncClass* func_y = dynamic_cast<FuncClass*>(y);
										if (func_y != nullptr)
										{
											output::errorUndef(yylineno, func_y->name);
											exit(1);
										}
										if (!legalAssign((yyvsp[-1].TYPE).type, y->type))
										{
											output::errorMismatch(yylineno);
											exit(1);
										}

										if (y->type == "BOOL")
										{
											/* currently using phi instead
											std::string truelabel = fresh("true"), falselabel = fresh("false"), endlabel = fresh("end");
											buffer.emit("br label %" + truelabel);
											buffer.emit(truelabel + ":");
											buffer.emit("store i32 1, i32* " + y->ptr);
											buffer.emit("br label %" + endlabel);
											buffer.emit(falselabel + ":");
											buffer.emit("store i32 0, i32* " + y->ptr);
											buffer.emit(endlabel + ":");
											buffer.bpatch($4.truelist, truelabel);
											buffer.bpatch($4.falselist, falselabel);
											*/


											y->ptr = fresh("%ptr");
											std::string truelabel = fresh("true"), falselabel = fresh("false"), endlabel = fresh("end");
											buffer.emit("br label %" + truelabel);
											buffer.emit(truelabel + ":");

											buffer.emit("br label %" + endlabel);
											buffer.emit(falselabel + ":");

											buffer.emit("br label %" + endlabel);
											buffer.emit(endlabel + ":");
											std::string temp = fresh("%t");
											buffer.emit(temp + " = phi i32 [1, %" + truelabel + "], [0, %" + falselabel + "]");
											buffer.emit(y->ptr + " = alloca i32");
											buffer.emit("store i32 " + temp +", i32* " + y->ptr);
											buffer.bpatch((yyvsp[-1].TYPE).truelist, truelabel);
											buffer.bpatch((yyvsp[-1].TYPE).falselist, falselabel);
											
										}
										else
										{	
											
											std::string zextvar = fresh("%z");
											zextvar = (yyvsp[-1].TYPE).reg;
											/*
											if ($4.type != "INT")
													buffer.emit(zextvar + " = zext " + getSizeByType($4.type) + " " + $4.reg + " to i32");
												else
													zextvar = $4.reg;
											*/
											buffer.emit("store i32 " + zextvar + ", i32* " + y->ptr);
										}
										
									}
#line 1657 "parser.tab.cpp"
    break;

  case 29: /* Statement: Call SC  */
#line 343 "parser.ypp"
                                                                {									
									}
#line 1664 "parser.tab.cpp"
    break;

  case 30: /* Statement: RETURN SC  */
#line 345 "parser.ypp"
                                                                {	
										/* check void ret type */
										if (!manager.legalReturn("VOID"))
										{
											/* error return mismatch*/
											output::errorMismatch(yylineno);
											exit(1);
										}
										buffer.emit("ret void");


									}
#line 1681 "parser.tab.cpp"
    break;

  case 31: /* Statement: RETURN Exp SC  */
#line 357 "parser.ypp"
                                                        { /* check NOT void ret type */
										bphook(&(yyvsp[-1].TYPE));
										
										if (!manager.legalReturn((yyvsp[-1].TYPE).type) || (yyvsp[-1].TYPE).type == "VOID")
										{
											/* error return mismatch*/
											output::errorMismatch(yylineno);
											exit(1);
										}
										buffer.emit("ret " + getSizeByType((yyvsp[-1].TYPE).type) + " " + (yyvsp[-1].TYPE).reg);
									}
#line 1697 "parser.tab.cpp"
    break;

  case 32: /* Statement: IF LPAREN BoolExp RPAREN TRUELABEL NEWSCOPE Statement ENDSCOPE  */
#line 369 "parser.ypp"
                        {
				bphook(&(yyvsp[-5].TYPE));
				(yyval.TYPE).continuelist = (yyvsp[-1].TYPE).continuelist;
				(yyval.TYPE).breaklist = (yyvsp[-1].TYPE).breaklist;
				(yyval.TYPE).nextlist = CodeBuffer::merge((yyvsp[-1].TYPE).nextlist, (yyvsp[-5].TYPE).falselist);
				buffer.bpatch((yyvsp[-5].TYPE).truelist, (yyvsp[-3].TYPE).label);
				
				(yyval.TYPE).nextlist = CodeBuffer::merge((yyvsp[-1].TYPE).nextlist, (yyvsp[-5].TYPE).falselist);

				(yyval.TYPE).end = fresh("endlabel");
				buffer.bpatch((yyvsp[-5].TYPE).falselist, (yyval.TYPE).end);
				buffer.emit("br label %" + (yyval.TYPE).end);
				buffer.emit((yyval.TYPE).end + ":");
				buffer.bpatch((yyval.TYPE).nextlist, (yyval.TYPE).end);

			}
#line 1718 "parser.tab.cpp"
    break;

  case 33: /* $@5: %empty  */
#line 385 "parser.ypp"
                                                                                                   {manager.newScope("else");}
#line 1724 "parser.tab.cpp"
    break;

  case 34: /* Statement: IF LPAREN BoolExp RPAREN TRUELABEL NEWSCOPE Statement ENDSCOPE ELSE GOTO $@5 FALSELABEL Statement  */
#line 386 "parser.ypp"
                        {
				bphook(&(yyvsp[-10].TYPE));

				(yyval.TYPE).nextlist = CodeBuffer::merge((yyvsp[-6].TYPE).nextlist, (yyvsp[0].TYPE).nextlist);
				(yyval.TYPE).continuelist = CodeBuffer::merge((yyvsp[-6].TYPE).continuelist, (yyvsp[0].TYPE).continuelist);
				(yyval.TYPE).breaklist = CodeBuffer::merge((yyvsp[-6].TYPE).breaklist, (yyvsp[0].TYPE).breaklist);
				
				
			    manager.popScope();

			    buffer.bpatch((yyvsp[-10].TYPE).truelist, (yyvsp[-8].TYPE).label);
				
			    buffer.bpatch((yyvsp[-10].TYPE).falselist, (yyvsp[-1].TYPE).label);

				(yyval.TYPE).end = fresh("endlabel");
				buffer.emit("br label %" + (yyval.TYPE).end);
				buffer.emit((yyval.TYPE).end + ":");
				buffer.bpatch((yyval.TYPE).nextlist, (yyval.TYPE).end);

				buffer.bpatch((yyvsp[-3].TYPE).nextlist, (yyval.TYPE).end);
				


			}
#line 1753 "parser.tab.cpp"
    break;

  case 35: /* $@6: %empty  */
#line 410 "parser.ypp"
                                                      {manager.newScope("while");}
#line 1759 "parser.tab.cpp"
    break;

  case 36: /* Statement: WHILE LPAREN BoolExp RPAREN $@6 TRUELABEL Statement  */
#line 411 "parser.ypp"
                        {
				bphook(&(yyvsp[-4].TYPE));
				//also this
			    manager.popScope();
			    buffer.bpatch((yyvsp[-4].TYPE).truelist, (yyvsp[-1].TYPE).label);

				// TODO: backpatch continues and breaks

				buffer.bpatch((yyvsp[0].TYPE).nextlist, (yyvsp[-4].TYPE).hooklabel);
			    buffer.emit("br label %"+ (yyvsp[-4].TYPE).hooklabel); // TODO : not sure about this one

				(yyval.TYPE).end = fresh("endlabel");
				buffer.emit("br label %" + (yyval.TYPE).end);
				buffer.emit((yyval.TYPE).end + ":");
				buffer.bpatch((yyvsp[-4].TYPE).falselist, (yyval.TYPE).end);
				buffer.bpatch((yyvsp[0].TYPE).continuelist, (yyvsp[-4].TYPE).label);
				buffer.bpatch((yyvsp[0].TYPE).breaklist, (yyval.TYPE).end);
				
				

				
			}
#line 1786 "parser.tab.cpp"
    break;

  case 37: /* Statement: BREAK SC  */
#line 433 "parser.ypp"
                                        { 

								if (!manager.inScope("while"))
								{
								    output::errorUnexpectedBreak(yylineno);
									exit(1);
								}
								int location = buffer.emit("br label @");
								(yyval.TYPE).breaklist.push_back(std::pair<int, BranchLabelIndex>(location, FIRST));
								
							}
#line 1802 "parser.tab.cpp"
    break;

  case 38: /* Statement: CONTINUE SC  */
#line 444 "parser.ypp"
                                        {
								if (!manager.inScope("while"))
								{
									output::errorUnexpectedContinue(yylineno);
									exit(1);
								}
								int location = buffer.emit("br label @");
								(yyval.TYPE).continuelist.push_back(std::pair<int, BranchLabelIndex>(location, FIRST));
								
							}
#line 1817 "parser.tab.cpp"
    break;

  case 39: /* $@7: %empty  */
#line 455 "parser.ypp"
                                        {
												FuncClass* func = dynamic_cast<FuncClass*>(manager.get((yyvsp[-1].funcid)));
											
												if (func == nullptr)
												{
													output::errorUndef(yylineno, (yyvsp[-1].funcid));
													exit(1);
												}
								}
#line 1831 "parser.tab.cpp"
    break;

  case 40: /* Call: FuncID LPAREN $@7 ExpList RPAREN  */
#line 464 "parser.ypp"
                                                                {
												FuncClass* func = dynamic_cast<FuncClass*>(manager.get((yyvsp[-4].funcid)));
											
												if (func == nullptr)
												{
													output::errorUndefFunc(yylineno, (yyvsp[-4].funcid));
													exit(1);
												}
												if (!func->legalParams((yyvsp[-1].ExpList).list)){
													std::vector<std::string> types;
													for (TYPEClass y: func->params)
													{
														types.push_back(y.type);
													}
													
													output::errorPrototypeMismatch(yylineno, func->name, types);
													exit(1);
												}
												(yyval.TYPE).type = func->ret_type;
												//$4.convertParams(func->params);
												if (func->ret_type != "VOID"){
													(yyval.TYPE).reg = fresh("%t");
													buffer.emit((yyval.TYPE).reg + " = call " + getSizeByType(func->ret_type) + " @" + func->name + "(" + (yyvsp[-1].ExpList).getParams() + ")");
												}
												else
													buffer.emit("call " + getSizeByType(func->ret_type) + " @" + func->name + "(" + (yyvsp[-1].ExpList).getParams() + ")");
												
							}
#line 1864 "parser.tab.cpp"
    break;

  case 41: /* Call: FuncID LPAREN RPAREN  */
#line 492 "parser.ypp"
                                                                        {
												FuncClass* func = dynamic_cast<FuncClass*>(manager.get((yyvsp[-2].funcid)));
												if (func == nullptr)
												{
													output::errorUndefFunc(yylineno, (yyvsp[-2].funcid));
													exit(1);
												}
												if (!func->params.empty())
												{
													std::vector<std::string> types;
													for (TYPEClass y: func->params)
													{
														types.push_back(y.type);
													}
													
													output::errorPrototypeMismatch(yylineno, func->name, types);
													exit(1);
												}
												(yyval.TYPE).type = func->ret_type;
												if (func->ret_type != "VOID"){
													(yyval.TYPE).reg = fresh("%t");
													buffer.emit((yyval.TYPE).reg + " = call " + getSizeByType(func->ret_type) + "@" + func->name + "()");
												}
												else
													buffer.emit("call " + getSizeByType(func->ret_type) + "@" + func->name + "()");
											}
#line 1895 "parser.tab.cpp"
    break;

  case 42: /* FuncID: ID  */
#line 519 "parser.ypp"
                     {(yyval.funcid) = yylval.id;}
#line 1901 "parser.tab.cpp"
    break;

  case 43: /* ExpList: Exp  */
#line 520 "parser.ypp"
                        {
						bphook(&(yyvsp[0].TYPE));
						(yyval.ExpList).list.push_back((yyvsp[0].TYPE));
						
					}
#line 1911 "parser.tab.cpp"
    break;

  case 44: /* ExpList: Exp COMMA ExpList  */
#line 525 "parser.ypp"
                                                        {
										bphook(&(yyvsp[-2].TYPE));
										(yyval.ExpList).list.push_back((yyvsp[-2].TYPE));
										(yyval.ExpList).list.insert( (yyval.ExpList).list.end(), (yyvsp[0].ExpList).list.begin(), (yyvsp[0].ExpList).list.end());
									}
#line 1921 "parser.tab.cpp"
    break;

  case 45: /* Type: INT  */
#line 531 "parser.ypp"
                        { (yyval.TYPE).type = "INT";}
#line 1927 "parser.tab.cpp"
    break;

  case 46: /* Type: BYTE  */
#line 532 "parser.ypp"
                                { (yyval.TYPE).type = "BYTE";}
#line 1933 "parser.tab.cpp"
    break;

  case 47: /* Type: BOOL  */
#line 533 "parser.ypp"
                                { (yyval.TYPE).type = "BOOL";}
#line 1939 "parser.tab.cpp"
    break;

  case 48: /* Exp: LPAREN Exp RPAREN  */
#line 536 "parser.ypp"
                                                                        {
													
													(yyval.TYPE) = (yyvsp[-1].TYPE);
												}
#line 1948 "parser.tab.cpp"
    break;

  case 49: /* Exp: Exp IF LPAREN GOTO Exp RPAREN ELSE Exp  */
#line 540 "parser.ypp"
                                                                          {
													//hook(&$$);
													//buffer.bpatch($1.hooklist, $5.label);
													(yyval.TYPE).label = (yyvsp[-3].TYPE).hooklabel;
													(yyval.TYPE).hooklabel = (yyvsp[-3].TYPE).hooklabel;
													(yyval.TYPE).hooklist = (yyvsp[-7].TYPE).hooklist;
													buffer.bpatch((yyvsp[-3].TYPE).hooklist, (yyvsp[-3].TYPE).hooklabel);
													buffer.bpatch((yyvsp[0].TYPE).hooklist, (yyvsp[0].TYPE).hooklabel);
													
													checkBoolean((yyvsp[-3].TYPE));
													std::string truelabel = fresh("truelabel"), falselabel = fresh("falselabel"), endlabel = fresh("endlabel");
													buffer.emit("br label %" + falselabel);
													buffer.emit(truelabel + ":");
													buffer.emit("br label %" + endlabel);
													
													buffer.emit(falselabel + ":");
													buffer.emit("br label %" + endlabel);
													
													buffer.emit(endlabel + ":");
													if (isNumeral((yyvsp[-7].TYPE)) && isNumeral((yyvsp[0].TYPE)))
													{
														(yyval.TYPE).type = largestType((yyvsp[-7].TYPE).type, (yyvsp[0].TYPE).type);

														//std::string truelabel = fresh("truelabel"), falselabel = fresh("falselabel"), endlabel = fresh("endlabel");
														//buffer.emit("br label %" + truelabel);
														//buffer.emit(truelabel + ":");
														//buffer.emit("br label %" + endlabel);
														//buffer.emit(falselabel + ":");
														//buffer.emit("br label %" + endlabel);
														//buffer.emit(endlabel + ":");

														(yyval.TYPE).reg = fresh("%t");
														/*
														if ($$.type == "INT")
															convertBytesToInt(&$1, &$8);
														*/
														buffer.emit((yyval.TYPE).reg + " = phi i32" +
															" [" + (yyvsp[-7].TYPE).reg + ", %" + truelabel 
															+ " ], [" + (yyvsp[0].TYPE).reg + ", %" + falselabel + " ]"
														);

														buffer.bpatch((yyvsp[-3].TYPE).truelist, (yyvsp[-7].TYPE).hooklabel);
														buffer.bpatch((yyvsp[-3].TYPE).falselist, (yyvsp[0].TYPE).hooklabel);
														buffer.bpatch((yyvsp[-4].TYPE).nextlist, truelabel);

													}
													else if ((yyvsp[-7].TYPE).type != (yyvsp[0].TYPE).type)
													{
														output::errorMismatch(yylineno);
														exit(1);
													}
													else // BOOLEAN
													{
														(yyval.TYPE).type = (yyvsp[-7].TYPE).type;
														
														std::string endlabel = fresh("endlabel");
														buffer.emit("br label %" + endlabel);
														buffer.emit(endlabel + ":");
														buffer.bpatch((yyvsp[-3].TYPE).truelist, (yyvsp[-7].TYPE).hooklabel);
														buffer.bpatch((yyvsp[-3].TYPE).falselist, (yyvsp[0].TYPE).label);
														buffer.bpatch((yyvsp[-4].TYPE).nextlist, truelabel);
														(yyval.TYPE).truelist = CodeBuffer::merge((yyvsp[-7].TYPE).truelist, (yyvsp[0].TYPE).truelist);
														(yyval.TYPE).falselist = CodeBuffer::merge((yyvsp[-7].TYPE).falselist, (yyvsp[0].TYPE).falselist);
														
													}
													
													
													



												}
#line 2025 "parser.tab.cpp"
    break;

  case 50: /* Exp: Exp ADD Exp  */
#line 612 "parser.ypp"
                                                                {
											hook(&(yyval.TYPE), "add");
											bphook(&(yyvsp[-2].TYPE));
											bphook(&(yyvsp[0].TYPE));
											checkNumeral((yyvsp[-2].TYPE));
											checkNumeral((yyvsp[0].TYPE));

											(yyval.TYPE).type = largestType((yyvsp[-2].TYPE).type, (yyvsp[0].TYPE).type);
											(yyval.TYPE).reg = fresh("%t");
											//zext(&$1, &$3);
											buffer.emit((yyval.TYPE).reg + " = add i32 " + (yyvsp[-2].TYPE).reg + ", " + (yyvsp[0].TYPE).reg);
											checkByteOverflow(&(yyval.TYPE));
										}
#line 2043 "parser.tab.cpp"
    break;

  case 51: /* Exp: Exp SUB Exp  */
#line 625 "parser.ypp"
                                                                {
											hook(&(yyval.TYPE), "sub");
											bphook(&(yyvsp[-2].TYPE));
											bphook(&(yyvsp[0].TYPE));
											checkNumeral((yyvsp[-2].TYPE));
											checkNumeral((yyvsp[0].TYPE));

											(yyval.TYPE).type = largestType((yyvsp[-2].TYPE).type, (yyvsp[0].TYPE).type);
											(yyval.TYPE).reg = fresh("%t");
											//zext(&$1, &$3);
											buffer.emit((yyval.TYPE).reg + " = sub i32 " + (yyvsp[-2].TYPE).reg + ", " + (yyvsp[0].TYPE).reg);
											checkByteOverflow(&(yyval.TYPE));
										}
#line 2061 "parser.tab.cpp"
    break;

  case 52: /* Exp: Exp DIV Exp  */
#line 638 "parser.ypp"
                                                                {
											hook(&(yyval.TYPE), "div");
											bphook(&(yyvsp[-2].TYPE));
											bphook(&(yyvsp[0].TYPE));
											checkNumeral((yyvsp[-2].TYPE));
											checkNumeral((yyvsp[0].TYPE));
											(yyval.TYPE).type = largestType((yyvsp[-2].TYPE).type, (yyvsp[0].TYPE).type);
											(yyval.TYPE).reg = fresh("%t");
											//zext(&$1, &$3);
											std::string instr = (yyval.TYPE).type == "INT" ? "sdiv" : "udiv";
											std::string divzero = fresh("divzerolabel"), end_divzero = fresh("end_divzerolabel");
											std::string temp = fresh("%t");

											buffer.emit(temp + " = icmp eq i32 0, " + (yyvsp[0].TYPE).reg);
											buffer.emit("br i1 " + temp + ", label %" + divzero + ", label %" + end_divzero);
											buffer.emit(divzero + ":");
											std::string stringptr = fresh("%ptr");
											buffer.emit(stringptr + " = getelementptr [23 x i8], [23 x i8]* @divzero, i32 0, i32 0");
											buffer.emit("call void @print(i8* " + stringptr + ")");
											buffer.emit("call void @exit(i32 1)");
											buffer.emit("br label %" + end_divzero);
											buffer.emit(end_divzero + ":");
											buffer.emit((yyval.TYPE).reg + " = " + instr + " i32 " + (yyvsp[-2].TYPE).reg + ", " + (yyvsp[0].TYPE).reg);
											checkByteOverflow(&(yyval.TYPE));
			
										}
#line 2092 "parser.tab.cpp"
    break;

  case 53: /* Exp: Exp MULT Exp  */
#line 665 "parser.ypp"
                                                                {	
											hook(&(yyval.TYPE), "mul");
											bphook(&(yyvsp[-2].TYPE));
											bphook(&(yyvsp[0].TYPE));
											checkNumeral((yyvsp[-2].TYPE));
											checkNumeral((yyvsp[0].TYPE));
											(yyval.TYPE).type = largestType((yyvsp[-2].TYPE).type, (yyvsp[0].TYPE).type);
											(yyval.TYPE).reg = fresh("%t");
											//zext(&$1, &$3);
											buffer.emit((yyval.TYPE).reg + " = mul i32 " + (yyvsp[-2].TYPE).reg + ", " + (yyvsp[0].TYPE).reg);
											checkByteOverflow(&(yyval.TYPE));
										}
#line 2109 "parser.tab.cpp"
    break;

  case 54: /* Exp: ID  */
#line 677 "parser.ypp"
                                                                        {
											hook(&(yyval.TYPE), "id");
											TYPEClass* y = manager.get(yylval.id);

											if (y == nullptr)
											{
												output::errorUndef(yylineno, yylval.id);
												exit(1);
											}
											if (dynamic_cast<FuncClass*>(y) != nullptr)
											{
												output::errorUndef(yylineno, yylval.id);
												exit(1);
											}

											
											
											(yyval.TYPE).reg = fresh("%t");
											(yyval.TYPE).type = y->type;
											buffer.emit((yyval.TYPE).reg + " = load i32, i32* " + y->ptr);
											if (y->type == "BYTE")
											{
												truncZext(&(yyval.TYPE));	
											}

											if (y->type == "BOOL")
											{
												//std::string idlabel = fresh("idlabel");
												//buffer.emit("br label %" + idlabel);
												(yyval.TYPE).label = (yyval.TYPE).hooklabel;
												//buffer.emit(idlabel + ":");

												std::string temp = fresh("%t");

												buffer.emit(temp + " = icmp eq i32 1, " + (yyval.TYPE).reg);
												int location = buffer.emit("br i1 " + temp + ", label @, label @");
												(yyval.TYPE).truelist.push_back(std::pair<int, BranchLabelIndex>(location, FIRST));
												(yyval.TYPE).falselist.push_back(std::pair<int, BranchLabelIndex>(location, SECOND));
												
											}
										}
#line 2155 "parser.tab.cpp"
    break;

  case 55: /* Exp: Call  */
#line 718 "parser.ypp"
                                                                        {
											hook(&(yyval.TYPE), "call");
											(yyval.TYPE).type = (yyvsp[0].TYPE).type;
											(yyval.TYPE).reg = (yyvsp[0].TYPE).reg;
											

										}
#line 2167 "parser.tab.cpp"
    break;

  case 56: /* Exp: NUM  */
#line 725 "parser.ypp"
                                                                        {
											hook(&(yyval.TYPE), "num");
											(yyval.TYPE).type = "INT";
											(yyval.TYPE).reg = std::to_string(yylval.byte);
										}
#line 2177 "parser.tab.cpp"
    break;

  case 57: /* Exp: NUM B  */
#line 730 "parser.ypp"
                                                                        {
											hook(&(yyval.TYPE), "byte");
											(yyval.TYPE).type = "BYTE";
											checkByte(yylval.byte);
											(yyval.TYPE).reg = std::to_string(yylval.byte);
										}
#line 2188 "parser.tab.cpp"
    break;

  case 58: /* Exp: STRING  */
#line 736 "parser.ypp"
                                                                        {
											
											(yyval.TYPE).type = "STRING";
											std::string global = fresh("@str");
											yytext += 1;
											yytext[yyleng - 2] = '\0';
											int size = std::string(yytext).size() + 1;
											buffer.emitGlobal(global + " = internal constant [" 
											+ std::to_string(size) + " x i8] c\"" + yytext + "\\00\"");
											(yyval.TYPE).reg = fresh("%ptr");
											std::string type = "[" + std::to_string(size) + " x i8]";
											buffer.emit((yyval.TYPE).reg + " = getelementptr " + type + ", " + 
											 type + "* " + global + ", i32 0, i32 0");

											
										}
#line 2209 "parser.tab.cpp"
    break;

  case 59: /* Exp: TRUE  */
#line 752 "parser.ypp"
                                                                        {

											hook(&(yyval.TYPE), "true");
											(yyval.TYPE).label = fresh("truebool");
											buffer.emit("br label %" + (yyval.TYPE).label);
											buffer.emit((yyval.TYPE).label + ":");
											
											(yyval.TYPE).type = "BOOL";
											(yyval.TYPE).reg = "true";
											
											int location = buffer.emit("br label @");
											(yyval.TYPE).truelist.push_back(std::pair<int, BranchLabelIndex>(location, FIRST));

											
										}
#line 2229 "parser.tab.cpp"
    break;

  case 60: /* Exp: FALSE  */
#line 767 "parser.ypp"
                                                                        {
											hook(&(yyval.TYPE), "false");
											(yyval.TYPE).label = fresh("falsebool");
											buffer.emit("br label %" + (yyval.TYPE).label);
											buffer.emit((yyval.TYPE).label + ":");
											(yyval.TYPE).type = "BOOL";
											(yyval.TYPE).reg = "false";
											
											int location = buffer.emit("br label @");
											(yyval.TYPE).falselist.push_back(std::pair<int, BranchLabelIndex>(location, FIRST));

										}
#line 2246 "parser.tab.cpp"
    break;

  case 61: /* Exp: NOT Exp  */
#line 779 "parser.ypp"
                                                                        {

											hook(&(yyval.TYPE), "not");
											bphook(&(yyvsp[0].TYPE));
											checkBoolean((yyvsp[0].TYPE));
											(yyval.TYPE).type = "BOOL";
											(yyval.TYPE).label = (yyvsp[0].TYPE).hooklabel;
											(yyval.TYPE).truelist = (yyvsp[0].TYPE).falselist;
											(yyval.TYPE).falselist = (yyvsp[0].TYPE).truelist;
										}
#line 2261 "parser.tab.cpp"
    break;

  case 62: /* Exp: Exp AND Exp  */
#line 789 "parser.ypp"
                                                                {
											(yyval.TYPE).hooklabel = (yyvsp[-2].TYPE).hooklabel;
											//hook(&$$, "and");
											bphook(&(yyvsp[-2].TYPE));
											bphook(&(yyvsp[0].TYPE));
											checkBoolean((yyvsp[-2].TYPE));
											checkBoolean((yyvsp[0].TYPE));
											(yyval.TYPE).type = std::string("BOOL");
											(yyval.TYPE).label = (yyvsp[-2].TYPE).hooklabel;

											buffer.bpatch((yyvsp[-2].TYPE).truelist, (yyvsp[0].TYPE).hooklabel);
											(yyval.TYPE).falselist = CodeBuffer::merge((yyvsp[-2].TYPE).falselist, (yyvsp[0].TYPE).falselist);;
											(yyval.TYPE).truelist = (yyvsp[0].TYPE).truelist;


											

										}
#line 2284 "parser.tab.cpp"
    break;

  case 63: /* Exp: Exp OR Exp  */
#line 807 "parser.ypp"
                                                                {
											(yyval.TYPE).hooklabel = (yyvsp[-2].TYPE).hooklabel;
											//hook(&$$, "or");
											bphook(&(yyvsp[-2].TYPE));
											bphook(&(yyvsp[0].TYPE));
											checkBoolean((yyvsp[-2].TYPE));
											checkBoolean((yyvsp[0].TYPE));
											(yyval.TYPE).type = std::string("BOOL");
											(yyval.TYPE).label = (yyvsp[-2].TYPE).hooklabel;
											(yyval.TYPE).truelist = CodeBuffer::merge((yyvsp[-2].TYPE).truelist, (yyvsp[0].TYPE).truelist);
											buffer.bpatch((yyvsp[-2].TYPE).falselist, (yyvsp[0].TYPE).hooklabel);
											(yyval.TYPE).falselist = (yyvsp[0].TYPE).falselist;
											
											
											
										}
#line 2305 "parser.tab.cpp"
    break;

  case 64: /* Exp: Exp RELOP Exp  */
#line 823 "parser.ypp"
                                                                {
											
											(yyval.TYPE).label = fresh("reloplabel");
											(yyval.TYPE).hooklabel = (yyvsp[-2].TYPE).hooklabel;
											buffer.emit("br label %" + (yyval.TYPE).label);
											buffer.emit((yyval.TYPE).label + ":");

											bphook(&(yyvsp[-2].TYPE));
											bphook(&(yyvsp[0].TYPE));
											checkNumeral((yyvsp[-2].TYPE));
											checkNumeral((yyvsp[0].TYPE));
											
											(yyval.TYPE).type = std::string("BOOL");

											
											(yyval.TYPE).reg = fresh("%t");
											/*
											if (largestType($1.type, $3.type) == "INT"){
												convertBytesToInt(&$1, &$3);
											}
											*/
											buffer.emit((yyval.TYPE).reg + " = icmp " + processRelop(yylval.relop) + " i32 " + (yyvsp[-2].TYPE).reg + ", " + (yyvsp[0].TYPE).reg);
											int location = buffer.emit("br i1 " + (yyval.TYPE).reg + ", label @, label @");
											(yyval.TYPE).truelist.push_back(std::pair<int, BranchLabelIndex>(location, FIRST));
											(yyval.TYPE).falselist.push_back(std::pair<int, BranchLabelIndex>(location, SECOND));
											
										}
#line 2337 "parser.tab.cpp"
    break;

  case 65: /* Exp: LPAREN Type RPAREN Exp  */
#line 850 "parser.ypp"
                                                        {
											(yyval.TYPE).hooklabel = (yyvsp[0].TYPE).hooklabel;
											(yyval.TYPE).hooklist = (yyvsp[0].TYPE).hooklist;
											//hook(&$$, "cast");
											//bphook(&$4);
											checkNumeral((yyvsp[0].TYPE));
											checkNumeral((yyvsp[-2].TYPE));
											(yyval.TYPE).type = std::string((yyvsp[-2].TYPE).type);
											(yyval.TYPE).reg = (yyvsp[0].TYPE).reg;
											checkByteOverflow(&(yyval.TYPE));
										}
#line 2353 "parser.tab.cpp"
    break;


#line 2357 "parser.tab.cpp"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;


#if !defined yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturn;
#endif


/*-------------------------------------------------------.
| yyreturn -- parsing is finished, clean up and return.  |
`-------------------------------------------------------*/
yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 863 "parser.ypp"

int main()
{
	std::ifstream t("print_functions.llvm");
	std::stringstream s;
	s << t.rdbuf();
	buffer.emit(s.str());
	buffer.emitGlobal("@divzero = internal constant [23 x i8] c\"Error division by zero\\00\"");
	int res = yyparse();
	manager.checkMain();
	///*output::endScope*/();
	manager.popScope();
	buffer.printGlobalBuffer();
	buffer.printCodeBuffer();
	return res;
}

int yyerror(const char * message)
{
	output::errorSyn(yylineno);
	exit(1);
}
