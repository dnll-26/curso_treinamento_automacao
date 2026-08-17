*** Settings ***
Resource    ../../imports/package.resource
Variables    ../../element/overview/overview_element.py

*** Keywords ***
Visualizar Produto
    [Arguments]    ${nome_produto}
    
    ${locator_produto}=    Set Variable    
    ...    //*[contains(@class, "cart_list")]//*[./div[contains(text(), "${nome_produto}")]]

Retorna Valor E Taxa Do Produto
    ${preco_item_element}=    
    ...    Get Text    
    ...    ${OVERVIEW_LABEL_PRICE_ITEM}    

    # Divide o texto em uma lista de palavras
    ${partes}=    Split String    ${preco_item_element}    ${SPACE}   

    # Esperado: [preco]
    ${preco_item}=    Get From List    ${partes}    -1   

    ${tax_item_element}=    
    ...    Get Text    
    ...    ${OVERVIEW_LABEL_PRICE_TAX_ITEM}    

    # Divide o texto em uma lista de palavras
    ${partes}=    Split String    ${tax_item_element}    ${SPACE}   

    # Esperado: [preco]
    ${tax_item}=    Get From List    ${partes}    -1 

    RETURN    ${preco_item}    ${tax_item}

Calcula Price Total
    [Arguments]    
    ...    ${preco_item}    
    ...    ${preco_tax}

    ${total}=    Calcular Preco Total E Validar    
    ...    item_total=${preco_item}    
    ...    tax=${preco_tax}
    
    RETURN    ${total}

Visualizar E Validar Preço Total
    [Arguments]    ${preco_total}

    Wait Until Page Contains    ${preco_total}    

Botão Finish
    Click Element    ${OVERVIEW_BTN_FINISH}

Visualizar Mensagem De Sucesso De Compra
    Wait Until Page Contains    Thank you for your order!    