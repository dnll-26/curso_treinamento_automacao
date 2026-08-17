*** Settings ***
Library    SeleniumLibrary    screenshot_root_directory=EMBED


*** Keywords ***
Abrir Novo Browser
    [Arguments]    ${url}    ${alias}=browser_principal
    
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    
    # 1. Configura as preferências para desativar o alerta de vazamento e o gerenciador de senhas
    ${prefs}=    Create Dictionary
    ...    credentials_enable_service=${FALSE}
    ...    profile.password_manager_enabled=${FALSE}
    ...    profile.password_manager_leak_detection=${FALSE}
    
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    
    # 2. Argumentos de execução (seus argumentos + supressão de popups de senha)
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --disable-save-password-bubble
    Call Method    ${chrome_options}    add_argument    --disable-notifications

    ${browser_type}=    Get Variable Value    ${BROWSER}    chrome
    Open Browser    ${url}    ${browser_type}    options=${chrome_options}    alias=${alias}
    Maximize Browser Window