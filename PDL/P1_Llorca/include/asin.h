/* A Bison parser, made by GNU Bison 3.7.5.  */

/* Bison interface for Yacc-like parsers in C

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
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_ASIN_H_INCLUDED
# define YY_YY_ASIN_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    OPSUMA_ = 258,                 /* OPSUMA_  */
    OPRESTA_ = 259,                /* OPRESTA_  */
    OPMULT_ = 260,                 /* OPMULT_  */
    OPDIV_ = 261,                  /* OPDIV_  */
    OPMOD_ = 262,                  /* OPMOD_  */
    OPAND_ = 263,                  /* OPAND_  */
    OPOR_ = 264,                   /* OPOR_  */
    OPNOT_ = 265,                  /* OPNOT_  */
    OPINCREMENTO_ = 266,           /* OPINCREMENTO_  */
    OPDECREMENTO_ = 267,           /* OPDECREMENTO_  */
    COMPMAYOR_ = 268,              /* COMPMAYOR_  */
    COMPMENOR_ = 269,              /* COMPMENOR_  */
    COMPMAYORIG_ = 270,            /* COMPMAYORIG_  */
    COMPMENORIG_ = 271,            /* COMPMENORIG_  */
    OPIGUAL_ = 272,                /* OPIGUAL_  */
    OPNOTIGUAL_ = 273,             /* OPNOTIGUAL_  */
    IGUAL_ = 274,                  /* IGUAL_  */
    MASIGUAL_ = 275,               /* MASIGUAL_  */
    MENOSIGUAL_ = 276,             /* MENOSIGUAL_  */
    PORIGUAL_ = 277,               /* PORIGUAL_  */
    DIVIGUAL_ = 278,               /* DIVIGUAL_  */
    WHILE_ = 279,                  /* WHILE_  */
    DO_ = 280,                     /* DO_  */
    IF_ = 281,                     /* IF_  */
    ELSEIF_ = 282,                 /* ELSEIF_  */
    ELSE_ = 283,                   /* ELSE_  */
    INT_ = 284,                    /* INT_  */
    BOOL_ = 285,                   /* BOOL_  */
    READ_ = 286,                   /* READ_  */
    PRINT_ = 287,                  /* PRINT_  */
    CTE_ = 288,                    /* CTE_  */
    ID_ = 289,                     /* ID_  */
    TRUE_ = 290,                   /* TRUE_  */
    FALSE_ = 291,                  /* FALSE_  */
    LLAVE1_ = 292,                 /* LLAVE1_  */
    LLAVE2_ = 293,                 /* LLAVE2_  */
    PARENTESIS1_ = 294,            /* PARENTESIS1_  */
    PARENTESIS2_ = 295,            /* PARENTESIS2_  */
    CORCHETE1_ = 296,              /* CORCHETE1_  */
    CORCHETE2_ = 297,              /* CORCHETE2_  */
    SEMICOLON_ = 298               /* SEMICOLON_  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_ASIN_H_INCLUDED  */
