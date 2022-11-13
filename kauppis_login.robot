*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${username}    %{kauppis_username}
${password}    %{kauppis_password}

*** Keywords ***
Log In To Kauppis 
    Open Browser    https://uat.tanhi-systems.net/tanhi/kauppis/login    Chrome 
    Maximize Browser Window
    Sleep    2s

    Input Text    id=mat-input-0    ${username}
    Input Password    id=mat-input-1    ${password}
    
    Click Button     xpath:/html/body/app-root/div/div/app-login/div/form[1]/button
    Sleep    3s
    Go To    https://uat.tanhi-systems.net/tanhi/kauppis/item/add