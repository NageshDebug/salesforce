@isTest
public with sharing class SingleRowKeyBoard {
  @isTest
  public static void testSingleRowKeyBoard() {
    String keyboard = 'abcdefghijklmnopqrstuvwxyz', word = 'cba';
    Map<String, Integer> mp = new Map<String, Integer>();
    Integer pos = 0;
    for (String c : keyboard.split('')) {
      mp.put(c, pos++);
    }
    Integer total = 0;
    Integer currPos = 0;
    for (String c : word.split('')) {
      total += Math.abs(currPos - mp.get(c));
      currPos = mp.get(c);
    }
    System.debug('OUTPUT----------->' + total);
  }
}
