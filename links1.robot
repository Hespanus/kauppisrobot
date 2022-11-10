*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem

Suite Setup     Open Browser    https://www.yle.fi/    Chrome
Suite Teardown    Close Browser

*** Test Cases ***

Verify Header Text Exists
    Click Button     name=accept-all-consents
    ${elements}=    Get Element Count   xpath://a
    

   # @{links}    Create List
    
    Create File     ./linkkitesti.txt    
    
    FOR  ${i}  IN RANGE    1    ${elements}
        ${elemText}=    Get Text    xpath:(//a)[${i}]       
        Append To File    ./linkkitesti.txt    ${elemText}\n  
    END
      

   
        
    
    
    
   