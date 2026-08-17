*** Settings ***
Documentation    Gerenciador de Dependências Global da Automação

# --- Bibliotecas Nativas e Externas ---
Library    SeleniumLibrary    screenshot_root_directory=EMBED
Library    String
Library    Collections
Library    FakerLibrary    locale=pt_BR
# --- Lib Python ---
Library    ../../lib/calc_itens.py
# --- Utilidades de Ambiente ---
Resource            ../utils/setup.resource
Resource            ../utils/teardown.resource
