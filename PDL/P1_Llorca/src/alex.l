%{
#include <stdio.h>
#include "header.h"
#include "asin.h"
#define retornar(a) { if (verbosidad) ECHO; return(a); }
%}

%option yylineno

delimitador     [ \t\n]+
comentario      \/\/.*
letra           [a-zA-Z]
digito          [0-9]
constante       {digito}+(\.{digito}+)?
identificador   {letra}({letra}|{digito}|_)*

%%

{delimitador}   { if (verbosidad) ECHO;    }
{comentario}    { if (verbosidad) ECHO;    }

"read"          { retornar(READ_);         }
"print"         { retornar(PRINT_);        }
"if"            { retornar(IF_);           }
"else"          { retornar(ELSE_);         }
"elseif"        { retornar(ELSEIF_);       }
"while"         { retornar(WHILE_);        }
"do"            { retornar(DO_);           }
"int"           { retornar(INT_);          }
"bool"          { retornar(BOOL_);         }
"true"          { retornar(TRUE_);         }
"false"         { retornar(FALSE_);        }

"=="            { retornar(OPIGUAL_);      }
"!="            { retornar(OPNOTIGUAL_);   }
"+="            { retornar(MASIGUAL_);     }
"-="            { retornar(MENOSIGUAL_);   }
"*="            { retornar(PORIGUAL_);     }
"/="            { retornar(DIVIGUAL_);     }
"++"            { retornar(OPINCREMENTO_); }
"--"            { retornar(OPDECREMENTO_); }
"&&"            { retornar(OPAND_);        }
"||"            { retornar(OPOR_);         }
"<"             { retornar(COMPMENOR_);    }
">"             { retornar(COMPMAYOR_);    }
"<="            { retornar(COMPMENORIG_);  }
">="            { retornar(COMPMAYORIG_);  }
"="             { retornar(IGUAL_);        }
"+"             { retornar(OPSUMA_);       }
"-"             { retornar(OPRESTA_);      }
"*"             { retornar(OPMULT_);       }
"/"             { retornar(OPDIV_);        }
"%"             { retornar(OPMOD_);        }
"!"             { retornar(OPNOT_);        }
"("             { retornar(PARENTESIS1_);  }
")"             { retornar(PARENTESIS2_);  }
"{"             { retornar(LLAVE1_);       }
"}"             { retornar(LLAVE2_);       }
"["             { retornar(CORCHETE1_);    }
"]"             { retornar(CORCHETE2_);    }
";"             { retornar(SEMICOLON_);    }

{constante}     { retornar(CTE_);          }
{identificador} { retornar(ID_);           }
.               { printf("Error [%d]: %s\n", yylineno, yytext);   }

%%