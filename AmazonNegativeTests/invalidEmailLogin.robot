*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.amazon.com
${ex_email}  xxxxxxxxxxxxxxxxxxxx@


*** Keywords ***
Start TestCase
    Open Browser  about:blank  chrome
    Maximize Browser Window
    Go To    ${URL}
    Get Selenium Implicit Wait

Close TestCase
    Close All Browsers

Verify Search Results
    Click Element  id=nav-link-accountList-nav-line-1
    Input Text  id=ap_email    ${ex_email}
    Click Button  id=continue
    Element Should Be Visible   id=auth-error-message-box

*** Test Cases ***
Test Case 2 : verify unable to login with wrong email
    [Tags]  regression

    Start TestCase
    Verify Search Results
    Close TestCase