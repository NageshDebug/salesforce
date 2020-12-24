/**
 Average Test Results

 19:30:23:878 USER_DEBUG [17]|DEBUG|Method-1 Spent Time:307
 19:30:25:151 USER_DEBUG [25]|DEBUG|Method-2 Spent Time:335
 19:30:27:232 USER_DEBUG [33]|DEBUG|Method-3 Spent Time:1003
 19:30:27:774 USER_DEBUG [41]|DEBUG|Method-4 Spent Time:316
 19:30:28:343 USER_DEBUG [49]|DEBUG|Method-5 Spent Time:330
 */

@isTest
public with sharing class Problem1Test {
  @testSetup
  private static void dataSetup() {
    List<Account> accountList = new List<Account>();
    for (Integer i = 0; i < 10000; i++) {
      accountList.add(new Account(Name = 'Nagesh' + i));
    }
    insert accountList;
  }

  @isTest
  private static void test1() {
    Integer startTime = Limits.getCpuTime();
    Problem2.method1();
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
    Problem1.method3();
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-3 Spent Time:' + (endTime - startTime));
  }

  @isTest
  private static void test4() {
    Integer startTime = Limits.getCpuTime();
    Problem1.method4();
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-4 Spent Time:' + (endTime - startTime));
  }

  @isTest
  private static void test5() {
    Integer startTime = Limits.getCpuTime();
    Problem1.method5();
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-5 Spent Time:' + (endTime - startTime));
  }
}
