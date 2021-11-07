%{
    #include <stdio.h>
    #include "header.h"
%}

%token OPSUMA_ OPRESTA_ OPMULT_ OPDIV_ OPMOD_ OPAND_ OPOR_ OPNOT_ OPINCREMENTO_ OPDECREMENTO_
%token COMPMAYOR_ COMPMENOR_ COMPMAYORIG_ COMPMENORIG_ OPIGUAL_ OPNOTIGUAL_
%token IGUAL_   MASIGUAL_   MENOSIGUAL_ PORIGUAL_   DIVIGUAL_
%token WHILE_   DO_   IF_   ELSEIF_     ELSE_
%token INT_     BOOL_
%token READ_    PRINT_
%token CTE_     ID_     TRUE_   FALSE_
%token LLAVE1_  LLAVE2_ PARENTESIS1_ PARENTESIS2_ CORCHETE1_ CORCHETE2_ SEMICOLON_

%%

programa
    : LLAVE1_ secuencia_sentencias LLAVE2_
    ;

secuencia_sentencias
    : sentencia
    | secuencia_sentencias sentencia
    ;

sentencia
    : declaracion
    | instruccion
    ;

declaracion
    : tipo_simple ID_ SEMICOLON_
    | tipo_simple ID_ CORCHETE1_ CTE_ CORCHETE2_ SEMICOLON_
    ;

tipo_simple
    : INT_
    | BOOL_
    ;

instruccion
    : LLAVE1_ lista_instrucciones LLAVE2_
    | instruccion_entrada_salida
    | instruccion_expresion
    | instruccion_seleccion
    | instruccion_iteracion
    ;

lista_instrucciones
    : lista_instrucciones instruccion
    | /* instruccion vacia */
    ;

instruccion_expresion
    : expresion SEMICOLON_
    | SEMICOLON_
    ;

instruccion_entrada_salida
    : READ_  PARENTESIS1_ ID_       PARENTESIS2_ SEMICOLON_
    | PRINT_ PARENTESIS1_ expresion PARENTESIS2_ SEMICOLON_
    ;

instruccion_seleccion
    : IF_ PARENTESIS1_ expresion PARENTESIS2_ instruccion resto_if
    ;

resto_if
    : ELSEIF_ PARENTESIS1_ expresion PARENTESIS2_ instruccion resto_if
    | ELSE_ instruccion
    ;

instruccion_iteracion
    : WHILE_ PARENTESIS1_ expresion PARENTESIS2_ instruccion
    | DO_ instruccion WHILE_ PARENTESIS1_ expresion PARENTESIS2_
    ;

expresion
    : expresion_logica
    | ID_ operador_asignacion expresion
    | ID_ CORCHETE1_ expresion CORCHETE2_ operador_asignacion expresion
    ;

expresion_logica
    : expresion_igualdad
    | expresion_logica operador_logico expresion_igualdad
    ;

expresion_igualdad
    : expresion_relacional
    | expresion_igualdad operador_igualdad expresion_relacional
    ;

expresion_relacional
    : expresion_aditiva
    | expresion_relacional operador_relacional expresion_aditiva
    ;

expresion_aditiva
    : expresion_multiplicativa
    | expresion_aditiva operador_aditivo expresion_multiplicativa
    ;

expresion_multiplicativa
    : expresion_unaria
    | expresion_multiplicativa operador_multiplicativo expresion_unaria
    ;

expresion_unaria
    : expresion_sufija
    | operador_unario expresion_unaria
    | operador_incremento ID_
    ;

expresion_sufija
    : PARENTESIS1_ expresion PARENTESIS2_
    | ID_ operador_incremento
    | ID_ CORCHETE1_ expresion CORCHETE2_
    | ID_
    | CTE_
    | TRUE_
    | FALSE_
    ;

operador_asignacion
    : IGUAL_
    | MASIGUAL_
    | MENOSIGUAL_
    | PORIGUAL_
    | DIVIGUAL_
    ;

operador_logico
    : OPAND_
    | OPOR_
    ;

operador_igualdad
    : OPIGUAL_
    | OPNOTIGUAL_
    ;

operador_relacional
    : COMPMAYOR_
    | COMPMENOR_
    | COMPMAYORIG_
    | COMPMENORIG_
    ;

operador_aditivo
    : OPSUMA_
    | OPRESTA_
    ;

operador_multiplicativo
    : OPMULT_
    | OPDIV_
    | OPMOD_
    ;

operador_unario
    : OPSUMA_
    | OPRESTA_
    | OPNOT_
    ;

operador_incremento
    : OPINCREMENTO_
    | OPDECREMENTO_
    ;

%%