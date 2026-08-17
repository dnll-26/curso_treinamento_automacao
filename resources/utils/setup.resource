*** Settings ***
Library    SeleniumLibrary    screenshot_root_directory=EMBED


*** Keywords ***
Abrir Novo Browser
    [Arguments]    ${url}    ${alias}=browser_principal
    
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --disable-gpu

    ${browser_type}=    Get Variable Value    ${BROWSER}    chrome
    Open Browser    ${url}    ${browser_type}    options=${chrome_options}
    Maximize Browser Window