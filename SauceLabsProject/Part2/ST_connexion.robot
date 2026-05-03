*** Settings ***
Documentation    Code factorisé 
Metadata    Author    Khouloud
Library     SeleniumLibrary
*** Variables ***
${browser}    Chrome
${url}    https://www.saucedemo.com/
${champUserName}    id=user-name
${champPassword}    id=password
${invalid_user_locked}    locked_out_user
${Error_user}    Khouloud
${valid_user}    standard_user
${passwordGeneral}    secret_sauce
${login}    id=login-button

*** Keywords ***
Ouvrir URL
    Open Browser    ${url}     ${browser}
Login User
    [Arguments]    ${userName}    ${password}
    Wait Until Element Is Visible   ${champUserName}  
    Input Text    ${champUserName}    ${userName}
    Input Text    ${champPassword}  ${Password} 
    Click Element    ${login}   
*** Test Cases ***
 #Nom du cas de Test 1
Se connecter avec invalid user locked
    [Tags]    invalid path
    Ouvrir URL
    Login User    ${invalid_user_locked}    ${passwordGeneral}     
# Nom du cas de Test 2 
Se connecter avec Error user
    [Tags]    invalid path
    Login User    ${Error_user}    ${passwordGeneral}       

# Nom du cas de Test 3
Se connecter avec user valid
    [Tags]    valid path
    Login User    ${valid_user}    ${passwordGeneral} 

         
