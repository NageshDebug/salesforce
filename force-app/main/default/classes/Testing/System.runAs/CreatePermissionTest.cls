@isTest
private class CreatePermissionTest {
  //Test method
  @isTest
  private static void testRunAs() {
    Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];

    UserRole userRole = [SELECT Id FROM UserRole WHERE Name = 'COO'];

    //Create our test user
    User u = new User(alias = 'random', email = 'random@salesforce.com', emailencodingkey = 'UTF-8', lastname = 'random', localesidkey = 'en_US', languagelocalekey = 'en_US', profileid = p.Id, userroleid = userRole.Id, timezonesidkey = 'America/Los_Angeles', username = System.currentTimeMillis() + 'randomuser@salesforceTest.com');
    //Insert user record
    insert u;

    //Perform logic on account within the system.runAs() block
    System.runAs(u) {
      //create account record
      Account a = new Account(name = 'Acme');
      //Insert account - this will cause mixed dml error as we have already inserted a user record
      insert a;

      //Now we can add our testing logic for account here
    }
  }
}
