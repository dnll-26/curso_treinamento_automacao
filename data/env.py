import os
from dotenv import load_dotenv

# Carrega as variáveis do arquivo .env localizado na raiz
load_dotenv()

# Define as variáveis que o Robot Framework vai enxergar
USUARIO_PADRAO = os.getenv("USUARIO_PADRAO")
SENHA_PADRAO = os.getenv("SENHA_PADRAO")
USUARIO_BLOQUEADO = os.getenv("USUARIO_BLOQUEADO")