*** Settings ***
Resource    ../../imports/package.resource
Variables    ../../element/login/login_element.py

*** Keywords ***
Preencher Usuário
    [Arguments]    ${usuario}

    Wait Until Element Is Visible    
    ...    ${USERNAME_CAMPO}
    Input Text    
    ...    ${USERNAME_CAMPO}    
    ...    ${usuario}

Preencher Senha
    [Arguments]    ${senha}

    Wait Until Element Is Visible    
    ...    ${PASSWORD_CAMPO}
    Input Password    
    ...    ${PASSWORD_CAMPO}    
    ...    ${senha}

Botão Realizar Login
    Click Element    ${BTN_LOGIN}