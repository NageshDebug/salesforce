@isTest
public with sharing class LastWordLength {
  @isTest
  public static void testLastWordLength() {
    String st = 'Hello World';
    String lastWord = st.substring(st.lastIndexOf(' ') + 1, st.length());
    System.debug('---------------->' + lastWord.length());

    System.debug('---------------->' + st.substringAfterLast(' ').length());
  }
}
