/**
 17:45:03:048 USER_DEBUG [14]|DEBUG|Map: 1044
 17:45:04:132 USER_DEBUG [24]|DEBUG|List:1084
 17:45:05:262 USER_DEBUG [34]|DEBUG|Set: 1130
 */
@isTest
public with sharing class ContainsTest {
  @isTest
  public static void test() {
    Double dbl = Math.random();
    long t = System.currentTimeMillis();
    Map<String, Boolean> mp = new Map<String, Boolean>();
    for (Integer i = 0; i < 100000; i++) {
      String s = (dbl * 100) + '';
      if (!mp.containsKey(s)) {
        mp.put(s, true);
      }
    }
    System.debug('Map: ' + (System.currentTimeMillis() - t));

    t = System.currentTimeMillis();
    List<String> lst = new List<String>();
    for (Integer i = 0; i < 100000; i++) {
      String s = (dbl * 100) + '';
      if (!lst.contains(s)) {
        lst.add(s);
      }
    }
    System.debug('List:' + (System.currentTimeMillis() - t));

    t = System.currentTimeMillis();
    Set<String> st = new Set<String>();
    for (Integer i = 0; i < 100000; i++) {
      String s = (dbl * 100) + '';
      if (!st.contains(s)) {
        st.add(s);
      }
    }
    System.debug('Set: ' + (System.currentTimeMillis() - t));
  }
}