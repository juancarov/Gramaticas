%{
#include "G4.tab.h"
%}

%%

abb     { return ABB; }
ab      { return AB; }
\n      { return '\n'; }
.       { /* Ignorar cualquier otro caracter */ }

%%

int yywrap() {
    return 1;
}
