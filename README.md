# Second Generation Packaging Run Tests on Install Issue

Developer edition with validation rule on contact that one of email or phone must be defined.

Creating a beta 1GP package with the same single class as this repository results in the following error when installing into the developer edition:

````
Your request to install package "BGHO1GBCORE 1.0" was unsuccessful. None of the data or setup information in your salesforce.com organization was affected.

If your install continues to fail, contact Salesforce CRM Support through your normal channels and provide the following information.

Organization: BrightGen (00D80000000bSy0)
User: Keir Bowden (00580000001ju2C)
Package: BGHO1GBCORE (04t4L000000Pqwi)

Problem:

1. Apex Classes(01p1E000000KDm1) runoninstall.testValidationCorrect()
System.DmlException: Insert failed. First exception on row 0; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, Email or phone must be defined.: [Email]
Class.BGHO1GPCORE.RunOnInstall.testValidationCorrect: line 14, column 1
````
Creating a beta second generation package, as detailed in sfdx-project.json and installing via the command line

````
$ sfdx force:package:install --package 04t4X000000Wy6fQAC -w 30 -u KABDEV
Waiting for the package install request to complete. Status = IN_PROGRESS
Waiting for the package install request to complete. Status = IN_PROGRESS
Waiting for the package install request to complete. Status = IN_PROGRESS
Waiting for the package install request to complete. Status = IN_PROGRESS
Waiting for the package install request to complete. Status = IN_PROGRESS
Waiting for the package install request to complete. Status = IN_PROGRESS
Waiting for the package install request to complete. Status = IN_PROGRESS
Successfully installed package [04t4X000000Wy6fQAC]
````

Executing the test from the installed package fails as expected :

````
$ sfdx force:apex:test:run -n "BGHANDSON.RunOnInstall" -u KABDEV -y
=== Test Summary
NAME                 VALUE
───────────────────  ──────────────────────────
Outcome              Failed
Tests Ran            1
Pass Rate            0%
Fail Rate            100%
Skip Rate            0%
Test Run Id
Test Execution Time  344 ms
Org Id               00D80000000bSy0EAE
Username             keir.bowden@googlemail.com


=== Test Results
TEST NAME                                      OUTCOME  MESSAGE                                                                                                                                                 RUNTIME (MS)
─────────────────────────────────────────────  ───────  ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────  ────────────
BGHANDSON__RunOnInstall.testValidationCorrect  Fail     System.DmlException: Insert failed. First exception on row 0; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, Email or phone must be defined.: [Email]
                                                        (BGHANDSON)
````