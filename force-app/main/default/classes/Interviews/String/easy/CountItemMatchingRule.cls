@isTest
public with sharing class CountItemMatchingRule {
  @isTest
  public static void testCountItemMatchingRule() {
   /* List<String> item1 = new List<String>{ 'phone', 'blue', 'pixel' };
    List<String> item2 = new List<String>{ 'computer', 'silver', 'lenovo' };
    List<String> item3 = new List<String>{ 'phone', 'gold', 'iphone' };
    List<List<String>> items = new List<List<String>>{ item1, item2, item3 };
    String ruleKey = 'color', ruleValue = 'silver';*/

    List<String> item1 = new List<String>{ 'phone', 'blue', 'pixel' };
    List<String> item2 = new List<String>{ 'computer', 'silver', 'phone' };
    List<String> item3 = new List<String>{ 'phone', 'gold', 'iphone' };
    List<List<String>> items = new List<List<String>>{ item1, item2, item3 };
    String ruleKey = 'type', ruleValue = 'phone';

    List<String> keys = new List<String>{ 'type', 'color', 'name' };
    Integer matches = 0;
    for (List<String> item : items) {
      Integer ruleIndex = keys.indexOf(ruleKey);
      if (item.get(ruleIndex).equals(ruleValue)) {
        matches++;
      }
    }
    System.debug('Output======>'+matches);
  }
}
