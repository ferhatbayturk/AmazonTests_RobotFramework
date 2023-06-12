*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.amazon.com

*** Keywords ***
Start TestCase
    Open Browser  about:blank  chrome
    Maximize Browser Window
    Go To    ${URL}
    Get Selenium Implicit Wait

Close TestCase
    Close All Browsers

Verify Search Results
    Click Element  //span[@class='nav-cart-icon nav-sprite']
    Element Should Be Visible  //h2[normalize-space()='Your Amazon Cart is empty']

*** Test Cases ***
Test Case 1 : verifies the empty cart
    [Tags]  regression

    Start TestCase
    Verify Search Results
    Close TestCase
