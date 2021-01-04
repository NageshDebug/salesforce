@isTest
public with sharing class TemplatePatternTest {
  @isTest
  public static void test() {
    OrderProcessTemplate netOrder = new NetOrder();
    netOrder.processOrder(true);
    
    
    OrderProcessTemplate storeOrder = new StoreOrder();
    storeOrder.processOrder(true);
  }
}