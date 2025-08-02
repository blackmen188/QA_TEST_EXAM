*** Settings ***
Resource          ../resources/keywords.robot

*** Test Cases ***
Créer un utilisateur sans email
    Initialiser la session
    Créer un utilisateur sans email

Créer un utilisateur avec geoloc invalide
    Initialiser la session
    Créer un utilisateur avec geoloc invalide

Lire un utilisateur inexistant
    Initialiser la session
    Lire un utilisateur inexistant


Mettre à jour un utilisateur inexistant
    Initialiser la session
    Mettre à jour un utilisateur inexistant

Mettre à jour un utilisateur sans données
    Initialiser la session
    Mettre à jour un utilisateur sans données

Supprimer un utilisateur inexistant
    Initialiser la session
    Supprimer un utilisateur inexistant

