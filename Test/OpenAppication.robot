*** Settings ***
Resource  ../Source/Library/Standard_Library.robot
Resource  ../Source/Library/Custom_Library.robot

*** Variables ***


*** Test Cases ***

Open_Application
  Open Application  http://localhost:4723/wd/hub   platformName=Android   deviceName=emulator-5554   appPackage=chat21.android.demo   appActivity=chat21.android.demo.SplashActivity  automationName=UiAutomator2
  #Open Application  http://localhost:4723/wd/hub   platformName=Android   deviceName=10192670   appPackage=com.loginext.fieldforce   appActivity=com.loginext.tracknext.ui.splash.SplashActivity  automationName=UiAutomator2
  AppiumLibrary.Click Element  com.android.permissioncontroller:id/continue_button
  AppiumLibrary.Click Element  id=android:id/button1
  AppiumLibrary.Input Text  id=chat21.android.demo:id/email  dassadasd
  AppiumLibrary.Input Text  id=chat21.android.demo:id/password  dassadasd
  AppiumLibrary.Click Button  id=chat21.android.demo:id/login

