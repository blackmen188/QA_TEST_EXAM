*** Settings ***
Resource          ../resources/keywords.robot

*** Test Cases ***
Créer un produit avec succès
    Initialiser la session
    Créer un produit valide

Lire un produit existant
    Initialiser la session
    Lire un produit existant

Mettre à jour un produit existant
    Initialiser la session
    Mettre à jour un produit existant

Supprimer un produit existant
    Initialiser la session
    Supprimer un produit existant
