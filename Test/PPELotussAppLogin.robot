*** Settings ***
Resource  ../Source/Library/Standard_Library.robot
Resource  ../Source/Library/Custom_Library.robot

*** Variables ***
#*** login Locators ***
#${LoginLink}   id=com.lotuss.oneapp:id/tv_title
#${UserName}    xpath=//android.widget.EditText[@text='Mobile Number']
#${Password}    xpath=//android.widget.EditText[@text='Password']
#${LoginButton}   id=com.lotuss.oneapp:id/button_login
#
##*** login Test Data ***
#&{LoginDetails}    MobileNo=0523800021    Password=Lotus@1234

*** Test Cases ***

PPEApplicationLogin
#  Open Application  http://localhost:4723/wd/hub   platformName=Android   deviceName=emulator-5554   appPackage=com.lotuss.oneapp   appActivity=com.lotuss.oneapp.NewMainActivity   automationName=UiAutomator2
#  Wait Until Page Contains Element   ${Home_page.LoginLink}  20
#  Click Element  ${Home_page.LoginLink}
#  Input Text  ${Login_page.UserName}  ${LoginDetails}[MobileNo]
#  Input Text  ${Login_page.Password}  ${LoginDetails}[Password]
#  Click Element   ${Login_page.LoginButton}

   Open PPE Application
   Click On Login/Register Button
   Enter UserName
   Enter Password
   Click Login Button



