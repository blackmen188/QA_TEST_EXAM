*** Settings ***
Resource          ../resources/keywords.robot

*** Test Cases ***
Créer un produit sans prix
    Initialiser la session
    Créer un produit sans prix

Créer un produit sans catégorie
    Initialiser la session
    Créer un produit sans catégorie

Lire un produit inexistant
    Initialiser la session
    Lire un produit inexistant

Lire un produit avec ID texte
    Initialiser la session
    Lire un produit avec ID texte

Mettre à jour un produit sans données
    Initialiser la session
    Mettre à jour un produit sans données

Supprimer un produit inexistant
    Initialiser la session
    Supprimer un produit inexistant
