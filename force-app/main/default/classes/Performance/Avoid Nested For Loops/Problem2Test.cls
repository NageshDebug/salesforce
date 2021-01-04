/**
 21:31:34:833 USER_DEBUG [33]|DEBUG|Method-1 Spent Time:12945
 21:31:41:280 USER_DEBUG [41]|DEBUG|Method-2 Spent Time:1424
 21:31:47:304 USER_DEBUG [49]|DEBUG|Method-3 Spent Time:1405
 21:31:53:509 USER_DEBUG [57]|DEBUG|Method-4 Spent Time:1374
 */

@isTest
public with sharing class Problem2Test {
  @testSetup
  private static void dataSetup() {
    List<Account> accountList = new List<Account>();
    for (Integer i = 0; i < 1000; i++) {
      accountList.add(new Account(Name = 'Account' + i, Type = 'Customer - Direct'));
    }
    insert accountList;

    List<Case> caseList = new List<Case>();
    for (Integer i = 0; i < 500; i++) {
      caseList.add(new Case(Status = 'Open', AccountId = accountList.get(i).Id));
    }

    for (Integer i = 500; i < 1000; i++) {
      caseList.add(new Case(Status = 'Working', AccountId = accountList.get(i).Id));
    }
    insert caseList;
  }

  @isTest
  private static void test1() {
    Integer startTime = Limits.getCpuTime();
    Problem2.multipleNestedLoops();
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  @isTest
  private static void test2() {
    Integer startTime = Limits.getCpuTime();
    Problem2.refactoredCode();
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }

  @isTest
  private static void test3() {
    Integer startTime = Limits.getCpuTime();
    Problem2.refactoredCode1();
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-3 Spent Time:' + (endTime - startTime));
  }

  @isTest
  private static void test4() {
    Integer startTime = Limits.getCpuTime();
    Problem2.refactoredCode2();
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-4 Spent Time:' + (endTime - startTime));
  }
}