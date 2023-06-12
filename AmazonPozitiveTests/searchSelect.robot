*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.amazon.com
${search}  apple
${select}  Electronics

*** Keywords ***
Start TestCase
    Open Browser  about:blank  chrome
    Maximize Browser Window
    Go To    ${URL}
    Get Selenium Implicit Wait

Close TestCase
    Close All Browsers

Verify Search Results
    Select From List By Label    //select[@id='searchDropdownBox']  ${select}
    Input Text    id=twotabsearchtextbox    ${search}
    Click Element    id=nav-search-submit-button
    Element Should Be Visible   //*[@class='a-section a-spacing-small a-spacing-top-small']


*** Test Cases ***
Test Case 5 : filters the searched item in the search box from the dropdown menu
    [Tags]  regression

   Start TestCase
    Verify Search Results
    Close TestCase