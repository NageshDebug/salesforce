public with sharing class AuthProviderLoginIssue {
  /***

If you use a validation rule to attempt to update User and Contact objects such as in the following use case:

You have an Auth provider and RegistrationHandler for community user logins.
RegistrationHandler.updateUser() will update User object.
User has a validation rule with formula pointing to Contact.
In RegistrationHandler updateUser(), it updates User object.
Validation Rule:

IF( Community_User_s_Account_ID__c== $Setup.COMM_Profile__c.BluIdAccountId__c , IF( OR(ProfileId== $Setup.COMM_Profile__c.FullAccessProfile__c ,ProfileId== $Setup.COMM_Profile__c.BasicProfileId__c) , true, false),false) Community_User_s_Account_ID__c is a formula field in User to get value of "Contact.AccountId"


When logging in, the user will get an error:

"... you cannot mix EntityObjects with different UddInfos within one transaction: id = 003********"

or more specifically:

"We can’t log you in because of the following error.
ERROR_CREATING_USER: Validation Formula "UserProfileSwitchRule" Invalid (java.lang.IllegalStateException: Programmer Error: you cannot mix EntityObjects with different UddInfos within one transaction: id = 003**********"

Steps to reproduce:
---------------------

1. Login to Community URL - e.g., https://<instance-community-URL>/<community-name>/s
2. Click on [Sign In] button in upper right-hand corner
3. Login to community using the Username and Password credentials for an authorized user.
4. The above error is generated


Solution:
-------------------- 
When running a validation rule, at - FormulaTransactionObserver.lazyFetchTargetEntityObject(FormulaTransactionObserver.java:131) -
formula referenced is "Contact.Account".
It loads Contact in the same TransactionEntityObjectMap which has "BlueID" Auth Provider uddInfo.
 
IMPORTANT: This implementation is NOT allowed as explained in the error message containing this format -

"...(java.lang.IllegalStateException: Programmer Error: you cannot mix EntityObjects with different UddInfos within one transaction: id = 003**********"

This is a limitation in the existing functionality.
Note:  Standard Auth providers such as Salesforce or Facebook aren't affected by this limitation. These providers are like the custom implementation in the described use case. You can use a workaround to avoid mixed objects from User validation rules for custom Auth providers.

For example:

1. Comment out the statement that is thrown in Auth registration handler -- e.g., // update(u);
2. Modify the validation rule to *not* mix the setup and non-setup entity objects as specified in the references below.

Tip (Optional):  Disabling the validation rule makes it work.

*/
}
