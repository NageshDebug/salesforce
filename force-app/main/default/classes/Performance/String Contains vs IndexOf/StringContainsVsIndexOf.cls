@isTest
public with sharing class StringContainsVsIndexOf {
   @isTest
  public static void method1() {
    Integer startTime = Limits.getCpuTime();
    for (Integer i = 0; i < 100000; i++) {
      Boolean result = 'This is Testing'.contains('Test');
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

   @isTest
  public static void method2() {
    Integer startTime = Limits.getCpuTime();
    for (Integer i = 0; i < 100000; i++) {
      Boolean result = 'This is Testing'.containsAny('Test');
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }

  
   @isTest
  public static void method3() {
    Integer startTime = Limits.getCpuTime();
    for (Integer i = 0; i < 100000; i++) {
      Boolean result = 'This is Testing'.containsIgnoreCase('Test');
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-3 Spent Time:' + (endTime - startTime));
  }

  
   @isTest
  public static void method4() {
    Integer startTime = Limits.getCpuTime();
    for (Integer i = 0; i < 100000; i++) {
      Boolean result = 'This is Testing'.indexOf('Test')>0;
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-4 Spent Time:' + (endTime - startTime));
  }

   @isTest
  public static void method5() {
    Integer startTime = Limits.getCpuTime();
    for (Integer i = 0; i < 100000; i++) {
      Boolean result = 'This is Testing'.indexOf('Test',1)>0;
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-5 Spent Time:' + (endTime - startTime));
  }

  
   @isTest
  public static void method6() {
    Integer startTime = Limits.getCpuTime();
    for (Integer i = 0; i < 100000; i++) {
      Boolean result = 'This is Testing'.indexOfAny('Test')>0;
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-6 Spent Time:' + (endTime - startTime));
  }
}