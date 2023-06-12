*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.amazon.com
${email}  ferhat@gmail.com
${name}  ferhat
${message}  thanks

*** Keywords ***
Start TestCase
    Open Browser  about:blank  chrome
    Maximize Browser Window
    Go To    ${URL}
    Get Selenium Implicit Wait

Close TestCase
    Close All Browsers

Verify Search Results
    Click Element    //a[@id='nav-logo-sprites']
    Click Element    //a[@href='/gift-cards/b/?ie=UTF8&node=2238192011&ref_=nav_cs_gc']
    Click Element    //img[@alt='Thank you']
    Click Element    //a[@id='a-autoid-0-announce']
    Click Element    //img[@src='https://m.media-amazon.com/images/I/51M9T8xA6AL._AC_UL400_.jpg']
    Click Element    //input[@id='gc-buy-box-atc']
    Click Button    //button[@id='gc-customization-type-button-Designs']
    Input Text     //textarea[@id='gc-order-form-recipients']    ${email}
    Input Text     //input[@id='gc-order-form-senderName']    ${name}
    Input Text     //textarea[@id='gc-order-form-message']    ${message}
    Click Element    //input[@id='gc-buy-box-atc']
    Element Should Be Visible    //span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold']

*** Test Cases ***
Test Case 2 : verify Gifts Cart has been added to cart
    [Tags]  regression

    Start TestCase
    Verify Search Results
    Close TestCase




