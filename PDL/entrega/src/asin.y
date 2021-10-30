%{
#include <stdio.h>
#include <string.h>
#include "../include/header.h"

extern int yylineno;
%}


// Palabras reservadas
%token INT_ BOOL_ STRUCT_ RETURN_ READ_ IF_ ELSE_ WHILE_ PRINT_ TRUE_ FALSE_
// Delimitadores
%token OPAR_ CPAR_ OCOR_ CCOR_ OLLAVE_ CLLAVE_
// Operadores
%token AND_ OR_ IGUALIGUAL_ DISTINTO_ MENOR_ MAYOR_ MENORIGUAL_ MAYORIGUAL_ MAS_ MENOS_ POR_ DIV_ IGUAL_ NEGACION_
// Punto coma
%token PUNTOCOMA_ COMA_ PUNTO_
// Valores
%token ID_ CTE_

%%

programa : listaDeclaraciones
         ;

listaDeclaraciones : declaracion
                   | listaDeclaraciones declaracion
                   ;

declaracion : declaracionVariable
            | declaracionFuncion
            ;

declaracionVariable : tipoSimple ID_ PUNTOCOMA_
                    | tipoSimple ID_ OCOR_ CTE_ CCOR_ PUNTOCOMA_
                    | STRUCT_ OLLAVE_ listaCampos CLLAVE_ ID_ PUNTOCOMA_
                    ;

tipoSimple : INT_ 
           | BOOL_
           ;

listaCampos : tipoSimple ID_ PUNTOCOMA_
            | listaCampos tipoSimple ID_ PUNTOCOMA_
            ;

declaracionFuncion : tipoSimple ID_ OPAR_ parametrosFormales CPAR_ bloque
                   ;

parametrosFormales : 
                   | listaParametrosFormales
                   ;

listaParametrosFormales : tipoSimple ID_ 
                      | tipoSimple ID_ COMA_ listaParametrosFormales
                      ;

bloque : OLLAVE_ declaracionVariableLocal listaInstrucciones RETURN_ expresion PUNTOCOMA_ CLLAVE_

declaracionVariableLocal :  
                         | declaracionVariableLocal declaracionVariable
                         ;

listaInstrucciones :  
                   | listaInstrucciones instruccion 
                   ;

instruccion : OLLAVE_ listaInstrucciones CLLAVE_ 
            | instruccionAsignacion
            | instruccionSeleccion
            | instruccionEntradaSalida
            | instruccionIteracion
            ;

instruccionAsignacion : ID_ IGUAL_ expresion PUNTOCOMA_
                      | ID_ OCOR_ expresion CCOR_ IGUAL_ expresion PUNTOCOMA_
                      | ID_ PUNTO_ ID_ IGUAL_ expresion PUNTOCOMA_
                      ;

instruccionEntradaSalida : READ_ OPAR_ ID_ CPAR_ PUNTOCOMA_
                         | PRINT_ OPAR_ expresion CPAR_ PUNTOCOMA_
                         ;

instruccionSeleccion : IF_ OPAR_ expresion CPAR_ instruccion ELSE_ instruccion
                     ;

instruccionIteracion : WHILE_ OPAR_ expresion CPAR_ instruccion
                     ;

expresion : expresionIgualdad 
          | expresion operadorLogico expresionIgualdad
          ;

expresionIgualdad : expresionRelacional
                  | expresionIgualdad operadorIgualdad expresionRelacional
                  ;

expresionRelacional : expresionAditiva
                    | expresionRelacional operadorRelacional expresionAditiva
                    ;

expresionAditiva : expresionMultiplicativa 
                 | expresionAditiva operadorAditivo expresionMultiplicativa
                 ;

expresionMultiplicativa : expresionUnaria 
                        | expresionMultiplicativa operadorMultiplicativo expresionUnaria
                        ;

expresionUnaria : expresionSufija 
                | operadorUnario expresionUnaria
                ;

expresionSufija : constante 
                | OPAR_ expresion CPAR_ 
                | ID_
                | ID_ PUNTO_ ID_
                | ID_ OCOR_ expresion CCOR_
                | ID_ OPAR_ parametrosActuales CPAR_
                ;

constante : CTE_
          | TRUE_
          | FALSE_
          ;

parametrosActuales :  
                   | listaParametrosActuales
                   ;

listaParametrosActuales : expresion
                        | expresion COMA_ listaParametrosActuales
                        ;

operadorLogico : AND_
               | OR_
               ;

operadorIgualdad : IGUALIGUAL_
                 | DISTINTO_
                 ;

operadorRelacional : MAYOR_
                   | MENOR_
                   | MAYORIGUAL_
                   | MENORIGUAL_
                   ;

operadorAditivo : MAS_
                | MENOS_
                ;

operadorMultiplicativo : POR_
                       | DIV_
                       ;

operadorUnario : MAS_
               | MENOS_
               | NEGACION_


%%
