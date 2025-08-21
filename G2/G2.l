%{
#include "G2.tab.h"
%}

%%

[a]     { return A; }
[b]     { return B; }
\n      { return '\n'; }
.       { /* Ignorar cualquier otro carácter */ }

%%

int yywrap() {
    return 1;
}
