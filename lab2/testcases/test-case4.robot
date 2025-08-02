** Settings ***
Resource    ../resources/keywords.robot

*** Test Cases ***
Connexion Réussie Avec Identifiants Valides
    Ouvrir Le Navigateur Sur La Page De Connexion
    Verifier la presence de la page d'accueil
    Clicker sur le bouton de connexion
    Remplir Le Formulaire De Connexion    ${EMAIL}    ${PASSWORD}
    Cocher le remember me
    Valider Le Formulaire De Connexion
    Confirmation De La Connexion
    Se Déconnecter
    Se Reconnecter
    Fermer Le Navigateur