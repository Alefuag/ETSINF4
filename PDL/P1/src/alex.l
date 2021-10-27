%{
#include <stdio.h>
#include "header.h"
#define retornar(x){if(verbosidad) ECHO;}
%}


%option yylineno
delimitador   [ \t\n]+
digito        [0-9]
entero        {digito}+
letra         [A-z]

%%
{delimitador}    {if (verbosidad) ECHO;}
//[.*^(\n)](\n)  {if (verbosidad) ECHO;}
"int"            {return (INT_);}
"bool"           {return (BOOL_);}
"struct"         {return (STRUCT_);}
"return"         {return (RETURN_);}
"read"           {return (READ_);}
"if"             {return (IF_);}
"while"          {return (WHILE_);}
""               {return ();}

"+"               {return (MAS_);}
"-"               {return (MENOS_);}
"*"               {return (POR_);}
"/"               {return (DIV_);}
"("               {return (OPAR_);}
")"               {return (CPAR_);}
{letra}[{letra}-]*  {return (ID_)}
{digito}*.?{digito}*{return (CTE_);}
.                 {yyerror("Error, carácter desconocido");}




%%
void yyeror(const char *msg){
  fprintf(stderr,"\nError en la linea %d: %s\n", yylineno, msg);
}

int main(){
  yylex();
  return 0;
}
