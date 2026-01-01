*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOMEPAGE}    http://www.google.com
${BROWSER}     Chrome
${URL}     http://localhost:7272/Registration.html

${FIRST_NAME}              Somyod
${LAST_NAME}               Sodsai
${ORGANIZATION}            CS KKU
${EMAIL}                   somyod@kkumail.com
${PHONE}                   091-001-1234
${INVALID_PHONE}           1234

*** Test Cases ***
Open Workshop Registration Page
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${URL}
    Title Should Be    Registration
    Wait Until Page Contains    Workshop Registration
    Close Browser

Register Success
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${URL}
    Title Should Be    Registration
    Wait Until Page Contains    Workshop Registration
    Input Text    id=firstname       ${FIRST_NAME}
    Input Text    id=lastname        ${LAST_NAME}
    Input Text    id=organization    ${ORGANIZATION}
    Input Text    id=email           ${EMAIL}
    Input Text    id=phone           ${PHONE}
    Click Button  id=registerButton

    Wait Until Page Contains    Success
    Title Should Be    Success
    Wait Until Page Contains    Thank you for registering with us.
	Wait Until Page Contains    We will send a confirmation to your email soon.
    Close Browser

Register Success No Organization Info
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${URL}
    Title Should Be    Registration
    Wait Until Page Contains    Workshop Registration
    Input Text    id=firstname       ${FIRST_NAME}
    Input Text    id=lastname        ${LAST_NAME}
    Input Text    id=email           ${EMAIL}
    Input Text    id=phone           ${PHONE}
    Click Button  id=registerButton

    Wait Until Page Contains    Success
    Title Should Be    Success
    Wait Until Page Contains    Thank you for registering with us.
	Wait Until Page Contains    We will send a confirmation to your email soon.
    Close Browser

Empty First Name
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${URL}
    Title Should Be    Registration
    Wait Until Page Contains    Workshop Registration
    Input Text    id=lastname        ${LAST_NAME}
    Input Text    id=organization    ${ORGANIZATION}
    Input Text    id=email           ${EMAIL}
    Input Text    id=phone           ${PHONE}
    Click Button  id=registerButton

    Wait Until Page Contains    Registration
    Title Should Be    Registration
    Wait Until Page Contains    Please enter your first name!!
    Close Browser

Empty Last Name
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${URL}
    Title Should Be    Registration
    Wait Until Page Contains    Workshop Registration
    Input Text    id=firstname       ${FIRST_NAME}
    Input Text    id=organization    ${ORGANIZATION}
    Input Text    id=email           ${EMAIL}
    Input Text    id=phone           ${PHONE}
    Click Button  id=registerButton

    Wait Until Page Contains    Registration
    Title Should Be    Registration
    Wait Until Page Contains    Please enter your last name!!
    Close Browser

Empty First Name and Last Name
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${URL}
    Title Should Be    Registration
    Wait Until Page Contains    Workshop Registration
    Input Text    id=organization    ${ORGANIZATION}
    Input Text    id=email           ${EMAIL}
    Input Text    id=phone           ${PHONE}
    Click Button  id=registerButton

    Wait Until Page Contains    Registration
    Title Should Be    Registration
    Wait Until Page Contains    Please enter your name!!
    Close Browser

Empty Email
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${URL}
    Title Should Be    Registration
    Wait Until Page Contains    Workshop Registration
    Input Text    id=firstname       ${FIRST_NAME}
    Input Text    id=lastname        ${LAST_NAME}
    Input Text    id=phone           ${PHONE}
    Click Button  id=registerButton

    Wait Until Page Contains    Registration
    Title Should Be    Registration
    Wait Until Page Contains    Please enter your email!!
    Close Browser

Empty Phone Number
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${URL}
    Title Should Be    Registration
    Wait Until Page Contains    Workshop Registration
    Input Text    id=firstname       ${FIRST_NAME}
    Input Text    id=lastname        ${LAST_NAME}
    Input Text    id=email           ${EMAIL}
    Click Button  id=registerButton

    Wait Until Page Contains    Registration
    Title Should Be    Registration
    Wait Until Page Contains    Please enter your phone number!!
    Close Browser

Invalid Phone Number
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${URL}
    Title Should Be    Registration
    Wait Until Page Contains    Workshop Registration
    Input Text    id=firstname       ${FIRST_NAME}
    Input Text    id=lastname        ${LAST_NAME}
    Input Text    id=email           ${EMAIL}
    Input Text    id=phone           ${INVALID_PHONE}
    Click Button  id=registerButton

    Wait Until Page Contains    Registration
    Title Should Be    Registration
    Wait Until Page Contains    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)
    Close Browser