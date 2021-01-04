/**
 02:54:09:260 USER_DEBUG [18]|DEBUG|Method-1 Spent Time:113
 02:54:10:818 USER_DEBUG [41]|DEBUG|Method-2 Spent Time:763
 02:54:12:164 USER_DEBUG [54]|DEBUG|Method-3 Spent Time:1195
 02:54:24:165 USER_DEBUG [78]|DEBUG|Method-4 Spent Time:11312
 */
@isTest
public with sharing class AssignmentOperatorTest {
  @testSetup
  public static void dataSetup() {
    insert new Account(Name = 'Nagesh');
  }

  @isTest
  public static void test1() {
    Account a = [SELECT Id, Name FROM Account LIMIT 1];

    ID accountID;
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index < 100000; index++) {
      accountID = a.Id;
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  
  @isTest
  public static void test2() {
    Account a = [SELECT Id, Name FROM Account LIMIT 1];

    ID accountID;
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index < 100000; index++) {
      accountID = a.Id;
      accountID = a.Id;
      accountID = a.Id;
      accountID = a.Id;
      accountID = a.Id;
      accountID = a.Id;
      accountID = a.Id;
      accountID = a.Id;
      accountID = a.Id;
      accountID = a.Id;
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void test3() {
    Account a = [SELECT Id, Name FROM Account LIMIT 1];

    ID accountID;
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index < 100000; index++) {
      accountID = (ID) a.get('Id');
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-3 Spent Time:' + (endTime - startTime));
  }


  
  @isTest
  public static void test4() {
    Account a = [SELECT Id, Name FROM Account LIMIT 1];

    ID accountID;
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index < 100000; index++) {
      accountID = (ID) a.get('Id');
      accountID = (ID) a.get('Id');
      accountID = (ID) a.get('Id');
      accountID = (ID) a.get('Id');
      accountID = (ID) a.get('Id');
      accountID = (ID) a.get('Id');
      accountID = (ID) a.get('Id');
      accountID = (ID) a.get('Id');
      accountID = (ID) a.get('Id');
      accountID = (ID) a.get('Id');
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-4 Spent Time:' + (endTime - startTime));
  }

}