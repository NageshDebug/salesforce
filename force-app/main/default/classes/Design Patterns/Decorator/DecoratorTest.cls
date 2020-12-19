@isTest
public with sharing class DecoratorTest {
  @isTest
  public static void dataSetup() {
    List<Opportunity> oppList = new List<Opportunity>();
    for (Integer index = 0; index < 5; index++) {
      oppList.add(new Opportunity(Name = 'Nagesh' + index, StageName='Prospecting', CloseDate=Date.today(),Amount = Integer.valueof((Math.random() * 100))));
    }
    insert oppList;
  }

  @isTest
  public static void displayAmountInMultipleCurrencies(){
    System.assertEquals(5, new Decorator().allConvertedExpenses.size());
  }
}
