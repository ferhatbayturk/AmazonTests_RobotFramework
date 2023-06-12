*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.amazon.com
${cust_name}  ferhat
${mobil}  5555555
${password}  1

*** Keywords ***
Start TestCase
    Open Browser  about:blank  chrome
    Maximize Browser Window
    Go To    ${URL}
    Get Selenium Implicit Wait

Close TestCase
    Close All Browsers

Verify Search Results
    Click Element    id=nav-link-accountList-nav-line-1
    Click Element    id=createAccountSubmit
    Input Text  id=ap_customer_name    ${cust_name}
    Input Text    id=ap_email    ${mobil}
    Input Text    //input[@id='ap_password']    ${password}
    Input Text    //input[@id='ap_password_check']    ${password}
    Click Button    id=continue
    Wait Until Element Is Visible    id=auth-password-invalid-password-alert
    Element Should Be Visible   id=auth-password-invalid-password-alert


*** Test Cases ***
Test Case 4 : Verify that registration cannot be made with a missing character password
    [Tags]  regression

    Start TestCase
    Verify Search Results
    Close TestCase