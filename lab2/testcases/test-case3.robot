** Settings ***
Resource    ../resources/keywords.robot

*** Test Cases ***
Connexion Réussie Avec Identifiants Valides
    Ouvrir Le Navigateur Sur La Page De Connexion
    Verifier la presence de la page d'accueil
    Clicker sur le bouton de connexion
    Laisser vide le formulaire de connexion
    Fermer Le Navigateur