*** Settings ***
Documentation   This file contains  all the PPE Application keywords
##Library  SeleniumLibrary
#Library  AppiumLibrary

*** Keywords ***
Open PPE Application
   Open Application  ${remote_url}  platformName=${platform}   deviceName=${Device}   appPackage=${appPackage}   appActivity=${appActivity}   automationName=${automationName}
   #Open Application   http://localhost:4723/wd/hub   platformName=Android   deviceName=emulator-5554   appPackage=com.lotuss.oneapp   appActivity=com.lotuss.oneapp.NewMainActivity   automationName=UiAutomator2

Click On Login/Register Button
   Wait Until Page Contains Element   ${Home_page.LoginLink}  20
   Click Element  ${Home_page.LoginLink}

Enter UserName
   Input Text  ${Login_page.UserName}  ${MobileNo}

Enter Password
   Input Text  ${Login_page.Password}  ${Password}
-
Click Login Button
   Click Element   ${Login_page.LoginButton}

Click in Register Link
   Click Element   ${Login_page.RegisterLink}
   Enter UserName