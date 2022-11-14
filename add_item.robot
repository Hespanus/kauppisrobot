*** Settings ***
Documentation    Testing login to Kauppis with data from excel
Library    DataDriver    kauppis_login.xlsx    sheet_name=Taul1
Library    SeleniumLibrary
Library    ./thumbnail.py
Resource    ./kauppis_login.robot
Suite Setup    Log In To Kauppis
#Suite Teardown    Close Browser
Test Template    New Item


#Suite Teardown    Close Browser


*** Test Cases ***
Submit New Item In Kauppis ${nimi}        
    


*** Keywords ***
New Item
    [Arguments]    ${kuva}    ${nimi}    ${hinta}       ${varastossa}    ${ostettavissa}      ${piilota}   	${tuoteselostus}	${painoyks}    ${p-maara}	${valmistaja}	${kategoria}
    Sleep    2s

    Click Element    //*[@value="2"]    

    ${image_thumb}=    Edit Img name    ${kuva}

    Log To Console    ${image_thumb}

    Sleep    3s

    Scroll Element Into View    xpath=//img[contains(@src, '${image_thumb}')]

    Click Image     xpath=//img[contains(@src, '${image_thumb}')]

    Sleep    1s

    Input Text    id=mat-input-0    ${nimi}
    Input Text    id=mat-input-1    ${hinta}
    Input Text    id=mat-input-2    ${varastossa}

    IF    ${ostettavissa}
        Click Element    id=mat-radio-2    
    ELSE
        Click Element    id=mat-radio-3 
    END

    IF    ${piilota}
        Click Element    id=mat-radio-5
    ELSE
        Click Element    id=mat-radio-6
    END
    
    Input Text    id=mat-input-3    ${tuoteselostus}

    Click Element    Id=mat-select-0

    IF    '${painoyks}' == 'kg'
        Click Element    id=mat-option-0
    ELSE
        Click Element    id=mat-option-1
    END
    
    Input Text    id=mat-input-4   ${p-maara}

    Input Text    id=mat-input-5   ${valmistaja}

    Click Element       //button[contains(text(),'Tuotteen kategoriat')]
    Sleep    1s

    Input Text   xpath=//div[@id='cdk-accordion-child-0']/div/div/div[2]/mat-card/mat-form-field/div/div/div/input    ${kategoria}

    Sleep    1s

    Click Element   xpath=//button[contains(.,'${kategoria}')]

    Sleep    1s

    Click Button   xpath=//button[@type='submit']

    Sleep    3s

    Go To    https://uat.tanhi-systems.net/tanhi/kauppis/item/add

    #Click Element       //button[contains(text(),'Sulje')]

    #Click Element       //button[contains(text(),'Lisää')]








    


    