*** Settings ***
Resource    ../../imports/package.resource
Variables    ../../element/checkout/checkout_element.py

*** Keywords ***
Preencher Informações De Checkout
    ${fist_name}=    FakerLibrary.Name
    ${last_name}=    FakerLibrary.Last Name
    ${postal_code}=    FakerLibrary.Postcode
    
    Input Text    ${CHECKOUT_INPUT_FIST_NAME}    ${fist_name}   

    Input Text    ${CHECKOUT_INPUT_LAST_NAME}    ${last_name} 

    Input Text    ${CHECKOUT_INPUT_POSTAL_CODE}    ${postal_code}

    Click Element    ${CHECKOUT_BTN_CONTINUE}

