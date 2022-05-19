*** Settings ***
Resource  ../Source/Library/Standard_Library.robot
Resource  ../Source/Library/Custom_Library.robot


*** Test Cases ***

Non Loyalty User Registration
  Open PPE Application  ECOM
  Click On Login/Register Link
  Click in Register Link
  Get available phone number from testrail config
  Fill in phone number on registration page  ${phone_number_for_register}
  Enter OTP
  Enter Password And Confirm Password      ${Registration_Form.New_Password}
  Choose Customer Type  Non_Loyal
  Verify User Logged In
  User Logout
  Click On Login/Register Link
  Enter UserName   ${phone_number_for_register}
  Enter Password  ${Registration_Form.New_Password}
  Click Login Button
  Choose Customer Type  Non_Loyal
  Verify User Logged In
  User Logout






