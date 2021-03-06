/**
Output-1: (LOOP SIZE=1000)
    23:08:43.2 (109488923)|USER_DEBUG|[11]|DEBUG|Method-1 Spent Time:93
    23:08:52.0 (9000226664)|USER_DEBUG|[22]|DEBUG|Method-2 Spent Time:6365

Output-2: (LOOP SIZE=100000)
    23:06:34.108 (6108971770)|USER_DEBUG|[11]|DEBUG|Method-1 Spent Time:5658
    23:06:52.529 (24529546889)|EXCEPTION_THROWN|[19]|System.LimitException: Apex CPU time limit exceeded
 */

@isTest
public with sharing class RelectionVsSchema {
  @isTest
  public static void test1() {
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index < 1000; index++) {
      String sObjectName = 'Account';
      SObject actObj = (SObject) (Type.forName('Schema.' + sObjectName).newInstance());
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void test2() {
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index < 1000; index++) {
      String sObjectName = 'Account';
      SObject sObj = Schema.getGlobalDescribe().get(sObjectName).newSObject();
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }
}
