/**
 02:32:03:152 USER_DEBUG [12]|DEBUG|Method-1 Spent Time:1034
 02:32:04:341 USER_DEBUG [24]|DEBUG|Method-2 Spent Time:442
 */
@isTest
public with sharing class DecimalVsDoubleTest {
  @isTest
  public static void decimalTest() {
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index < 100000; index++) {
      Decimal a = 0.02;
      Decimal b = 0.03;
      Decimal c = b - a; //02:36:46:002 USER_DEBUG [6]|DEBUG|Result------->0.01
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void doubleTest() {
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index < 100000; index++) {
      Double a = 0.02;
      Double b = 0.03;
      Double c = b - a; //02:36:46:002 USER_DEBUG [12]|DEBUG|Result------->-0.009999999999999998
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }
}
