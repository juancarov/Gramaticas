import sys
import ply.lex as lex
import ply.yacc as yacc

tokens = ('A', 'B', 'SALTO_LINEA')
t_A = r'a'
t_B = r'b'
t_SALTO_LINEA = r'\n'

def t_error(t):
    t.lexer.skip(1)

lexer = lex.lex()

def p_lineas(p):
    '''
    lineas : lineas linea
           | linea
    '''
    pass

def p_linea_acepta(p):
    'linea : A sub_cadena B SALTO_LINEA'
    print("Acepta")

def p_linea_no_acepta(p):
    'linea : error SALTO_LINEA'
    print("No acepta")
    p.parser.errok()

def p_sub_cadena(p):
    '''
    sub_cadena :
               | A B sub_cadena
    '''
    pass

def p_error(p):
    pass

parser = yacc.yacc()

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
