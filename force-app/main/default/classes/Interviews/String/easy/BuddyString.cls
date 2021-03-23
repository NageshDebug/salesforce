@isTest
public with sharing class BuddyString {
  @isTest
  public static void test() {
    String A = 'aaaaaaabc';
    String B = 'aaaaaaacb';

    System.assert(buddyStrings(A, B));

    System.assert(buddyStrings('aa', 'aa'));

    System.assert(buddyStrings('ab', 'ba'));

    System.assert(!buddyStrings('a', 'a'));
  }

  public static boolean buddyStrings(String A, String B) {
    if (A.length() != B.length()) {
      return false;
    }

    if (A.equals(B)) {
      Set<String> st = new Set<String>();
      for (String c : A.split('')) {
        st.add(c);
      }
      return st.size() < A.length();
    }

    List<Integer> lst = new List<Integer>();
    for (Integer i = 0; i < A.length(); i++) {
      if (A.charAt(i) != B.charAt(i)) {
        lst.add(i);
      }
    }
    return lst.size() == 2 && A.charAt(lst.get(0)) == B.charAt(lst.get(1)) && B.charAt(lst.get(0)) == A.charAt(lst.get(1));
  }
}
