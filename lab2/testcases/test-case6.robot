** Settings ***
Resource    ../resources/keywords.robot

*** Test Cases ***
Connexion Réussie Avec Identifiants Valides
    Ouvrir Le Navigateur Sur La Page De Connexion
    Verifier la presence de la page d'accueil
    Clicker sur le bouton de connexion
    Remplir Le Formulaire De Connexion    ${EMAIL}    ${PASSWORD}
    Valider Le Formulaire De Connexion
    Confirmation De La Connexion
    Vérifier Que Le Tableau Contient Plusieurs lignes
    Fermer Le Navigateur