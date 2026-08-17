*** Settings ***
Resource    ../resources/pages/login/login_pages.resource
Resource    ../resources/pages/products/products_pages.resource
Resource    ../resources/pages/cart/cart_pages.resource
Resource    ../resources/pages/checkout/checkout_pages.resource
Resource    ../resources/pages/overview/overview_pages.resource
Variables    ../data/env.py


Suite Setup    Run Keywords    
...    Abrir Novo Browser    
...    url=https://www.saucedemo.com/    
...    AND    Preencher Usuário    usuario=${USUARIO_PADRAO}    
...    AND    Preencher Senha    senha=${SENHA_PADRAO}    
...    AND    Botão Realizar Login    
...    AND    Visualizar Tela Inicial De Produtos

Test Tags               allure.layer:ui    allure.epic:products

Name                Products

*** Test Cases ***
CT01 - Realiza Compras
    [Documentation]    
    ...    Testa a autenticação com credenciais válidas e valida o acesso à página de produtos.
    [Tags]
    ...    allure.story:login_com_sucesso
    ...    allure.severity:critical
    ...    allure.issue:https://www.atlassian.com/br/software/jira/templates/scrum

    Visualizar Tela Inicial De Produtos
    Adicionar Item Ao Carrinho De Compras    produto=Sauce Labs Backpack
    Botão Carrinho De Compras
    Visualizar Produtos No Carrinho    nome_produto=Sauce Labs Backpack
    Botão Checkout
    Preencher Inormações De Checkout
    Visualizar Produto    nome_produto=Sauce Labs Backpack
    ${preco_item_element}    
    ...    ${tax_item_element}=    Retorna Valor E Taxa Do Produto
    ${total}=    Calcula Price Total    
    ...    preco_item=${preco_item_element}    
    ...    preco_tax=${tax_item_element}
    Visualizar E Validar Preço Total    preco_total=${total}
    Botão Finish
    Visualizar Mensagem De Sucesso De Compra