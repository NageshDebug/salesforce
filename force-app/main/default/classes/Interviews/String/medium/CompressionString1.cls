@isTest
public with sharing class CompressionString1 {
  @isTest
  public static void testCompressionString1() {
    String input = 'wxxywzzzzzwwwwww';
    String output = '';

    Integer count = 1, i = 0, j = 1, k = input.length();
    while (j < k) {
      if (input.charAt(i) == input.charAt(j)) {
        i++;
        j++;
        count++;
      } else {
        String ch = input.substring(i, j);
        output = output + (ch + count);
        count = 1;
        i = j;
        j++;
      }
    }
    if (i < j) {
      String ch = input.substring(i, j);
      output = output + (ch + count);
    }
    System.debug('OUTPUT------------->' + output);
  }
}
