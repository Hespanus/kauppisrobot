*** Settings ***
Documentation    Test thumbnail.py
Library          thumbnail.py


*** Test Cases ***
New imagename should contain _x250
    [Template]    Imagename ${imagename} should be transformed to ${expected}
    joku.jpg    joku_x250.jpg
    joku.toinen.png    joku.toinen_x250.png
    joku.toinen.kolmas.jpg    joku.toinen.kolmas_x250.jpg



*** Keywords ***
Imagename ${imagename} should be transformed to ${expected}
    ${new_name}=    Edit Img Name    ${imagename}
    Should Be Equal As Strings    ${new_name}    ${expected}