public with sharing class ULTR_Solution4 {
  /**
    I was recently developing some Apex logic and encountered the UNABLE_TO_LOCK_ROW error while running my Apex unit tests for the new code. 
    This UNABLE_TO_LOCK_ROW error message can happen when unit tests update the same record(s) at the same time or when unit tests try to create records with 
    duplicate index field values.

    One way to avoid this UNABLE_TO_LOCK_ROW error is to simply turn off parallel test execution. 
    This can be accomplished via Setup > Develop > Apex Test Execution. Then click the Options button and check the "Disable Parallel Testing" selection in the
    resulting dialog. The downside to forcing synchronous test execution is that you may see longer deployment times.

    I prefer asynchronous test execution in my org so I needed to dig into the issue further and try to resolve the problem without losing the ability to run 
    parallel tests.

    In my particular case the issue stemmed from the fact that I was calling the Test.getStandardPricebookId() method from many test methods in a couple of 
    different test classes. What I found was that I could resolve the UNABLE_TO_LOCK_ROW issue entirely by combining all of the test methods into a single 
    class and utilizing the @testSetup annotation to create all of the data for all of the methods first.

    Here is a snippet of the Apex Unit Test Class that I used to resolve this problem.
     */

  static testMethod void methodOne() {
    //perform testing logic
  }

  static testMethod void methodTwo() {
    //perform testing logic
  }

  //testing data setup for all methods in this class
  @testSetup
  static void allTheDataForThisTestClass() {
    //create some products
    List<Product2> products = new List<Product2>();
    products.add(new Product2(Description = 'Testing application for fun', Family = 'Application', IsActive = true, Name = 'Application One', ProductCode = 'TST123ABC001'));
    products.add(new Product2(Description = 'Testing application for games', Family = 'Application', IsActive = true, Name = 'Application Two', ProductCode = 'TST123ABC002'));
    insert products;
    //get the standard pricebook Id
    Id pricebookId = Test.getStandardPricebookId(); //this is available irrespective of the state of SeeAllData
    //create some pricebook entries
    List<PricebookEntry> pricebookEntries = new List<PricebookEntry>();
    pricebookEntries.add(new PricebookEntry(IsActive = true, Pricebook2Id = pricebookId, Product2Id = products[0].Id, UnitPrice = 100.00));
    pricebookEntries.add(new PricebookEntry(IsActive = true, Pricebook2Id = pricebookId, Product2Id = products[1].Id, UnitPrice = 225.55));
    insert pricebookEntries;
    //create an account
    List<Account> accounts = new List<Account>();
    accounts.add(new Account(BillingCity = 'Denver', BillingPostalCode = '80202', BillingStreet = '201 W Colfax Ave, First Floor', BillingState = 'CO', BillingCountry = 'US', Name = 'Tess Trucking Co.', ShippingCity = 'Buffalo', ShippingPostalCode = '14202', ShippingStreet = '65 Niagara Square', ShippingState = 'NY', ShippingCountry = 'US'));
    insert accounts;
    //create a Contact
    List<Contact> contacts = new List<Contact>();
    contacts.add(new Contact(AccountId = accounts[0].Id, Email = 'one@ities.co', Fax = '(303) 555-3000', FirstName = 'Tess', LastName = 'Dachshund', Phone = '(303) 555-1212'));
    insert contacts;
    //insert an Opportunity
    List<Opportunity> opportunities = new List<Opportunity>();
    opportunities.add(new Opportunity(AccountId = accounts[0].Id, Amount = 0.00, CloseDate = Date.Today(), Name = 'Tess Trucking - 2 Widgets', StageName = 'Value Proposition', Type = 'Conversion'));
    insert opportunities;
    //insert an OpportunityContactRole
    List<OpportunityContactRole> contactRoles = new List<OpportunityContactRole>();
    contactRoles.add(new OpportunityContactRole(ContactId = contacts[0].Id, IsPrimary = true, OpportunityId = opportunities[0].Id));
    insert contactRoles;
    //create some OpportunityLineItem records
    List<OpportunityLineItem> opportunityLineItems = new List<OpportunityLineItem>();
    opportunityLineItems.add(new OpportunityLineItem(OpportunityId = opportunities[0].Id, PricebookEntryId = pricebookEntries[0].Id, ServiceDate = Date.Today(), Quantity = 1.00, TotalPrice = 123.22));
    opportunityLineItems.add(new OpportunityLineItem(OpportunityId = opportunities[0].Id, PricebookEntryId = pricebookEntries[1].Id, ServiceDate = Date.Today(), UnitPrice = 98.76, Quantity = 2.00));
    insert opportunityLineItems;
  }
}
