@isTest
public with sharing class StringConcatinationTest {
  @isTest
  public static void test1() {
    String result;
    List<String> tokens = new List<String>{ 'Hello', 'World' };
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index < 10000; index++) {
      result += String.join(tokens, ' ');
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void test2() {
    String result;
    List<String> tokens = new List<String>{ 'Hello', 'World' };
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index < 10000; index++) {
      result += String.format('{0} {1}', tokens);
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void test3() {
    String result;
    List<String> tokens = new List<String>{ 'Hello', 'World' };
    Integer startTime = Limits.getCpuTime();
    for (Integer index = 0; index < 10000; index++) {
      result += tokens[0] +' '+ tokens[1];
    }
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-3 Spent Time:' + (endTime - startTime));
  }
}