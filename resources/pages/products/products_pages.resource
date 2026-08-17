*** Settings ***
Resource    ../../imports/package.resource
Variables    ../../element/products/products_element.py

*** Keywords ***
Visualizar Tela Inicial De Produtos
    Wait Until Element Is Visible    ${PRODUCTS_INVENTORY}

Adicionar Item Ao Carrinho De Compras
    [Arguments]    ${produto}

    ${locator_produto_marcado}=    Set Variable    
    ...    //*[./div[contains(text(), "${produto}")]]/following::*${PRODUCTS_INVENTORY_BTN_ADD_CART}

    ${locator_produto_remover}=    Set Variable    
    ...    //*[./div[contains(text(), "Sauce Labs Backpack")]]/following::*${PRODUCTS_INVENTORY_BTN_REMOVE}   

    Wait Until Element Is Visible    ${locator_produto_marcado}
    Click Element    ${locator_produto_marcado}
    Wait Until Element Is Visible    ${locator_produto_remover}

Botão Carrinho De Compras
    Wait Until Element Is Enabled    ${PRODUCTS_INVENTORY_BTN_CART}
    Click Element    ${PRODUCTS_INVENTORY_BTN_CART}


    