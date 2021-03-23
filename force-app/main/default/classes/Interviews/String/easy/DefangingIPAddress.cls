@isTest
public with sharing class DefangingIPAddress {
  @isTest
  public static void test() {
    String address = '1.1.1.1';
    //Output: "1[.]1[.]1[.]1"

    address = address.replace('.', '[.]');
    system.debug(address);
  }
}
