*** Settings ***
Resource          ../resources/keywords.robot

*** Test Cases ***
Créer un utilisateur valide
    Initialiser la session
    Créer un utilisateur valide

Lire un utilisateur existant
    Initialiser la session
    Lire un utilisateur existant

Mettre à jour un utilisateur existant
    Initialiser la session
    Mettre à jour un utilisateur existant

Supprimer un utilisateur existant
    Initialiser la session
    Supprimer un utilisateur existant
