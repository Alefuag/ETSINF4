%{
#include <stdio.h>
#include "include/header.h"

extern FILE *yyin;
#define retornar(x){if(verbosidad) ECHO;}
#define prlnno(){printf( "%d.-  ", yylineno );}
%}

%option yylineno
delimitador   [ \t]+
digito        [0-9]
entero        {digito}+
letra         [A-z]

%%
{delimitador}    {if (verbosidad) ECHO;}
\n               {if (verbosidad) { ECHO ; prlnno(); } }
\/\/[^\n]*(\n)   {if (verbosidad) { ECHO ; prlnno(); } }
"int"            {retornar (INT_);}
"bool"           {retornar (BOOL_);}
"struct"         {retornar (STRUCT_);}
"return"         {retornar (RETURN_);}
"read"           {retornar (READ_);}
"if"             {retornar (IF_);}
"while"          {retornar (WHILE_);}
"print"          {retornar (PRINT_);}
"else"           {retornar (ELSE_);}
"true"           {retornar (TRUE_);}
"false"          {retornar (FALSE_);}
"&&"             {retornar (AND_);}
"||"             {retornar (OR_);}
"=="             {retornar (IGUALIGUAL_);}
"!="             {retornar (DISTINTO_);}
"<"              {retornar (MENOR_);}
">"              {retornar (MAYOR_);}
">="             {retornar (MAYORIGUAL_);}
"<="             {retornar (MENORIGUAL_);}
"+"              {retornar (MAS_);}
"-"              {retornar (MENOS_);}
"*"              {retornar (POR_);}
"/"              {retornar (DIV_);}
"("              {retornar (OPAR_);}
")"              {retornar (CPAR_);}
"="              {retornar (IGUAL_);}
"!"              {retornar (NEGACION_);}
"["              {retornar (OCOR_);}
"]"              {retornar (CCOR_);}
"{"              {retornar (OLLAVE_);}
"}"              {retornar (CLLAVE_);}
";"              {retornar (PUNTOCOMA_);}
","              {retornar (COMA_);}
"."              {retornar (PUNTO_);}

{letra}({letra}|{digito}|_)*    {retornar (ID_)}
{digito}*\.?{digito}*          {retornar (CTE_);}
.                             {yyerror("Carácter desconocido");}




%%
int verbosidad = FALSE;

void yyerror(const char *msg){
  fprintf(stderr,"\nError en la linea %d: %s\n", yylineno, msg);
}

int main(int argc, char **argv) {
  int i, n=1;
  for (i=1; i<argc; ++i)
    if (strcmp(argv[i], "-v")==0) { verbosidad = TRUE; n++; }
  if (argc == n+1)
    if ((yyin = fopen (argv[n], "r")) == NULL)
      fprintf (stderr, "El fichero '%s' no es valido\n", argv[n]) ;
    else {
      if (verbosidad) printf("1.-  ");
      yylex ();
    }
  else fprintf (stderr, "Uso: cmc [-v] fichero\n");
  return (0);
}

