*** Settings ***
Library  AppiumLibrary
Library  BuiltIn
Library  Process


*** Variables ***
${IOS_AUTOMATION_NAME}        XCUITest
${IOS_APP}                    ${CURDIR}/../demoapp/TestApp.app.zip
${IOS_PLATFORM_NAME}          iOS
${IOS_PLATFORM_VERSION}       %{IOS_PLATFORM_VERSION=14.5}
${IOS_DEVICE_NAME}            iPhone 8


*** Keywords ***

Start Appium Server
    [Documentation]     Starts Appium server
    Start Process  appium --default-capabilities '{"appium:showXcodeLog" : true}' --log ${CURDIR}/appium.log
    ...     shell=True  alias=appiumserver
    ...     stdout=${CURDIR}/appium_stdout.txt  stderr=${CURDIR}/appium_stderr.txt
    Process Should Be Running  appiumserver
    Sleep  10s

Stop Appium Server
    [Documentation]     Stops Appium server
    Terminate Process  appiumserver  kill=True

Open iOS Test App
  Start Appium Server
  open application  http://127.0.0.1:4723/wd/hub  automationName=${IOS_AUTOMATION_NAME}
  ...  app=${IOS_APP}  platformName=${IOS_PLATFORM_NAME}  platformVersion=${IOS_PLATFORM_VERSION}
  ...  deviceName=${IOS_DEVICE_NAME}
