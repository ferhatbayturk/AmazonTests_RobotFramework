*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.amazon.com
${search}  nutella
${price}  55

*** Keywords ***
Start TestCase
    Open Browser  about:blank  chrome
    Maximize Browser Window
    Go To    ${URL}
    Get Selenium Implicit Wait

Close TestCase
    Close All Browsers

Verify Search Results
    Input Text    id=twotabsearchtextbox    ${search}
    Click Button     id=nav-search-submit-button
    Input Text    //input[@id='high-price']    ${price}
    Click Button    //input[@class='a-button-input']
    Element Should Be Visible  //div[@class='a-section a-spacing-small a-spacing-top-small']


*** Test Cases ***
Test Case 4 : verify filtering price of searched product
    [Tags]  regression

    Start TestCase
    Verify Search Results
    Close TestCase