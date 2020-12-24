/**
 03:32:00:249 USER_DEBUG [22]|DEBUG|Method-2 Spent Time:240
 03:32:00:766 USER_DEBUG [11]|DEBUG|Method-1 Spent Time:257
 * 
 */
@isTest
public with sharing class AssignmentOperatorTest1 {
  @isTest
  public static void incrementTest() {
    List<Integer> lst = new List<Integer>();
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index <= 100000; index++) {
      lst.add(index);
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void decrementTest() {
    List<Integer> lst = new List<Integer>();
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 100000; index >= 0; index--) {
      lst.add(index);
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }
}
