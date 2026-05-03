*** Settings ***
Documentation    cette suite de test traite l'epic avec connexion valide et invalide 
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
${password}    secret_sauce
${login}    id=login-button

*** Keywords ***

Ouvir le navigateur     
    Open Browser    ${url}    ${browser}

Remplir le champ username locked  
    Wait Until Element Is Visible    ${champUserName}      
    Input Text    ${champUserName}    ${invalid_user_locked} 
Remplir le champ username with Error user 
    Wait Until Element Is Visible     ${champUserName} 
    Input Text     ${champUserName}     ${Error_user}      
Remplir le champ username with valid user 
    Wait Until Element Is Visible   ${champUserName} 
    Input Text    ${champUserName}     ${valid_user}    

Remplir le champ password
    Input Text    ${champPassword}     ${password}

Cliquer sur le bouton Login 
    Click Element    ${login}

*** Test Cases ***
# Nom du cas de Test 1
Se connecter avec invalid user locked
    [Tags]    invalid path
# Les étapes crée en keywords 
    Ouvir le navigateur
    Remplir le champ username locked
    Remplir le champ password
    Cliquer sur le bouton Login 
    Capture Page Screenshot
# Nom du cas de Test 2 
Se connecter avec Error user
    [Tags]    invalid path
# Les étapes crée en keywords 
    Ouvir le navigateur
    Remplir le champ username with Error user
    Remplir le champ password
    Cliquer sur le bouton Login
    Capture Page Screenshot
# Nom du cas de Test 3
Se connecter avec user valid
    [Tags]    valid path
# Les étapes crée en keywords 
    Ouvir le navigateur
    Remplir le champ username with valid user
    Remplir le champ password
    Cliquer sur le bouton Login
    Capture Page Screenshot

