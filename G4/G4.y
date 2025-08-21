%{
#include <stdio.h>

void yyerror(const char *s);
extern int yylex();
extern FILE *yyin;

%}

%token AB ABB

%start lineas

%%

lineas: /* vacio */
      | lineas linea
      ;

linea: AB '\n' { printf("Acepta\n"); }
     | ABB '\n' { printf("Acepta\n"); }
     | error '\n' { printf("No acepta\n"); yyerrok; }
     ;

%%

void yyerror(const char *s) {
    // La funcion se deja vacia
}

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Error al abrir el archivo");
            return 1;
        }
        yyin = file;
    }
    yyparse();
    return 0;
}
