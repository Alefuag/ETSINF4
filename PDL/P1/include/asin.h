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
    INT_ = 258,                    /* INT_  */
    BOOL_ = 259,                   /* BOOL_  */
    STRUCT_ = 260,                 /* STRUCT_  */
    RETURN_ = 261,                 /* RETURN_  */
    READ_ = 262,                   /* READ_  */
    IF_ = 263,                     /* IF_  */
    ELSE_ = 264,                   /* ELSE_  */
    WHILE_ = 265,                  /* WHILE_  */
    PRINT_ = 266,                  /* PRINT_  */
    TRUE_ = 267,                   /* TRUE_  */
    FALSE_ = 268,                  /* FALSE_  */
    OPAR_ = 269,                   /* OPAR_  */
    CPAR_ = 270,                   /* CPAR_  */
    OCOR_ = 271,                   /* OCOR_  */
    CCOR_ = 272,                   /* CCOR_  */
    OLLAVE_ = 273,                 /* OLLAVE_  */
    CLLAVE_ = 274,                 /* CLLAVE_  */
    AND_ = 275,                    /* AND_  */
    OR_ = 276,                     /* OR_  */
    IGUALIGUAL_ = 277,             /* IGUALIGUAL_  */
    DISTINTO_ = 278,               /* DISTINTO_  */
    MENOR_ = 279,                  /* MENOR_  */
    MAYOR_ = 280,                  /* MAYOR_  */
    MENORIGUAL_ = 281,             /* MENORIGUAL_  */
    MAYORIGUAL_ = 282,             /* MAYORIGUAL_  */
    MAS_ = 283,                    /* MAS_  */
    MENOS_ = 284,                  /* MENOS_  */
    POR_ = 285,                    /* POR_  */
    DIV_ = 286,                    /* DIV_  */
    IGUAL_ = 287,                  /* IGUAL_  */
    NEGACION_ = 288,               /* NEGACION_  */
    PUNTOCOMA_ = 289,              /* PUNTOCOMA_  */
    COMA_ = 290,                   /* COMA_  */
    PUNTO_ = 291,                  /* PUNTO_  */
    ID_ = 292,                     /* ID_  */
    CTE_ = 293                     /* CTE_  */
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
