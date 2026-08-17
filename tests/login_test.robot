*** Settings ***
Resource    ../resources/pages/login/login_pages.resource
Resource    ../resources/pages/products/products_pages.resource
Variables    ../data/env.py

Test Setup          Abrir Novo Browser    url=https://www.saucedemo.com/    
Test Teardown    Fechar Navegador

Test Tags               allure.layer:ui    allure.epic:login

Name                Login

*** Test Cases ***
CT01 - Realizar Login Com Sucesso
    [Documentation]    
    ...    Testa a autenticação com credenciais válidas e valida o acesso à página de produtos.
    [Tags]
    ...    allure.story:login_com_sucesso
    ...    allure.severity:critical
    ...    allure.issue:https://www.atlassian.com/br/software/jira/templates/scrum

    Preencher Usuário    usuario=${USUARIO_PADRAO}
    Preencher Senha    senha=${SENHA_PADRAO}
    Botão Realizar Login
    Visualizar Tela Inicial De Produtos

CT02 - Reliza Login Sem Sucesso
    [Documentation]
    ...    Garante que um usuário bloqueado seja impedido de logar e receba a mensagem de alerta apropriada.
    [Tags]
    ...    allure.story:login_com_usuario_bloqueado
    ...    allure.severity:normal
    ...    allure.issue:https://www.atlassian.com/br/software/jira/templates/scrum

    Preencher Usuário    usuario=${USUARIO_BLOQUEADO}
    Preencher Senha    senha=${SENHA_PADRAO}
    Botão Realizar Login
    Run Keyword And Expect Error    *    Visualizar Tela Inicial De Produtos