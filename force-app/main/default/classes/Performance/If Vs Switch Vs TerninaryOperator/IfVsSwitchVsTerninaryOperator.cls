@isTest
public with sharing class IfVsSwitchVsTerninaryOperator {
  @isTest
  public static void method1() {
    Boolean result;
    Integer startTime = Limits.getCpuTime();
    for (Integer i = 0; i < 100000; i++) {
      if ('Test'.equals('Test')) {
        result = true;
      } else {
        result = false;
      }
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void method2() {
    Boolean result;
    Integer startTime = Limits.getCpuTime();
    for (Integer i = 0; i < 100000; i++) {
      result = 'Test'.equals('Test') ? true : false;
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void method3() {
    Boolean result;
    String str = 'Test';
    Integer startTime = Limits.getCpuTime();
    for (Integer i = 0; i < 100000; i++) {
      switch on str {
        when 'Test' {
          result = true;
        }
        when else {
          result = false;
        }
      }
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-3 Spent Time:' + (endTime - startTime));
  }
}