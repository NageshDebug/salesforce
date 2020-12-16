@isTest
private with sharing class TestCreateAndDeletePermissions {
  @isTest
  private static void createOppMethod() {
    try {
      Test.startTest();
      Profile prof = [SELECT Id FROM Profile WHERE Name = 'Standard User']; //get a profile Id
      User testUser = new User(Alias = 'TDemo', Email = 'sakthi@theblogreaders.com', EmailEncodingKey = 'ISO-8859-1', FirstName = 'Demo', LanguageLocaleKey = 'en_US', LastName = 'User', LocaleSidKey = 'en_US', ProfileId = prof.Id, TimeZoneSidKey = 'America/Denver', Username = System.currentTimeMillis() + 'demo.sakthi@theblogreaders.com');
      insert testUser;
      System.runAs(testUser) {
        Opportunity createOpp = new Opportunity();
        createOpp.Name = 'test opp';
        createOpp.StageName = 'Closed Won';
        createOpp.Probability = 95;
        createOpp.CloseDate = system.today();
        insert createOpp;
        delete createOpp;

        //Apex Trigger addError Checking
        Opportunity testResult = [SELECT Id, IsClosed FROM Opportunity WHERE Id = :createOpp.Id];
        system.debug('testResult.IsClosed:::' + testResult.IsClosed);
        system.assertEquals(true, testResult.IsClosed);
      }
      Test.stopTest();
    } catch (Exception e) {
      system.debug('error::' + e);
    }
  }
}