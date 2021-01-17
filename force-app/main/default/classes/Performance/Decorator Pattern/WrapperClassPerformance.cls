/**
 Note that in this scenario the service is returning responses as a custom Apex type. 
 
 It has been observed that using a JSON string as the response type improves the performance, 
 compared to the return type of Apex that is custom-defined. 
 
 The platform under the hood suffers from some performance issues, and this is more noticeable with large datasets.
 */
@isTest
public with sharing class WrapperClassPerformance {
  @isTest
  public static void test1() {
    Integer startTime = Limits.getCpuTime();
    List<AccountWrapper> accountWrapperList = AccountWrapperController.queryAllAccountsWithContacts1();

    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void test2() {
    Integer startTime = Limits.getCpuTime();
    String str = AccountWrapperController.queryAllAccountsWithContacts2();
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }
}
