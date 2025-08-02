*** Settings ***
Library           AppiumLibrary

Variables        ../pageobject/Variables.py
Variables        ../pageobject/Locator.py

*** Keywords ***
Open Application MyApp
    Open Application       ${REMOTE_URL}   platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    automationName=${AUTOMATION_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}
    
Enter username
    #Wait Until Element Is Visible    ${USERNAME}    5
    Click Element    ${USERNAME}
    Input Text    ${USERNAME}    johnd
    
Enter password
    #Wait Until Element Is Visible    ${PASSWORD}    5
    Click Element    ${PASSWORD}
    Input Password    ${PASSWORD}    m38rmF$

Log In
    #Wait Until Element Is Visible    ${LOGIN}    5
    Click Element    ${LOGIN}
    
Fill the Form
     wait Until Element Is Visible    ${FORM_TITLE}    5
     Click Element    ${FORM_TITLE}
     Input Text    ${FORM_TITLE}    MINANE SANDALE BLACK

     #Wait Until Element Is Visible    ${FORM_PRICE}    5
     Click Element    ${FORM_PRICE}
     Input Text    ${FORM_PRICE}    7500

     #Wait Until Element Is Visible    ${FORM_DESCRIPTION}    5
     Click Element    ${FORM_DESCRIPTION}
     Input Text    ${FORM_DESCRIPTION}    Sandale pied nue minane black 

     #Wait Until Element Is Visible    ${FORM_CATEGORIE}    5
     Click Element    ${FORM_CATEGORIE}
     Input Text    ${FORM_CATEGORIE}    CHAUSSURE

     #Wait Until Element Is Visible    ${FORM_URL}    5
     Click Element    ${FORM_URL}
     Input Text    ${FORM_URL}    https://media.s-bol.com/mPZVP9nYm18r/LjE9op/550x469.jpg

     Click Element    ${FORM_BUTTON_ADD}
Afficher un produit
    Click Element    ${PRODUCT}
    

