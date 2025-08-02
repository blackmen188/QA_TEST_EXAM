*** Settings ***
Resource    ../resources/keywords.robot

Suite Setup    Create Session To Fulfillment API

*** Test Cases ***
Suite Setup
    Create Session To Fulfillment API

Get Orders list failed
    [Tags]    smoke    negative1
    ${params}=    Create Dictionary    limit=5
    ${response}=    Get Orders    ${params}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Not Be Empty    ${response}
    Log To Console    ${response}

Get Order By Id failed
    [Tags]    smoke    negative2
    ${order_id}=    Set Variable    99999999
    ${response}=    Get Order By Id    ${order_id}
    Should Be Equal As Strings    ${response.status_code}    404
    Log To Console    ${response}

Issue Refund failed
    [Tags]    smoke    negative3
    ${order_id}=    Set Variable    99999999
    ${refund_data}=    Create Dictionary    amount=100.00
    ${response}=    Issue Refund    ${order_id}    ${refund_data}
    Should Be Equal As Strings    ${response.status_code}    404
    Log To Console    ${response}