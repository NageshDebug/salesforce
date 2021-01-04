/**
 23:03:39:542 USER_DEBUG [11]|DEBUG|Method-1 Spent Time:336
 23:03:40:355 USER_DEBUG [22]|DEBUG|Method-2 Spent Time:15
 */
@isTest
public with sharing class Problem4Test {
  @isTest
  public static void method1() {
    Integer startTime = Limits.getCpuTime();
    for (Integer i = 0; i < 50; i++) {
      String recordTypeName = 'Custom Record Type';
      ID recordTypeId = Schema.getGlobalDescribe().get('Account_Client__c').getDescribe().getRecordTypeInfosByName().get(recordTypeName).getRecordTypeId();
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

   @isTest
  public static void method2() {
    Integer startTime = Limits.getCpuTime();
    for (Integer i = 0; i < 50; i++) {
      String recordTypeName = 'Custom Record Type';
      ID recordTypeId = Problem4.getInstance().getRecordTypeId(recordTypeName);
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }
}