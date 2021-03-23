@isTest
public with sharing class LongestCommonPrefix {
  @isTest
  public static void testLongestCommonPrefix() {
    List<String> strs = new List<String>{ 'flower', 'flow', 'flight' };
    String first = strs[0], last = strs[0];

    for (String str : strs) {
      if (str.compareTo(first) < 0) {
        first = str;
      }
      if (str.compareTo(last) > 0) {
        last = str;
      }
      System.debug('----->'+str+'---'+first+'----'+last);
    }
    Integer i = 0, len = Math.min(first.length(), last.length());

    while ((i < len) && (first.charAt(i) == last.charAt(i))) {
      i++;
    }
    System.debug('====>' + first.substring(0, i));
  }
}
