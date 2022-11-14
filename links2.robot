*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    ./spaces_off.py

Suite Setup     Open Browser    https://www.yle.fi/    Chrome
Suite Teardown    Close Browser

*** Test Cases ***

Verify Header Text Exists
    Maximize Browser Window
    Click Button     name=accept-all-consents
    ${elements}=    Get WebElements   xpath://a
    
    Create File And Append    ${elements}   
      


*** Keywords ***

Create File And Append

    [Arguments]    ${elements}

    Create File     ./linkkitesti.txt    
    
    FOR  ${elem}  IN  @{elements}
        ${elemText}=    Get Text    ${elem}        
        Append To File    ./linkkitesti.txt    ${elemText}\n  
    END

    REMOVE SPACES    linkkitesti.txt
        
    
    
    
   