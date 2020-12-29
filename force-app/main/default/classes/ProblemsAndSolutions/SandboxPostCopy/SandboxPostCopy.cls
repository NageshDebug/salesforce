public with sharing class SandboxManager implements SandboxPostCopy {
  /**
   Certainly, some of this reference data can be stored in custom settings, which is ideal because custom settings are automatically copied to newly refreshed 
   sandboxes. However, we often find reference data is stored in custom objects, which are not automatically copied to new Developer sandboxes. 
   
   In fact, some of our clients have so much reference data that they avoid refreshing sandboxes whenever possible, with the result that developers may be 
   working in sandboxes that are months or even years out of sync with Production.

   With help of this Sandbox Refresh Apex Class, you can process data, execute script for business logic or create some test data in your created or refreshed sandbox. 
   This feature is very useful when a Salesforce instance is refreshed frequently.

        Tip-1: How to maintain data specific to the enviroment (Developer Sandbox, SIT, UAT, Stage & Production).

        Tip-2: How to maintain external client service endpoints and OAUTH configuration info wrt the environment.
                 Sandbox endpoints, UAT endpoints and production endpoints

        Tip-3: How to control to copy the production data from Production to Sandbox to test some specific use cases.
        
        Tip-4: Using the SandboxPostCopy Interface to Update System Admin Email Addresses

        Tip-5: involves removing sensitive data from fields on some objects, invalidating customer emails and other data manipulations. This enforces data standard policies and prevents email automations from reaching the customers during the development phases.

        Tip-6: we get the list of email fields from User object whose profile is System Administrator and replace the email addresses with correct email address and update the user object. In the same way, you can do for all other object’s email fields and update them with invalidate email address.



Realtime Examples
------------------
Example-1: The org has a custom object that lists postal codes and their tax rates. An Opportunity trigger requires a Postal Code record before an Opportunity can be created, so before anyone can do any Opportunity work in the sandbox, somebody has to manually import a list of postal codes.

Example-2: A company has a handful of business partners, represented by Account records. Before any testing can happen in the sandbox, somebody has to manually create Account records for these business partners.

Example-3: A client with a custom product bundling solution has a custom object that identifies the Products that are associated with each bundle. Before anyone can test Opportunities in the sandbox, the Product Bundling object has to be manually imported into the sandbox.



        https://www.soliantconsulting.com/blog/salesforce-sandboxpostcopy/
    */

  //This interface has only one method.
  global void runApexClass(SandboxContext context) {
    updateCurrentEnvironmentSetting();
  }

  @testVisible
  private void updateCurrentEnvironmentSetting() {
    CurrentEnvironment__c currentEnvironment = CurrentEnvironment__c.getValues('currentEnvironment');
    currentEnvironment.environment__c = 'UAT';
    update currentEnvironment;
  }
}
