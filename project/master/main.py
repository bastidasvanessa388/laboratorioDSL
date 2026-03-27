import sys
import os

sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from antlr4 import *
from antlr4.error.ErrorListener import ConsoleErrorListener
from parser.DevOpsDSLLexer import DevOpsDSLLexer
from parser.DevOpsDSLParser import DevOpsDSLParser
from interpreter.interpreter import Interpreter
from executor.executor import Executor


def mostrar_tokens(input_stream):
    """Muestra todos los tokens generados por el Lexer"""
    lexer = DevOpsDSLLexer(input_stream)
    tokens = CommonTokenStream(lexer)
    tokens.fill()

    print("=" * 60)
    print("  FASE 1: TOKENS GENERADOS POR EL LEXER")
    print("=" * 60)

    nombres = lexer.symbolicNames

    for token in tokens.tokens:
        if token.type != Token.EOF:
            tipo = nombres[token.type] if token.type < len(nombres) else "UNKNOWN"
            print(f"  Token: {str(token.text):<20} Tipo: {tipo}")

    print("=" * 60)
    print()


def main():
    print("\n" + "=" * 60)
    print("  SISTEMA DSL DEVOPS - INTÉRPRETE DISTRIBUIDO")
    print("=" * 60 + "\n")

    file = "script.dsl"
    if len(sys.argv) > 1:
        file = sys.argv[1]

    if not os.path.exists(file):
        print(f"[ERROR] No existe el archivo: {file}")
        return

    # ── FASE 1: MOSTRAR TOKENS ──────────────────────────────
    input_stream = FileStream(file)
    mostrar_tokens(input_stream)

    # ── FASE 2: ÁRBOL SINTÁCTICO ────────────────────────────
    input_stream = FileStream(file)
    lexer = DevOpsDSLLexer(input_stream)
    tokens = CommonTokenStream(lexer)
    parser = DevOpsDSLParser(tokens)

    parser.removeErrorListeners()
    parser.addErrorListener(ConsoleErrorListener())

    tree = parser.program()

    print("=" * 60)
    print("  FASE 2: ÁRBOL SINTÁCTICO")
    print("=" * 60)
    print(tree.toStringTree(recog=parser))
    print()
    print("=" * 60)
    print()

    # ── FASE 3: INTERPRETACIÓN Y EJECUCIÓN ─────────────────
    print("=" * 60)
    print("  FASE 3: INTERPRETACIÓN Y EJECUCIÓN")
    print("=" * 60 + "\n")

    executor = Executor()
    interpreter = Interpreter(executor)
    interpreter.visit(tree)


if __name__ == "__main__":
    main()
