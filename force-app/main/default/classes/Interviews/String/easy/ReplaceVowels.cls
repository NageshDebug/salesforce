@isTest
public with sharing class ReplaceVowels {
  @isTest
  public static void replaceVowels() {
    String input = 'Nagesh is Testing Salesforce Coding ProblEm';

    for (String str : 'aeiouAEIOU'.split('')) {
      input = input.replaceAll(str, '');
    }

    System.debug(input);
  }
}
