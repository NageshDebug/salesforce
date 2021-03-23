@isTest
public with sharing class CountSubstringsWithOnlyOneDistinctLetter {
  @isTest
  public CountSubstringsWithOnlyOneDistinctLetter() {
    String S = 'aaaba';
    Integer count = 1;
    Integer res = 1;
    for (Integer i = 1; i < S.length(); i++) {
      if (S.charAt(i) != S.charAt(i - 1)) {
        count = 1;
      } else {
        count++;
      }
      res += count;
    }
    system.debug('Output----------->' + res);
  }
}
