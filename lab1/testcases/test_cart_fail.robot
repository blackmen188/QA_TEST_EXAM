*** Settings ***
Resource          ../resources/keywords.robot

*** Test Cases ***
Créer un panier sans produits
    Initialiser la session
    Créer un panier sans produits

Lire un panier inexistant
    Initialiser la session
    Lire un panier inexistant

Lire un panier avec ID texte
    Initialiser la session
    Lire un panier avec ID texte

Mettre à jour un panier inexistant
    Initialiser la session
    Mettre à jour un panier inexistant

Mettre à jour un panier sans données
    Initialiser la session
    Mettre à jour un panier sans données

Supprimer un panier inexistant
    Initialiser la session
    Supprimer un panier inexistant

Supprimer un panier avec ID texte
    Initialiser la session
    Supprimer un panier avec ID texte
