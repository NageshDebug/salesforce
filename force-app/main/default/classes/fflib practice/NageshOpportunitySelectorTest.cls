@isTest(seeAllData=false)
private class NageshOpportunitySelectorTest {
  @TestSetup
  private static void makeData() {
    Account testAccount = new Account(Name = 'Nagesh', Industry = 'Agriculture', AnnualRevenue = 500000);
    insert testAccount;

    List<Opportunity> opportunityList = new List<Opportunity>();
    for (Integer index = 0; index < 5; index++) {
      opportunityList.add(new Opportunity(Name = 'Nagesh' + index, AccountId = testAccount.Id, Probability = 10, StageName = 'Discovery', DeliveryInstallationStatus__c = 'In progress', DiscountType__c = 'All Products', InvoicedStatus__c = 'Invoiced', Deal_Eligible_Countries__c = 'IN;AU;CN;GB', Target_Products__c = 'Express Checkout;Virtual Terminal;Paypal Here', CloseDate = Date.today()));
    }
    insert opportunityList;

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
    opp.AccountId = testAccount.Id;
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

    Contract cntract = new Contract(AccountId = testAccount.Id, Status = 'Draft', StartDate = Date.today(), ContractTerm = 12);
    insert cntract;

    Order ordr = new Order(Name = 'Nagesh Order', AccountId = testAccount.Id, ContractId = cntract.Id, EffectiveDate = Date.today(), Status = 'Draft');
    insert ordr;

    Invoice__c invoice = new invoice__c(InvoiceDate__c = Date.today(), Opportunity__c = opp.Id);
    insert invoice;
  }

  @isTest
  private static void test_findOpportunityById() {
    Set<ID> st = new Set<ID>();
    for (Opportunity opp : [SELECT Id, Name FROM Opportunity]) {
      st.add(opp.ID);
    }
    List<Opportunity> opportunityList = new NageshOpportunitySelector().findOpportunityById(st);
    System.assertEquals(6, opportunityList.size());
  }

  @isTest
  private static void test_findOpportunityByName() {
    Set<String> st = new Set<String>();
    for (Opportunity opp : [SELECT Id, Name FROM Opportunity]) {
      st.add(opp.Name);
    }
    List<Opportunity> opportunityList = new NageshOpportunitySelector().findOpportunityByName(st);
    System.assertEquals(6, opportunityList.size());
  }
  @isTest
  private static void test_findOpportunityByNameUsingQueryFactory() {
    Set<String> st = new Set<String>();
    for (Opportunity opp : [SELECT Id, Name FROM Opportunity]) {
      st.add(opp.Name);
    }
    List<Opportunity> opportunityList = new NageshOpportunitySelector().findOpportunityByNameUsingQueryFactory(st);
    System.assertEquals(6, opportunityList.size());
  }

  @isTest
  private static void test_findAggregateDetails() {
    List<Id> oppIds = new List<Id>();
    for (Opportunity opportunity : [SELECT Id FROM Opportunity]) {
      oppIds.add(opportunity.Id);
    }
    Decimal sumOfProbability = new NageshOpportunitySelector().findAggregateDetails(oppIds);
    System.assertEquals(10, sumOfProbability);
  }

  @isTest
  private static void test_findRelatedDetails() {
    List<OpportunityLineItem> oppLineItem = [SELECT Id FROM OpportunityLineItem];
    if (oppLineItem != null && !oppLineItem.isEmpty()) {
      Opportunity oppDetails = new NageshOpportunitySelector().findRelatedDetails(oppLineItem[0].Id);
      System.assertEquals('Test', oppDetails.Name);
    }
  }

  @isTest
  private static void test_findByOpportunityLineItemIdIdAndPageNumber() {
    List<OpportunityLineItem> oppLineItem = [SELECT Id FROM OpportunityLineItem];
    if (oppLineItem != null && !oppLineItem.isEmpty()) {
      List<Opportunity> oppDetails = new NageshOpportunitySelector().findByOpportunityLineItemIdIdAndPageNumber(oppLineItem[0].Id, 1);
      System.assertEquals(0, oppDetails.size());
    }
  }

