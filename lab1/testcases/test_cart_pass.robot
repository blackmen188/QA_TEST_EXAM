*** Settings ***
Resource          ../resources/keywords.robot

*** Test Cases ***
Créer un panier valide
    Initialiser la session
    Créer un panier valide

Lire un panier existant
    Initialiser la session
    Lire un panier existant

Mettre à jour un panier existant
    Initialiser la session
    Mettre à jour un panier existant


Supprimer un panier existant
    Initialiser la session
    Supprimer un panier existant
