*** Settings ***
Documentation   This file contains  all the PPE Application Login Module keywords


*** Keywords ***


Click On Login/Register Link
   Wait Until Page Contains Element   ${Home_page.LoginLink}  ${wait}
   Click Element  ${Home_page.LoginLink}
   Capture Page Screenshot  ${OUTPUTDIR}/customerfrontend_{index}.png

Enter UserName
  [Arguments]  ${MobileNo}
   Wait Until Element Is Visible   ${Login_page.UserName}
   Input Text  ${Login_page.UserName}  ${MobileNo}
   Capture Page Screenshot  ${OUTPUTDIR}/customerfrontend_{index}.png

Enter Password
  [Arguments]  ${Password}
   Wait Until Element Is Visible   ${Login_page.Password}
   Input Text  ${Login_page.Password}  ${Password}
   Capture Page Screenshot  ${OUTPUTDIR}/customerfrontend_{index}.png
-
Click Login Button
   Wait and click element  ${Login_page.LoginButton}
   Capture Page Screenshot  ${OUTPUTDIR}/customerfrontend_{index}.png


Verify User Logged In
   Sleep  2
   Wait Until Element Is Visible  ${Home_Page.LoginUserIcon}  ${Sleep_Time}
   Wait Until Element Is Visible  ${Home_Page.LoginUserIcon}
   Capture Page Screenshot  ${OUTPUTDIR}/customerfrontend_{index}.png

