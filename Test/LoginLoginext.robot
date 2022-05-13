*** Settings ***
Resource  ../Source/Library/Standard_Library.robot
Resource  ../Source/Library/Custom_Library.robot

*** Variables ***
#*** login Locators ***
${UserName}    id=com.loginext.fieldforce:id/et_userName
${Password}    id=com.loginext.fieldforce:id/et_password
${LoginButton}   id=com.loginext.fieldforce:id/b_Login

#*** login Test Data ***
&{LoginDetails}    UserName=UAT_001    Password=UATdriver001


*** Test Cases ***

LoginextLogin
  Open Application  http://localhost:4723/wd/hub   platformName=Android   deviceName=emulator-5554   appPackage=com.loginext.fieldforce   appActivity=com.loginext.tracknext.ui.splash.SplashActivity  automationName=UiAutomator2
  Wait Until Page Contains Element   ${UserName}  20
  Input Text  ${UserName}  ${LoginDetails}[UserName]
  Input Text  ${Password}  ${LoginDetails}[Password]
  Click Element   ${LoginButton}




