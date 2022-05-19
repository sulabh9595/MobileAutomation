*** Settings ***
Library     AppiumLibrary

*** Keywords ***
Open PPE Application
  [Arguments]  ${Application}
  IF  '${Application}' == 'ECOM'
    Open Application  ${remote_url}  platformName=${platform}   deviceName=${Device}   appPackage=${appPackage}   appActivity=${appActivity}   automationName=${automationName}
  END



Wait And Click Element
  [Arguments]     ${Element_Path}
  Wait Until Element Is Visible  ${Element_Path}
  Click Element    ${Element_Path}



Clear Input Text
  [Arguments]     ${Element_Path}
  ${Value}=     Get Text   ${Element_Path}
  ${Backspaces_Count}   Get Length     ${Value}
  Log To Console  Value: ${Value}
  Log To Console  Value: ${Backspaces_Count} +1
  Repeat Keyword  ${Backspaces_Count}  Press Keycode   ${Element_Path}     \\08    # this is the code for the backspace key; "backspaces count +1"

Enter OTP
  Sleep   10
  Wait Until Element Is Visible  ${OTPForm.OTP_Text}
  Wait Until Page Contains Element  ${OTPForm.OTP_Header}
  Sleep   5
  Input Text   ${OTPForm.OTP_Text}   010101

Generate id card from phone number
  [Arguments]  ${phone}
#  generate id card with format 55<phone><check_sum>
   ${checksum}=  Evaluate  (5*13)
   ${checksum}=  Evaluate  ${checksum}+(5*12)
  FOR  ${start}  IN RANGE  0  10
    ${end}=  Evaluate  ${start}+1
    ${d}=  Get substring  ${phone}  ${start}  ${end}
    ${d}=  Convert to integer  ${d}
    ${checksum}=  Evaluate  ${checksum}+(${d}*(11-${start}))
  END
  ${checksum}=  Evaluate  11-(${checksum}%11)
  Set global variable  ${id_card_for_register}  55${phone}${checksum}

User Logout
  Wait And Click Element  ${Home_page.Me_Button}
  Wait And Click Element  ${Home_page.Logout_Button}
  Wait Until Element Is Visible  ${Home_page.Logout_Popup}
  Wait And Click Element  ${Home_page.Logout_Cofirmation_Button}
  Sleep  10
  Wait Until Page Contains Element   ${Home_page.LoginLink}  ${wait}

