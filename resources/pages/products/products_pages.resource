*** Settings ***
Resource    ../../imports/package.resource
Variables    ../../element/products/products_element.py

*** Keywords ***
Visualizar Tela Inicial De Produtos
    Wait Until Element Is Visible    ${PRODUCTS_INVENTORY}