/**
 03:54:56:627 USER_DEBUG [10]|DEBUG|Method-1 Spent Time:615
 03:54:58:309 USER_DEBUG [20]|DEBUG|Method-2 Spent Time:700
 */
@isTest
public with sharing class StringComparisionTest {
  @isTest
  public static void method1() {
    Integer startTime = Limits.getCpuTime();
    for (Integer i = 0; i < 100000; i++) {
      Boolean result = 'Test'.equals('Test');
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void method2() {
    Integer startTime = Limits.getCpuTime();
    for (Integer i = 0; i < 100000; i++) {
      Boolean result = 'Test'.equalsIgnoreCase('Test');
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }
}
