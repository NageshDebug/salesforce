public with sharing class LongPressedName {
  public static void test() {
    String name = 'alex';
    String typed = 'aaleex';

    System.debug('------------------->' + isLongPressedName(name, typed));
  }
  public static boolean isLongPressedName(String name, String typed) {
    if (typed.length() < name.length())
      return false;
    if (name.charAt(0) != typed.charAt(0) || name.charAt(name.length() - 1) != typed.charAt(typed.length() - 1)) {
      return false;
    }

    integer i = 1;
    integer j = 1;
    while (i < name.length() && j < typed.length()) {
      if (name.charAt(i) == typed.charAt(j)) {
        i++;
        j++;
      } else if (typed.charAt(j) == name.charAt(i - 1)) {
        j++;
      } else {
        return false;
      }
    }

    if (i >= name.length() && j >= typed.length())
      return true;
    while (j < typed.length()) {
      if (name.charAt(name.length() - 1) != typed.charAt(j++)) {
        return false;
      }
    }
    if (i < name.length() && j >= typed.length())
      return false;
    return true;
  }
}