  @isTest
  private static void test_findOpportunitiesByMultipicklistValues() {
    List<Id> oppList = new List<Id>();
    for (Opportunity op : [SELECT Id FROM Opportunity WHERE StageName = 'Discovery']) {
      oppList.add(op.Id);
    }

    List<String> targetProducts = new List<String>();
    targetProducts.add('Express Checkout');
    targetProducts.add('Virtual Terminal');
    targetProducts.add('Paypal Here');

    List<String> eligibleCountries = new List<String>();
    eligibleCountries.add('IN');
    eligibleCountries.add('AU');
    eligibleCountries.add('CN');
    eligibleCountries.add('GB');

    List<String> installationStatus = new List<String>();
    installationStatus.add('In progress');
    installationStatus.add('Yet to begin');
    installationStatus.add('Completed');

    List<String> discountTypes = new List<String>();
    discountTypes.add('All Products');
    discountTypes.add('Approved Products');

    List<String> invoiceStatus = new List<String>();
    invoiceStatus.add('Not Ready');
    invoiceStatus.add('Ready');
    invoiceStatus.add('Invoiced');

    List<Opportunity> oppDetails = new NageshOpportunitySelector().findOpportunitiesByMultipicklistValues(targetProducts, eligibleCountries, installationStatus, discountTypes, invoiceStatus, oppList);
    System.assertEquals(0, oppDetails.size());
  }

  @isTest
  private static void test_findByIdWithLineItems() {
    Set<Id> oppList = new Set<Id>();
    for (Opportunity op : [SELECT Id FROM Opportunity WHERE StageName = 'Discovery']) {
      oppList.add(op.Id);
    }

    List<Opportunity> oppDetails = new NageshOpportunitySelector().findByIdWithLineItems(oppList);
    System.assertEquals(5, oppDetails.size());
  }

  @isTest
  private static void test_findOpportunityByIdUsingFieldset() {
    Set<Id> oppList = new Set<Id>();
    for (Opportunity op : [SELECT Id FROM Opportunity WHERE StageName = 'Discovery']) {
      oppList.add(op.Id);
    }

    List<Opportunity> oppDetails = new NageshOpportunitySelector(true).selectSObjectsById(oppList);
    System.assertEquals(5, oppDetails.size());
  }

  @isTest
  private static void test_findOpportunityAndItsParentAccounts() {
    Set<Id> oppList = new Set<Id>();
    for (Opportunity op : [SELECT Id FROM Opportunity WHERE StageName = 'Discovery']) {
      oppList.add(op.Id);
    }

    List<Opportunity> oppDetails = new NageshOpportunitySelector(true).findOpportunityAndItsParentAccounts(oppList);
    System.assertEquals(5, oppDetails.size());
  }

  @isTest
  private static void test_findOpportunityAndAccountsDetails() {
    Set<Id> oppList = new Set<Id>();
    for (Opportunity op : [SELECT Id FROM Opportunity WHERE StageName = 'Discovery']) {
      oppList.add(op.Id);
    }

    List<Opportunity> oppDetails = new NageshOpportunitySelector().findOpportunityAndAccountsDetails(oppList);
    for (Opportunity op : oppDetails) {
      System.assertEquals('Agriculture', op.Account.Industry);
      System.assertEquals(500000, op.Account.AnnualRevenue);
    }
  }

  @isTest
  private static void test_findOpportunityWithMultipleWhereConditions() {
    Set<Id> oppList = new Set<Id>();
    for (Opportunity op : [SELECT Id FROM Opportunity WHERE StageName = 'Discovery']) {
      oppList.add(op.Id);
    }

    List<Opportunity> oppDetails = new NageshOpportunitySelector().findOpportunityWithMultipleWhereConditions(oppList);
    System.assertEquals(6, oppDetails.size());
  }

  @isTest
  private static void test_findByOpportunityAndAccountDetailsUsingDifferentSelectors() {
    Set<String> acctNames = new Set<String>();
    for (Account acct : [SELECT Id, Name FROM Account]) {
      acctNames.add(acct.Name);
    }

    List<Opportunity> oppDetails = new NageshOpportunitySelector().findByOpportunityAndAccountDetailsUsingDifferentSelectors(acctNames);
    System.assertEquals(6, oppDetails.size());
  }

  @isTest
  private static void test_selectByIdWithLineItems() {
    Set<Id> oppList = new Set<Id>();
    for (Opportunity op : [SELECT Id FROM Opportunity WHERE StageName = 'Discovery']) {
      oppList.add(op.Id);
    }

    List<Opportunity> oppDetails = new NageshOpportunitySelector().selectByIdWithLineItems(oppList);
    System.assertEquals(5, oppDetails.size());
  }
}
