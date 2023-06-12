*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.amazon.com
${search}  nutella

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
    Element Should Be Visible  //span[@class='a-color-state a-text-bold']

*** Test Cases ***
Test Case 3 : verify searchability in search box
    [Tags]  regression

   Start TestCase
    Verify Search Results
    Close TestCase



