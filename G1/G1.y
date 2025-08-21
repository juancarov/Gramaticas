%{
#include <stdio.h>

void yyerror(const char *s);
extern int yylex();
extern FILE *yyin;

%}

%token CERO UNO

%start lineas

%%

lineas: /* vacio */
      | lineas linea
      ;

linea: cadena '\n' { printf("Es capicua\n"); }
     | error '\n' { printf("No es capicua\n"); yyerrok; }
     ;

cadena: /* vacio */
      | CERO
      | UNO
      | CERO cadena CERO
      | UNO cadena UNO
      ;

%%

void yyerror(const char *s) {
    // Esta función se queda vacía
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
