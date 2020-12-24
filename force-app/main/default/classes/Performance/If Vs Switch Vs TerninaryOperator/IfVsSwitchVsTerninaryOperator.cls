/**
 *04:17:17:851 USER_DEBUG [15]|DEBUG|Method-1 Spent Time:769
 04:17:19:438 USER_DEBUG [26]|DEBUG|Method-2 Spent Time:736
 04:17:20:381 USER_DEBUG [45]|DEBUG|Method-3 Spent Time:856
 */
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
