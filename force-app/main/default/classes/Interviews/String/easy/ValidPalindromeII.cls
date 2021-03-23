public with sharing class ValidPalindromeII {
  public static void testValidPalindromeII() {
    System.debug('------------->' + isValidPalindromeII());
    String st = 'abca';
    /*String[] stArray = st.split('');
    Boolean isPalindrome = st.reverse().equals(st);
     if (!isPalindrome) {
       for (Integer i = 0; i < st.length(); i++) {
         String newStr = st.replaceFirst(stArray[i], '');
         if (newStr.reverse().equals(newStr)) {
           isPalindrome = true;
          break;
         }
       }
     }
     system.debug('-------------->' + isPalindrome);*/
  }

  public static Boolean isValidPalindromeII() {
    String s = 'abca';
    Integer l = 0, r = s.length() - 1;
    while (l < r) {
      if (s.charAt(l) != s.charAt(r)) {
        return isValid(s, l + 1, r) || isValid(s, l, r - 1);
      }
      l++;
      r--;
    }
    return true;
  }

  public static Boolean isValid(String s, Integer left, Integer right) {
    while (left < right) {
      if (s.charAt(left) != s.charAt(right))
        return false;
      left++;
      right--;
    }
    return true;
  }
}
