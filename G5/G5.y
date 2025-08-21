%{
#include <stdio.h>

void yyerror(const char *s);
extern int yylex();
extern FILE *yyin;

%}

%token A B

%start lineas

%%

lineas: 
      | lineas linea
      ;

linea: A sub_cadena B '\n' { printf("Acepta\n"); }
     | error '\n' { printf("No acepta\n"); yyerrok; }
     ;

sub_cadena: 
          | A B sub_cadena
          ;

%%

void yyerror(const char *s) {
    
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
