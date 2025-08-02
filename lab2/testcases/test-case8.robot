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
    Quitter le formulaire d'ajout
    Fermer Le Navigateur
