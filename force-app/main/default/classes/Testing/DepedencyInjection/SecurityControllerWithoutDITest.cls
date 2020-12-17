@isTest
public with sharing class SecurityControllerWithoutDITest {
  @isTest
  private static void openDoor_userHasAccess_doorOpen() {
    // Given
    Profile profile = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    UserRole userRole = [SELECT Id FROM UserRole WHERE Name = 'COO'];

    User userWithAccess = new User(alias = 'Nagesh', lastname = 'Siripurapu', email = 'nagesh625@gmail.com.invalid', userroleid = userRole.Id, emailencodingkey = 'UTF-8', languagelocalekey = 'en_US', localesidkey = 'en_US', profileid = profile.Id, timezonesidkey = 'America/Los_Angeles', username = System.now().millisecond() + 'nagesh625@gmail.com.invalid');
    insert userWithAccess;

    PermissionSet houseManagementPS = [SELECT Id FROM PermissionSet WHERE Name = 'SalesUserPsl'];
    insert new PermissionSetAssignment(AssigneeId = userWithAccess.id, PermissionSetId = houseManagementPS.Id);

    SecurityService securityHandler = new SecurityServiceImpl();

    // when
    Boolean isUserHasAccess;
    Boolean isOppLineItemUpdated;
    System.runAs(userWithAccess) {
      // Insert Product
      Product2 pr = new Product2();
      pr.Name = 'Moto - G1';
      pr.isActive = true;
      insert pr;

      // Insert Pricebook
      PriceBook2 customPriceBook = new PriceBook2();
      customPriceBook.Name = 'Custom Pricebook';
      customPriceBook.IsActive = true;
      insert customPriceBook;

      // Query Standard and Custom Price Books
      Pricebook2 customPriceBookRec = [SELECT Id FROM Pricebook2 WHERE id = :customPriceBook.Id];
      Id stdPriceBookRecId = Test.getStandardPricebookId();

      // Create Standard PriceBookEntry
      PriceBookEntry stdPriceBookEntry = new PriceBookEntry();
      stdPriceBookEntry.Product2Id = pr.Id;
      stdPriceBookEntry.Pricebook2Id = stdPriceBookRecId;
      stdPriceBookEntry.UnitPrice = 2000;
      stdPriceBookEntry.IsActive = true;
      insert stdPriceBookEntry;

      // Create Custom PriceBookEntry
      PriceBookEntry customPriceBookEntry = new PriceBookEntry();
      customPriceBookEntry.Product2Id = pr.Id;
      customPriceBookEntry.Pricebook2Id = customPriceBookRec.Id;
      customPriceBookEntry.UnitPrice = 5000;
      customPriceBookEntry.IsActive = true;
      insert customPriceBookEntry;

      // Create Opportunity
      Opportunity opp = new Opportunity();
      opp.Name = 'Test';
      opp.CloseDate = System.Today();
      opp.StageName = 'Prospecting';
      insert opp;

      // Add product and Pricebook to the particular opportunity using OpportunityLineItem
      OpportunityLineItem oppLineItem = new OpportunityLineItem();
      oppLineItem.OpportunityId = opp.Id;
      oppLineItem.PricebookEntryId = customPriceBookEntry.Id;
      oppLineItem.UnitPrice = 7000;
      oppLineItem.Quantity = 5;
      insert oppLineItem;

      List<OpportunityLineItem> oppLineItems = new List<OpportunityLineItem>();
      for (Integer index = 0; index < 1; index++) {
        oppLineItem.UnitPrice = 6900;
        oppLineItem.Quantity = 100;
        oppLineItems.add(oppLineItem);
      }
      SecurityController standardHouse = new SecurityController(securityHandler);
      isUserHasAccess = standardHouse.openDoor('Nagesh');
      isOppLineItemUpdated = standardHouse.insertOpportunityLineitem(oppLineItems);
    }

    // Then
    System.assert(isUserHasAccess, 'The door should be open.');
    System.assert(isOppLineItemUpdated, 'The door should be open.');
  }
}
