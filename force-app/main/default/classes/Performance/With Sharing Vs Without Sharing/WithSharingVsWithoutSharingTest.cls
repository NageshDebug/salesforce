@isTest
public without sharing class WithSharingVsWithoutSharingTest {
  @isTest
  public static void test1() {
    Test.startTest();
    System.runAs(createMockUserForProfile('System Administrator', 'Nagesh')) {
      List<Account> acctList = new List<Account>();
      for (Integer index = 0; index < 1000; index++) {
        acctList.add(new Account(name = 'Nagesh' + index));
      }
      insert acctList;

      Integer startTime = Limits.getCpuTime();
      for (Integer index = 0; index < 10; index++) {
        WithSharingService.getAccounts();
      }
      Integer endTime = Limits.getCpuTime();
      System.debug('Method-1 Spent Time:' + (endTime - startTime));
    }
    Test.stopTest();
  }

  @isTest
  public static void test2() {
    Test.startTest();
    System.runAs(createMockUserForProfile('System Administrator', 'Nagesh')) {
      List<Account> acctList = new List<Account>();
      for (Integer index = 0; index < 1000; index++) {
        acctList.add(new Account(name = 'Nagesh' + index));
      }
      insert acctList;

      Integer startTime = Limits.getCpuTime();
      for (Integer index = 0; index < 10; index++) {
        WithoutSharingService.getAccounts();
      }
      Integer endTime = Limits.getCpuTime();
      System.debug('Method-2 Spent Time:' + (endTime - startTime));
    }
    Test.stopTest();
  }

  @isTest
  public static void test3() {
    Test.startTest();
    System.runAs(createMockUserForProfile('Standard User', 'Nagesh')) {
      List<Account> acctList = new List<Account>();
      for (Integer index = 0; index < 1000; index++) {
        acctList.add(new Account(name = 'Nagesh' + index));
      }
      insert acctList;

      Integer startTime = Limits.getCpuTime();
      for (Integer index = 0; index < 10; index++) {
        WithSharingService.getAccounts();
      }
      Integer endTime = Limits.getCpuTime();
      System.debug('Method-3 Spent Time:' + (endTime - startTime));
    }
    Test.stopTest();
  }

  @isTest
  public static void test4() {
    Test.startTest();
    System.runAs(createMockUserForProfile('Standard User', 'Nagesh')) {
      List<Account> acctList = new List<Account>();
      for (Integer index = 0; index < 1000; index++) {
        acctList.add(new Account(name = 'Nagesh' + index));
      }
      insert acctList;

      Integer startTime = Limits.getCpuTime();
      for (Integer index = 0; index < 10; index++) {
        WithOutSharingService.getAccounts();
      }
      Integer endTime = Limits.getCpuTime();
      System.debug('Method-4 Spent Time:' + (endTime - startTime));
    }
    Test.stopTest();
  }

  @isTest
  public static void test5() {
    Test.startTest();
    System.runAs(createMockUserForProfile('Standard User', 'Sanvi')) {
      List<Account> acctList = new List<Account>();
      for (Integer index = 0; index < 1000; index++) {
        acctList.add(new Account(name = 'Nagesh' + index));
      }
      insert acctList;

      Integer startTime = Limits.getCpuTime();
      for (Integer index = 0; index < 10; index++) {
        WithSharingService.getAccounts();
      }
      Integer endTime = Limits.getCpuTime();
      System.debug('Method-5 Spent Time:' + (endTime - startTime));
    }
    Test.stopTest();
  }

  @isTest
  public static void test6() {
    Test.startTest();
    System.runAs(createMockUserForProfile('Standard User', 'Sanvi')) {
      List<Account> acctList = new List<Account>();
      for (Integer index = 0; index < 1000; index++) {
        acctList.add(new Account(name = 'Nagesh' + index));
      }
      insert acctList;

      Integer startTime = Limits.getCpuTime();
      for (Integer index = 0; index < 10; index++) {
        WithOutSharingService.getAccounts();
      }
      Integer endTime = Limits.getCpuTime();
      System.debug('Method-6 Spent Time:' + (endTime - startTime));
    }
    Test.stopTest();
  }

  private static User createMockUserForProfile(String profileName, String userAliasName) {
    Profile p = [SELECT Id FROM profile WHERE name LIKE :profileName];
    return createMockUser(p.id, userAliasName);
  }

  private static User createMockUser(Id profileId, String userAliasName) {
    User u = new User(alias = userAliasName, email = System.now().millisecond() + 'newuser@tgerm.com.test', emailencodingkey = 'UTF-8', lastname = 'Testing', languagelocalekey = 'en_US', localesidkey = 'en_US', profileid = profileId, timezonesidkey = 'America/Los_Angeles', username = System.now().millisecond() + 'newuser@tgerm.com.test');
    insert u;
    return u;
  }
}
