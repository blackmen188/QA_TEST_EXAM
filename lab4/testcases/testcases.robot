*** Settings ***
Resource    ../resources/keywords.robot


*** Test Cases ***
Execution Mobile
    Open Application MyApp
    Enter username
    Enter password
    Log In
    Fill the Form
    #Afficher un produit
    