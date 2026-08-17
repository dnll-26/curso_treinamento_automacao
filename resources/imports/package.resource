*** Settings ***
Documentation    Gerenciador de Dependências Global da Automação

# --- Bibliotecas Nativas e Externas ---
Library    SeleniumLibrary    screenshot_root_directory=EMBED
# --- Utilidades de Ambiente ---
Resource            ../utils/setup.resource
Resource            ../utils/teardown.resource
