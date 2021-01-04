/**
 23:52:58:898 USER_DEBUG [14]|DEBUG|Method-1 Spent Time:3205
 23:53:06:759 USER_DEBUG [28]|DEBUG|Method-2 Spent Time:26
 */
@isTest
public with sharing class Problem5Test {
  @isTest
  private static void test1() {
    List<Account> accountList = new List<Account>();
    for (Integer i = 0; i < 2000; i++) {
      accountList.add(new Account(Name = 'Nagesh' + i));
    }
    insert accountList;

    Integer startTime = Limits.getCpuTime();
    Problem5.readCustomMetadata(accountList);
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  @isTest
  private static void test2() {
    List<Account> accountList = new List<Account>();
    for (Integer i = 0; i < 2000; i++) {
      accountList.add(new Account(Name = 'Nagesh' + i));
    }
    insert accountList;

    Integer startTime = Limits.getCpuTime();
    Problem5.readCustomMetadata1(accountList);
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }
}