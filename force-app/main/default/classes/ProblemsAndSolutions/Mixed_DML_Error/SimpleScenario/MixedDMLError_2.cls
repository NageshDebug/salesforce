public with sharing class MixedDMLError_2 {
  public void insertUserWithAccount() {
    Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    UserRole r = [SELECT Id FROM UserRole WHERE Name = 'COO'];
    // Create new user with a non-null user role ID
    User u = new User(alias = 'naag', email = System.currentTimeMillis() + 'nagesh625@gmail.com', emailencodingkey = 'UTF-8', lastname = 'Siripurapu', languagelocalekey = 'en_US', localesidkey = 'en_US', profileid = p.Id, userroleid = r.Id, timezonesidkey = 'America/Los_Angeles', username = System.currentTimeMillis() + 'nagesh625@gmail.com');
    insert u;

    Account a = new Account(Name = 'Nagesh');
    insert a;
    /***
    
    12:19:12.58 (393552294)|EXCEPTION_THROWN|[9]|System.DmlException: Insert failed. First exception on row 0; first error: MIXED_DML_OPERATION, DML operation on setup object is not permitted after you have updated a non-setup object (or vice versa): User, original object: Account: []
    12:19:12.58 (394949206)|FATAL_ERROR|System.DmlException: Insert failed. First exception on row 0; first error: MIXED_DML_OPERATION, DML operation on setup object is not permitted after you have updated a non-setup object (or vice versa): User, original object: Account: []
     */
  }
}