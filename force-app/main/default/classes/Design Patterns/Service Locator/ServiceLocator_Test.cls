@IsTest
private with sharing class ServiceLocator_Test {
  @IsTest
  private static void getInstance_ReturnsCorrectInstance() {
    Object o = (PaymentService) ServiceLocatorPattern.getInstance(PaypalPaymentService.class);
    System.assert(o instanceof PaymentService);
    System.assert(o instanceof PaypalPaymentService);
  }

  @IsTest
  private static void getInstance_Method2() {
    Object o = (PaymentService) ServiceLocatorPattern.getInstance_method2(StripePaymentService.class);
    System.assert(o instanceof PaymentService);
    System.assert(o instanceof StripePaymentService);
  }

  @IsTest
  private static void testSetMock() {
    ServiceLocatorPattern.setMock(StripePaymentService.class, BraintreePaymentService.class);
    PaymentService paymentService = (PaymentService)ServiceLocatorPattern.getInstance(StripePaymentService.class);
    String paymentDetails = paymentService.processPayment();
    System.assertEquals('BrainTree successfully processed your payment!', paymentDetails);
  }
}
