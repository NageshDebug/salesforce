public with sharing class MixedDMLError_1 {
  public void insertUserWithAccount() {
    Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    UserRole r = [SELECT Id FROM UserRole WHERE Name = 'COO'];
    // Create new user with a non-null user role ID
    User u = new User(alias = 'naag', email = System.currentTimeMillis() + 'nagesh625@gmail.com', emailencodingkey = 'UTF-8', lastname = 'Siripurapu', languagelocalekey = 'en_US', localesidkey = 'en_US', profileid = p.Id, userroleid = r.Id, timezonesidkey = 'America/Los_Angeles', username = System.currentTimeMillis() + 'nagesh625@gmail.com');
    insert u;

    Account a = new Account(Name = 'Nagesh');
    insert a;
    /***
    12:24:37.56 (547264359)|EXCEPTION_THROWN|[10]|System.DmlException: Insert failed. First exception on row 0; first error: MIXED_DML_OPERATION, DML operation on setup object is not permitted after you have updated a non-setup object (or vice versa): Account, original object: User: []
    12:24:37.56 (548402048)|FATAL_ERROR|System.DmlException: Insert failed. First exception on row 0; first error: MIXED_DML_OPERATION, DML operation on setup object is not permitted after you have updated a non-setup object (or vice versa): Account, original object: User: []
    
     */
  }
}
