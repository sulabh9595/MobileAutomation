*** Settings ***
Resource  ../Source/Library/Standard_Library.robot
Resource  ../Source/Library/Custom_Library.robot

*** Test Cases ***

Login as a Loyalty Customer
   Open PPE Application  ECOM
   Click On Login/Register Link
   Enter UserName   ${MobileNo}
   Enter Password    ${Password}
   Click Login Button
   Verify User Logged In



