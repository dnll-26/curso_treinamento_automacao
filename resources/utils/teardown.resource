*** Settings ***
Library    SeleniumLibrary    screenshot_root_directory=EMBED


*** Keywords ***
Fechar Navegador
    Capture Page Screenshot    EMBED    
    Close Browser