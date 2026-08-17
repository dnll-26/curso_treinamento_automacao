*** Settings ***
Resource    ../resources/pages/login/login_pages.resource
Resource    ../resources/pages/products/products_pages.resource
Variables    ../data/env.py

Test Setup          Abrir Novo Browser    url=https://www.saucedemo.com/    
Test Teardown    Fechar Navegador

Test Tags               allure.layer:ui    allure.epic:products

Name                Products

*** Test Cases ***