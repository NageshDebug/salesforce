public with sharing class PaypalPaymentService implements PaymentService {
  private CalloutHandler calloutHandler;
  private PaymentRepository paymentRepository;
  public PaypalPaymentService(CalloutHandler calloutHandler, PaymentRepository paymentRepository) {
    this.calloutHandler = calloutHandler;
    this.paymentRepository = paymentRepository;
  }

  public Map<Boolean, String> createAgreement(List<Opportunity> opportunities) {
    return null;
  }
  public Map<Boolean, String> updateAgreement(List<Opportunity> opportunities) {
    return null;
  }
  public Map<Boolean, String> submitAgreement(List<Opportunity> opportunities) {
    return null;
  }
  public Map<Boolean, String> deleteAgreement(List<Opportunity> opportunities) {
    return null;
  }
  public Map<Boolean, String> getFundingMixData(List<Opportunity> opportunities) {
    return null;
  }
  public Map<Boolean, String> createPriceCategory(List<Opportunity> opportunities) {
    return null;
  }
  public Map<Boolean, String> searchPriceCategory(List<Opportunity> opportunities) {
    return null;
  }
  public Map<Boolean, String> getPriceCategoryStatus(List<Opportunity> opportunities) {
    return null;
  }
}
