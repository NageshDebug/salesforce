@isTest
public with sharing class ValidWordAbbreviation {
  @isTest
  public static void testValidWordAbbreviation() {
    String word = 'word';
    String abbr = 'wo1d';

    Integer wordLength = word.length();
    Integer abbrLength = 0;
    for (String st : abbr.split('')) {
      abbrLength += st.isNumeric() ? Integer.valueOf(st) : 1;
    }

    Boolean isValidAbbreviation = (wordLength == abbrLength);
    system.debug('====================>' + isValidAbbreviation);
  }
}
