*** Settings ***
Documentation   This file contains  all the PPE Application Registration Module keywords

Library  AppiumLibrary
Library  Process



*** Keywords ***
Click in Register Link

   Wait Until Page Contains Element   ${Login_page.RegisterLink}  80
   Click Element   ${Login_page.RegisterLink}
   Capture Page Screenshot  ${OUTPUTDIR}/customerfrontend_{index}.png



Get available phone number from testrail config
  ${result}=  Run  pip3 install requests
  ${result}=  Run  pip3 install testrail-api
  ${result}=  Run  .\\lib\\get_new_phone_number.py
  Set global variable  ${phone_number_for_register}  ${result}
  Log To Console   ${phone_number_for_register}
  Capture Page Screenshot  ${OUTPUTDIR}/customerfrontend_{index}.png


Fill in phone number on registration page
  [Arguments]  ${Phone_Number}
  Sleep  10
  Wait Until Element Is Visible   ${Registration.Mobile_No}   ${Wait}
  Input Text  ${Registration.Mobile_No}  ${Phone_Number}
  Wait and click element  ${Registration.Next_button}
  Capture Page Screenshot  ${OUTPUTDIR}/customerfrontend_{index}.png


Clear Mobile Number
    Wait and click element  ${Registration.Mobile_Number_Clear_Button}
    Capture Page Screenshot  ${OUTPUTDIR}/customerfrontend_{index}.png

Enter Password And Confirm Password
  [Arguments]  ${Password}
  sleep   5
  Wait Until Element Is Visible  ${Registration.Password}  ${Sleep_Time}
  Input Text  ${Registration.Password}  ${Password}
  Input Text  ${Registration.Confirm_Password}  ${Password}
  Log To Console  Entered Password : ${Password}
  Press Keycode  66   # To press Enter key
  Wait And Click Element  ${Registration.Select_Accept_Checkbox}
  Wait And Click Element  ${Registration.Set_Password_Button}
  Capture Page Screenshot  ${OUTPUTDIR}/customerfrontend_{index}.png

Choose Customer Type
  [Arguments]   ${Customer_Type}
  Sleep  ${Sleep_Time}
  Wait Until Element Is Visible  ${OptLoyalty.Header}  ${Sleep_Time}
  Element Should Contain Text  ${OptLoyalty.Header}  Activate My Lotus's
  IF   '${Customer_Type}' == 'Loyal'
    Wait And Click Element  ${OptLoyalty.Activate_Button}
    Log To Console  Enroll as Loyal Customer
  ELSE
    Wait And Click Element  ${OptLoyalty.Later_Button}
    Log To Console  Enroll as Non Loyal Customer
  END
  Capture Page Screenshot  ${OUTPUTDIR}/customerfrontend_{index}.png

Select Title(Mr/Mrs/Ms)
  [Arguments]  ${Title}
  Click Element  ${Profile.Title}
  IF  '${Title}' == 'Mrs'
   Mouse Over  ${Profile.Title_Mrs}
   Click Element  ${Profile.Title_Mrs}
   ELSE IF  '${Title}' == 'Mr'
   Mouse Over  ${Profile.Title_Mr}
   Click Element  ${Profile.Title_Mr}
   Capture Page Screenshot  ${OUTPUTDIR}/customerfrontend_{index}.png





