@isTest
private with sharing class Example {
  @isTest
  private static void test_mixed_dmlIssue() {
    User thisUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()];
    // Insert account as current user
    System.runAs(thisUser) {
      Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
      UserRole r = [SELECT Id FROM UserRole WHERE Name = 'COO'];

      User u = new User(alias = 'jsmith', email = System.currentTimeMillis() + 'jsmith@acme.com', emailencodingkey = 'UTF-8', lastname = 'Smith', languagelocalekey = 'en_US', localesidkey = 'en_US', profileid = p.Id, userroleid = r.Id, timezonesidkey = 'America/Los_Angeles', username = System.currentTimeMillis() + 'jsmith@acme.com');
      insert u;
      Account a = new Account(name = 'Acme');
      insert a;
    }
  }
}
