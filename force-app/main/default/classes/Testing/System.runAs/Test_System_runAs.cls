@isTest
private with sharing class Test_System_runAs {
  /*
 This test class has two test methods, i.e.
  1. testWithSysAdmin() executes a FLS check with SYS Admin profile
  2. testWithChatterFree()  executes a FLS check with Chatter Free profile

  Note: You can create new users with runAs even if your organization has no additional user licenses.

  QUESTION
  According to the document, the runAs method doesn’t enforce user permissions or field-level permissions, only record sharing. 
  I'm not sure, whether i'm doing correct or not.
*/

  @isTest
  private static void testWithSysAdmin() {
    System.runAs(createMockUserForProfile('System Administrator')) {
      // This debug indicates different profiles
      System.debug('ProfileId:' + Userinfo.getProfileId());
      System.assertEquals(true, Account.BillingCity.getDescribe().isUpdateable());
    }
  }

  @isTest
  public static void testWithChatterFree() {
    System.runAs(createMockUserForUserLicense('Chatter Free')) {
      // This debug indicates different profiles
      System.debug('ProfileId:' + Userinfo.getProfileId());
      // Chatter Free user has no permission on the Account, so it should be false
      System.assertEquals(false, Account.BillingCity.getDescribe().isUpdateable());
    }
  }

  private static User createMockUserForUserLicense(String licenseName) {
    Profile p = [SELECT Id FROM profile WHERE UserLicense.Name LIKE :licenseName LIMIT 1];
    return createMockUser(p.id);
  }

  private static User createMockUserForProfile(String profileName) {
    Profile p = [SELECT Id FROM profile WHERE name LIKE :profileName];
    return createMockUser(p.id);
  }

  private static User createMockUser(Id profileId) {
    User u = new User(alias = 'newUser', email = 'newuser@tgerm.com.test', emailencodingkey = 'UTF-8', lastname = 'Testing', languagelocalekey = 'en_US', localesidkey = 'en_US', profileid = profileId, timezonesidkey = 'America/Los_Angeles', username = System.now().millisecond() + 'newuser@tgerm.com.test');
    insert u;
    return u;
  }
}
