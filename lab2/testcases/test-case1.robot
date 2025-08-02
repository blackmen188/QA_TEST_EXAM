** Settings ***
Resource    ../resources/keywords.robot

*** Test Cases ***
Connexion Réussie Avec Identifiants Valides
    Ouvrir Le Navigateur Sur La Page De Connexion
    Verifier la presence de la page d'accueil
    Fermer Le Navigateur