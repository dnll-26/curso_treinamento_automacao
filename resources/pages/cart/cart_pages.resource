*** Settings ***
Resource    ../../imports/package.resource
Variables    ../../element/cart/cart_element.py

*** Keywords ***
Botão Checkout
    Wait Until Element Is Enabled    ${CART_BTN_CHECKOUT}
    Click Element    ${CART_BTN_CHECKOUT}

Visualizar Produtos No Carrinho
    [Arguments]    ${nome_produto}

    ${locator_produto}=    Set Variable    
    ...    //*[contains(@class, "cart_list")]//*[./div[contains(text(), "${nome_produto}")]]

    Wait Until Element Is Visible    ${locator_produto}