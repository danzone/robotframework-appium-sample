*** Settings ***
Resource  ../resources/resource.robot

Test Setup  Open iOS Test App
Test Teardown  Stop Appium Server

*** Test Cases ***
Should send keys to inputs
  ${attr}  get element attribute  class=XCUIElementTypeApplication  name
  should be equal  ${attr}  TestApp
  close application
  sleep  3s
  run keyword and expect error  No application is open  get webelement  class=XCUIElementTypeApplication