@isTest
public with sharing class FactoryTest {
  @isTest
  private static void getInstance1() {
    Object str = (String) Factory.getInstance(String.class).getInstance();
    System.assert(str instanceof String);
  }

  @isTest
  private static void getInstance2() {
    Object lst = (List<String>) Factory.getInstance(List<String>.class).getInstance();
    System.assert(lst instanceof List<String>);
  }

  @isTest
  private static void getInstance3() {
    Object paymentService = (PaymentService) Factory.getInstance(PaypalPaymentService.class).getInstance();
    System.assert(paymentService instanceof PaymentService);
    System.assert(paymentService instanceof PaypalPaymentService);

    paymentService = (PaymentService) Factory.getInstance(StripePaymentService.class).getInstance();
    System.assert(paymentService instanceof PaymentService);
    System.assert(paymentService instanceof StripePaymentService);

    paymentService = (PaymentService) Factory.getInstance(BraintreePaymentService.class).getInstance();
    System.assert(paymentService instanceof PaymentService);
    System.assert(paymentService instanceof BraintreePaymentService);
  }
}