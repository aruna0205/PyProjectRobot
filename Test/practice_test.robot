*** settings ***
Library    BuiltIn
Library    Dialogs
Library    Collections


*** variables ***
${value} =    19
@{Value_List} =    create list    1    10    45    76    89

# Assignment first Question to check value is less or greater than 20
*** Test Cases ***
Check Value is less than 20
    [tags]    comparision
    run keyword if    ${value} < 20   Log To Console    "Value is less than 20"
    run keyword if    ${value} > 20   Log To Console    "Value is greater than 20"
    ...    ELSE    Log To Console    "Value is exact 20"

# Assignment second question to find the sum of 3 variable
Sum of Three variable
    [tags]    Adding
    ${first} =    set variable    10
    ${second} =    set variable    20
    ${third} =    set variable    30

    Calculate Sum    ${first}    ${second}    ${third}

# To append the single value in list
Append single value in List
    [tags]    Appending
    ${username} =    Get Value From User    Enter a number
    append to list    ${Value_List}    ${username}
    log many     @{Value_List}


*** keywords ***
Calculate Sum
    [Arguments]    ${first}    ${second}    ${third}
    ${Sum} =    Evaluate    ${first}+${second}+${third}
    Log To Console    The Sum Of ${first},${second},${third} is ${Sum}






