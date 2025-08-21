%{
#include "G5.tab.h"
%}

%%

a     { return A; }
b     { return B; }
\n      { return '\n'; }
.       { }

%%

int yywrap() {
    return 1;
}
