public class NageshUnitOfWork {
  public static void insertRecords() {
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
  }

  public static void insertRecordsUsingUOW() {
    fflib_ISObjectUnitOfWork uow = NageshApplication.UnitOfWork.newInstance();

    Opportunity opp = new Opportunity();
    opp.Name = 'Test';
    opp.CloseDate = System.Today();
    opp.StageName = 'Prospecting';
    uow.registerNew(opp);

    Product2 pr = new Product2();
    pr.Name = 'Moto - G1';
    pr.isActive = true;
    uow.registerNew(pr);

    // Query Standard and Custom Price Books
    Id stdPriceBookRecId = Test.getStandardPricebookId();

    // Create Standard PriceBookEntry
    PriceBookEntry stdPriceBookEntry = new PriceBookEntry();
    stdPriceBookEntry.Product2Id = pr.Id;
    stdPriceBookEntry.Pricebook2Id = stdPriceBookRecId;
    stdPriceBookEntry.UnitPrice = 2000;
    stdPriceBookEntry.IsActive = true;
    uow.registerNew(stdPriceBookEntry, PricebookEntry.Product2Id, pr);

    // Add product and Pricebook to the particular opportunity using OpportunityLineItem
    OpportunityLineItem oppLineItem = new OpportunityLineItem();
    oppLineItem.OpportunityId = opp.Id;
    oppLineItem.PricebookEntryId = stdPriceBookEntry.Id;
    oppLineItem.UnitPrice = 7000;
    oppLineItem.Quantity = 5;
    uow.registerRelationship(oppLineItem, OpportunityLineItem.PricebookEntryId, stdPriceBookEntry);
    uow.registerNew(oppLineItem, OpportunityLineItem.OpportunityId, opp);

    uow.commitWork();
  }
}