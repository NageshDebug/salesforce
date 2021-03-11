/**
 19:16:38:144 USER_DEBUG [35]|DEBUG|Method-1 Spent Time:11
 19:16:46:485 USER_DEBUG [46]|DEBUG|Method-2 Spent Time:6109
 19:16:46:604 USER_DEBUG [57]|DEBUG|Method-3 Spent Time:76
 19:16:46:705 USER_DEBUG [68]|DEBUG|Method-4 Spent Time:53
 */

@isTest
public class RelectionVsSchema {
  public static Map<String, SObjectType> gd = Schema.getGlobalDescribe();
  public static Schema.SObjectType method0(String objectName) {
    return gd.get(objectName);
  }

  public static Schema.SObjectType method1(String objectName) {
    return Schema.getGlobalDescribe().get(objectName);
  }

  public static Schema.SObjectType method2(String objectName) {
    return ((SObject) Type.forName(objectName).newInstance()).getSObjectType();
  }

  public static Schema.SObjectType method3(String objectName) {
    return Schema.describeSObjects(new List<String>{ objectName })[0].getSObjectType();
  }

  //best approach
  @isTest
  public static void testMethod0() {
    String objectType = 'Account';
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index < 1000; index++) {
      System.debug(method0(objectType));
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void testMethod1() {
    String objectType = 'Account';
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index < 1000; index++) {
      System.debug(method1(objectType));
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void testMethod2() {
    String objectType = 'Account';
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index < 1000; index++) {
      System.debug(method2(objectType));
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-3 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void testMethod3() {
    String objectType = 'Account';
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index < 1000; index++) {
      System.debug(method3(objectType));
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-4 Spent Time:' + (endTime - startTime));
  }
}
