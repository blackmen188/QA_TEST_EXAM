*** Settings ***
Resource    ../resources/keywords.robot

*** Test Cases ***
Connexion Réussie Avec Identifiants Valides
    Ouvrir Le Navigateur Sur La Page De Connexion
    Clicker sur le bouton de connexion
    Remplir Le Formulaire De Connexion    ${EMAIL}    ${PASSWORD}
    Valider Le Formulaire De Connexion
    Confirmation De La Connexion
    Cliquer sur le bouton d'ajout customer
    Verifier La Présence Du Formulaire D'Ajout
    Ajouter un nouveau client    ${EmailAddress}    ${FIRST_NAME}    ${LAST_NAME}    ${City}    ${StateOrRegion}
    Valider le formulaire d'ajout
    Fermer Le Navigateur

