/**
 * It is just for 10000 records. Think about Batch jobs.
 *
 * 18:03:37:709 USER_DEBUG [23]|DEBUG|Method-1 Spent Time:261
 * 18:03:39:120 USER_DEBUG [31]|DEBUG|Method-2 Spent Time:209
 */
@isTest
public with sharing class AvoidForLoopTest {
  @testSetup
  private static void dataSetup() {
    List<Account> accountList = new List<Account>();
    for (Integer i = 0; i < 10000; i++) {
      accountList.add(new Account(Name = 'Nagesh' + i, site = 'www.nagesh625.blogspot.com', rating = 'Hot', AccountNumber = '1' + i));
    }
    insert accountList;
  }

  @isTest
  private static void test1() {
    Integer startTime = Limits.getCpuTime();
    NumberOfStatements.NumberOfExecutionStatements();
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  @isTest
  private static void test2() {
    Integer startTime = Limits.getCpuTime();
    NumberOfStatements.NumberOfExecutionStatements_Reduced();
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }
}
