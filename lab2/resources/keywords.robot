*** Settings ***
Library     SeleniumLibrary
Variables   ../pageobject/variables.py
Resource    ../resources/keywords.robot

*** Keywords ***
Ouvrir Le Navigateur Sur La Page De Connexion
    Open Browser    ${URL}    chrome
    Maximize Browser Window
Verifier la presence de la page d'accueil
    Wait Until Page Contains Element    xpath=//h2[contains(text(), 'Customers Are Priority One!')]   timeout=10s


Clicker sur le bouton de connexion
    Click Element    xpath=//a[@id='SignIn']
    Wait Until Page Contains Element    id=email-id
    Sleep    2s


Laisser vide le formulaire de connexion
    Input Text     id=email-id       ${EMPTY}
    Input Text     id=password    ${EMPTY}
    Click Button   id=submit-id
    Sleep    2s

Remplir Le Formulaire De Connexion
    [Arguments]    ${email}    ${password}
    Input Text     id=email-id       ${email}
    Input Text     id=password    ${password}

Cocher le remember me
    Select Checkbox    id=remember

Valider Le Formulaire De Connexion
    Click Button   id=submit-id

Confirmation De La Connexion
    Wait Until Page Contains Element    xpath=//h2[contains(text(), 'Our Happy Customers')]   timeout=2s

Se Déconnecter
    Click Element    xpath=//a[@href='sign-out.html']
    Sleep    2s

Confirmation De La Déconnexion
    Wait Until Page Contains Element    xpath=//h2[contains(text(), 'Signed Out')]   timeout=2s
    Sleep    2s

Se Reconnecter
    Click Element    xpath=//a[@href='login.html']
    Sleep    2s

Vérifier Que Le Tableau Contient Plusieurs lignes
    ${rows}=    Get Element Count    xpath=//table[@id='customers']/tbody/tr
    Should Be True    ${rows} > 1
    Sleep    2s

Cliquer sur le bouton d'ajout customer
    Sleep    2s
    Click Element    xpath=//a[@id='new-customer']

Verifier La Présence Du Formulaire D'Ajout
    Wait Until Page Contains Element    xpath=//h2[contains(text(), 'Add Customer')]   timeout=2s
    Sleep    2s

Ajouter un nouveau client
    [Arguments]    ${EmailAddress}    ${FIRST_NAME}    ${LAST_NAME}    ${City}    ${StateOrRegion}
    Input Text     id=EmailAddress       ${EmailAddress}
    Input Text     id=FirstName    ${FIRST_NAME}
    Input Text     id=LastName     ${LAST_NAME}
    Input Text     id=City       ${City}
    Select From List By Label    id=StateOrRegion    ${StateOrRegion}
    Select Radio Button    gender    male
    Click Element    xpath=//input[@type="checkbox" and @name="promos-name"]
    Sleep    1s

Valider le formulaire d'ajout
    Click Button    xpath=//button[@type='submit']
    Sleep    2s

Quitter le formulaire d'ajout
    Click Element    xpath=//a[@href='customers.html']
    Sleep    2s


Fermer Le Navigateur
    Close Browser


Fermer la fenetre de test
    Close Window

