@isTest
public with sharing class Avoid_If_Switch_StatementsTest {
  @isTest
  public static void test1() {
    Avoid_If_Switch_Statements obj = new Avoid_If_Switch_Statements();
    obj.IFElseStrategy('FACEBOOK', 'Nagesh');
    obj.IFElseStrategy('GOOGLEPLUS', 'Nagesh');
    obj.IFElseStrategy('ORKUT', 'Nagesh');
    obj.IFElseStrategy('TWITTER', 'Nagesh');
  }

  @isTest
  public static void test2() {
    Avoid_If_Switch_Statements obj = new Avoid_If_Switch_Statements();
    obj.switchStrategy('FACEBOOK', 'Nagesh');
    obj.switchStrategy('GOOGLEPLUS', 'Nagesh');
    obj.switchStrategy('ORKUT', 'Nagesh');
    obj.switchStrategy('TWITTER', 'Nagesh');
  }
}