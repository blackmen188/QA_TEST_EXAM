*** Settings ***
Library           RequestsLibrary
Variables         ../pageobject/variables.py

*** Keywords ***
Initialiser la session
    [Arguments]    ${alias}=api
    Create Session    ${alias}    ${BASE_URL}

### ----------------- PRODUITS -----------------

Créer un produit valide
    ${payload}=    Create Dictionary
    ...    title=Test Product
    ...    price=25.99
    ...    description=This is a test
    ...    image=https://fakestoreapi.com/img/test.jpg
    ...    category=electronics
    ${resp}=    POST On Session    api    /products    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200

Créer un produit sans prix
    ${payload}=    Create Dictionary
    ...    title=No Price
    ...    description=Test no price
    ...    image=https://fakestoreapi.com/img/test.jpg
    ...    category=electronics
    ${resp}=    POST On Session    api    /products    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200

Créer un produit sans catégorie
    ${payload}=    Create Dictionary
    ...    title=No Category
    ...    price=10.0
    ...    description=Test no cat
    ...    image=https://fakestoreapi.com/img/test.jpg
    ${resp}=    POST On Session    api    /products    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200

Lire un produit existant
    ${resp}=    GET On Session    api    /products/1
    Should Be Equal As Integers    ${resp.status_code}    200
    Log To Console    ${resp.json()}

Lire un produit inexistant
    ${resp}=    GET On Session    api    /products/9999
    Should Be Equal As Integers    ${resp.status_code}    200

Lire un produit avec ID texte
    ${resp}=    GET On Session    api    /products/abc
    Should Be Equal As Integers    ${resp.status_code}    200

Mettre à jour un produit existant
    ${payload}=    Create Dictionary    title=Updated Title
    ${resp}=    PUT On Session    api    /products/1    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200

Mettre à jour un produit inexistant
    ${payload}=    Create Dictionary    title=Invalid
    ${resp}=    PUT On Session    api    /products/9999    json=${payload}
    Should Not Be Equal As Integers    ${resp.status_code}    200

Mettre à jour un produit sans données
    ${payload}=    Create Dictionary
    ${resp}=    PUT On Session    api    /products/1    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200

Supprimer un produit existant
    ${resp}=    DELETE On Session    api    /products/1
    Should Be Equal As Integers    ${resp.status_code}    200

Supprimer un produit inexistant
    ${resp}=    DELETE On Session    api    /products/9999
    Should Be Equal As Integers    ${resp.status_code}    200



### ----------------- UTILISATEURS -----------------

Créer un utilisateur valide
    ${payload}=    Create Dictionary
    ...    email=sambagueye326@gmail.com
    ...    username=sambagueye
    ...    password=123456
    ${resp}=    POST On Session    api    /users    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200
    Log To Console    ${resp.json()}


Créer un utilisateur sans email
    ${payload}=    Create Dictionary
    ...    username=baduser
    ...    password=123456
    ${resp}=    POST On Session    api    /users    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200

Créer un utilisateur avec geoloc invalide
    ${payload}=    Create Dictionary
    ...    email=bad@bad.com
    ...    username=bad
    ...    password=123456
    ${resp}=    POST On Session    api    /users    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200

Lire un utilisateur existant
    ${resp}=    GET On Session    api    /users/1
    Should Be Equal As Integers    ${resp.status_code}    200
    Log To Console    ${resp.json()}

Lire un utilisateur inexistant
    ${resp}=    GET On Session    api    /users/9999
    Should Be Equal As Integers    ${resp.status_code}    200

Lire un utilisateur avec ID texte
    ${resp}=    GET On Session    api    /users/abc
    Should Be Equal As Integers    ${resp.status_code}    400

Mettre à jour un utilisateur existant
    ${payload}=    Create Dictionary    username=updateduser
    ${resp}=    PUT On Session    api    /users/1    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200

Mettre à jour un utilisateur inexistant
    ${payload}=    Create Dictionary    username=bad
    ${resp}=    PUT On Session    api    /users/9999    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200

Mettre à jour un utilisateur sans données
    ${payload}=    Create Dictionary
    ${resp}=    PUT On Session    api    /users/1    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200

Supprimer un utilisateur existant
    ${resp}=    DELETE On Session    api    /users/1
    Should Be Equal As Integers    ${resp.status_code}    200

Supprimer un utilisateur inexistant
    ${resp}=    DELETE On Session    api    /users/9999
    Should Be Equal As Integers    ${resp.status_code}    200

Supprimer un utilisateur avec ID texte
    ${resp}=    DELETE On Session    api    /users/abc
    Should Be Equal As Integers    ${resp.status_code}    400


### ----------------- CARTS -----------------

Créer un panier valide
    ${produit}=    Create Dictionary    productId=5    quantity=2    title=Test Product    price=15.99    description=Test Description    image=https://fakestoreapi.com/img/test.jpg    category=electronics
    ${liste_produits}=    Create List    ${produit}
    ${payload}=    Create Dictionary
    ...    userId=1
    ...    products=${liste_produits}
    ${resp}=    POST On Session    api    /carts    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200

Créer un panier sans produits
    ${payload}=    Create Dictionary
    ...    userId=3
    ${resp}=    POST On Session    api    /carts    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200

Lire un panier existant
    ${resp}=    GET On Session    api    /carts/1
    Should Be Equal As Integers    ${resp.status_code}    200
    Log To Console    ${resp.json()}

Lire un panier inexistant
    ${resp}=    GET On Session    api    /carts/9999
    Should Be Equal As Integers    ${resp.status_code}    404

Lire un panier avec ID texte
    ${resp}=    GET On Session    api    /carts/abc
    Should Be Equal As Integers    ${resp.status_code}    400

Mettre à jour un panier existant
    ${produit}=    Create Dictionary
    ...    productId=5
    ...    quantity=2
    ...    title=Test Product
    ...    price=15.99
    ...    description=Test Description
    ...    image=https://fakestoreapi.com/img/test.jpg
    ...    category=electronics
    ${liste_produits}=    Create List    ${produit}
    ${payload}=    Create Dictionary
    ...    userId=1
    ...    products=${liste_produits}
    ${resp}=    PUT On Session    api    /carts/1    json=${payload}
    Log    Status code: ${resp.status_code}
    Log    Response body: ${resp.text}
    Should Be Equal As Integers    ${resp.status_code}    200


Mettre à jour un panier inexistant
    ${payload}=    Create Dictionary
    ${resp}=    PUT On Session    api    /carts/9999    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200

Mettre à jour un panier sans données
    ${payload}=    Create Dictionary
    ${resp}=    PUT On Session    api    /carts/1    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200

Supprimer un panier existant
    ${resp}=    DELETE On Session    api    /carts/1
    Should Be Equal As Integers    ${resp.status_code}    200

Supprimer un panier inexistant
    ${resp}=    DELETE On Session    api    /carts/9999
    Should Be Equal As Integers    ${resp.status_code}    404

Supprimer un panier avec ID texte
    ${resp}=    DELETE On Session    api    /carts/abc
    Should Be Equal As Integers    ${resp.status_code}    400
