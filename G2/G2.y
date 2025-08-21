%{
#include <stdio.h>

void yyerror(const char *s);
extern int yylex();
extern FILE *yyin;

%}

%token A B

%start lineas

%%

lineas: /* vacio */
      | lineas linea
      ;

linea: cadena '\n' { printf("Acepta\n"); }
     | error '\n' { printf("No acepta\n"); yyerrok; }
     ;

cadena: B
      | A cadena B
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
