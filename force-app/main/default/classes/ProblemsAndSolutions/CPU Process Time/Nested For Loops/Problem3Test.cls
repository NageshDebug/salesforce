/***
 22:36:37:416 USER_DEBUG [28]|DEBUG|Method-1 Spent Time:4009
 22:36:37:791 USER_DEBUG [36]|DEBUG|Method-2 Spent Time:93
 */
@isTest
public with sharing class Problem3Test {
  @testSetup
  public static void setup() {
    List<Contact> cntList = new List<Contact>();
    String email = 'nsiripurapu@paypal.com';
    Integer MAX_RECORDS = 500;
    for (Integer i = 0; i < MAX_RECORDS; i++) {
      cntList.add(new contact(FirstName = 'Nagesh' + i, lastname = 'Siripurapu' + i, email = System.currentTimeMillis() + email));
    }
    Database.DMLOptions dml = new Database.DMLOptions();
    dml.DuplicateRuleHeader.AllowSave = true;
    Database.insert(cntList, dml);

    List<Case> caseList = new List<Case>();
    for (Integer i = 0; i < MAX_RECORDS; i++) {
      Contact c = cntList.get(i);
      caseList.add(new Case(SuppliedEmail = c.email, Contactid = c.Id));
    }
    insert caseList;
  }

  @isTest
  public static void method1() {
    Integer startTime = Limits.getCpuTime();
    Problem3.issue();
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void method2() {
    Integer startTime = Limits.getCpuTime();
    Problem3.refactoringCode();
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }
}
