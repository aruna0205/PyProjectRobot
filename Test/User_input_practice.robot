*** Settings ***
Library  Dialogs
Library  Reserved
Library  Collections
*** Variables ***
@{input_data}   1   2   3
${number}   1
${i}
@{user_data}    Create List
*** Test Cases ***
Take user input
    ${input}    Get Value from user     Enter a number
    log  number entered is ${input}
    append to list  ${input_data}   ${input}
    log many    @{input_data}

Getting multiple values from user
    :For    ${i}  IN  @{input_data}
    \    ${number}    Get Value from user     Enter a number
    \   Append to list      ${user_data}    ${number}
    log many    @{user_data}