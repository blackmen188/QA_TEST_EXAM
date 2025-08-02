*** Settings ***
Resource    ../resources/keywords.robot

Suite Setup    Create Session To Fulfillment API

*** Test Cases ***
Suite Setup
    Create Session To Fulfillment API

Get Orders Test
    [Tags]    smoke    positive1
    ${params}=    Create Dictionary    limit=5
    ${orders}=    Get Orders    ${params}
    Should Not Be Empty    ${orders}
    ${order_count}=    Get Length    ${orders}
    Log To Console    ${orders}

Get Order By Id Test
    [Tags]    smoke    positive2
    ${params}=    Create Dictionary    limit=5
    ${orders_response}=    Get Orders    ${params}
    ${orders}=    Set Variable    ${orders_response['orders']}

    Run Keyword If    ${orders} != []    Run Get Order By Valid Id Test    ${orders[0]['orderId']}
    ...    ELSE    Log To Console    Aucune commande disponible pour effectuer un test.

Issue Refund Test
    [Tags]    smoke    positive3
    ${order_id}=    Set Variable    26-12345-12345
