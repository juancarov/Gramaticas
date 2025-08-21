import sys
import ply.lex as lex
import ply.yacc as yacc

# --- Parte 1: El Analizador Léxico ---
tokens = ('CERO', 'UNO', 'SALTO_LINEA')
t_CERO = r'0'
t_UNO = r'1'
t_SALTO_LINEA = r'\n'

def t_error(t):
    t.lexer.skip(1)

lexer = lex.lex()

# --- Parte 2: El Analizador Sintáctico ---
def p_lineas(p):
    '''
    lineas : lineas linea
           | linea
    '''
    pass

def p_linea_capicua(p):
    'linea : capicua SALTO_LINEA'
    print("Es capicua")

def p_linea_no_capicua(p):
    'linea : error SALTO_LINEA'
    print("No es capicua")

# Regla para una cadena capicúa
def p_capicua(p):
    '''
    capicua :
            | CERO
            | UNO
            | CERO capicua CERO
            | UNO capicua UNO
    '''
    pass

# Manejo de errores de sintaxis
def p_error(p):
    pass

parser = yacc.yacc()

# --- Parte 3: La Lógica Principal ---
if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Uso: python analizador.py <nombre_de_archivo>")
        sys.exit(1)

    archivo = sys.argv[1]

    try:
        with open(archivo, "r") as f:
            data = f.read()
            parser.parse(data)
    except FileNotFoundError:
        print(f"Error: El archivo '{archivo}' no se encontró.")
        sys.exit(1)
