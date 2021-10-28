%{
    #include <stdio.h>
    extern int yylineno
%}

// Palabras reservadas
%token INT_ BOOL_ STRUCT_ RETURN_ READ_ IF_ ELSE_ WHILE_ PRINT_ TRUE_ FALSE_
// Delimitadores
%token OPAR_ CPAR_ OCOR_ CCOR_ OLLAVE_ CLLAVE
//Operadores
%token AND_ OR_ IGUALIGUAL_ DISTINTO_ MENOR_ MAYOR_ MENORIGUAL_ MAYORIGUAL_ MAS_ MENOS_ POR_ DIV_ IGUAL_ NEGACION_
//Punto coma
%token PUNTOCOMA_ COMA_ PUNTO_


%%






%%



