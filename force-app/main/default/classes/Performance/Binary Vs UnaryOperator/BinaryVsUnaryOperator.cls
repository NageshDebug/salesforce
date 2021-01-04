/**
 03:11:42:057 USER_DEBUG [11]|DEBUG|Method-1 Spent Time:53
 03:11:42:341 USER_DEBUG [22]|DEBUG|Method-2 Spent Time:50
 */
@isTest
public with sharing class BinaryVsUnaryOperator {
  @isTest
  public static void test1() {
    Integer startTime = Limits.getCpuTime();
    Integer sum = 0;
    for (Integer Index = 0; index < 1000000; index++) {
      sum = sum + 1;
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void test2() {
    Integer startTime = Limits.getCpuTime();
    Integer sum = 0;
    for (Integer Index = 0; index < 1000000; index++) {
      sum++;
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }
}