public with sharing class FutureClass {
  @future
  public static void insertUserWithRole(String uname, String alias, String email, String lname) {
    Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    UserRole r = [SELECT Id FROM UserRole WHERE Name = 'CEO'];
    // Create new user with a non-null user role ID
    User u = new User(alias = alias, email = email, emailencodingkey = 'UTF-8', lastname = lname, languagelocalekey = 'en_US', localesidkey = 'en_US', profileid = p.Id, userroleid = r.Id, timezonesidkey = 'America/Los_Angeles', username = uname);
    insert u;
  }
}
