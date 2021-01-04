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
    Problem1.method1();
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  @isTest
  private static void test2() {
    Integer startTime = Limits.getCpuTime();
    Problem1.method2();
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