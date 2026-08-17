*** Settings ***
Resource    ../resources/pages/login/login_pages.resource

Test Setup          Abrir Novo Browser    url=https://www.saucedemo.com/    
Test Teardown    Fechar Navegador

Test Tags               allure.layer:ui    allure.epic:login

Name                Login

*** Test Cases ***
CT01 - Realizar Login Com Sucesso
    [Documentation]
    ...    Cenário responsável por salvar oportunidades de melhoria em modo rascunho.
    ...
    ...    **Jira: Histórias | Melhorias**
    ...    - QA-1437 Salvar Rascunho
    [Tags]
    ...    allure.story:login_com_sucesso
    ...    allure.severity:critical
    ...    allure.issue:https://www.atlassian.com/br/software/jira/templates/scrum

    Preencher Usuário    usuario=standard_user
    Preencher Senha    senha=secret_sauce
    Botão Realizar Login
