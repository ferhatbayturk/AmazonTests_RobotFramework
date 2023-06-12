*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.amazon.com
${search}  apple
${ex_email}  talentyandferhat@gmail.com

*** Keywords ***
Start TestCase
    Open Browser  about:blank  chrome
    Maximize Browser Window
    Go To    ${URL}
    Get Selenium Implicit Wait

Close TestCase
    Close All Browsers

Verify Search Results
    Input Text  id=twotabsearchtextbox    ${search}
    Click Button  id=nav-search-submit-button
    Click Element  //img[@alt='Apple AirPods Pro (2nd Generation) Wireless Earbuds, Up to 2X More Active Noise Cancelling, Adaptive Transparency, Persona...']
    Click Element  //span[@id='exportAlternativeTriggerButton']
    Click Element  //span[@id='a-autoid-4']//input[@type='submit']
    Click Element  //a[@href='/gp/cart/view.html?ref_=nav_cart']
    Click Element  //input[@name='proceedToRetailCheckout']
    Input Text  //input[@id='ap_email']    ${ex_email}
    Click Button  //input[@id='continue']
    Element Should Be Visible  id=auth-error-message-box
    

*** Test Cases ***
Test Case 5 : Verify that you can't proceed with the wrong email to get to the checkout page
    [Tags]  regression

    Start TestCase
    Verify Search Results
    Close TestCase




