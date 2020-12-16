public with sharing class PaypalPaymentService implements PaymentService {
  private CalloutHandler calloutHandler;
  private PaymentRepository paymentRepository;
  public PaypalPaymentService(CalloutHandler calloutHandler, PaymentRepository paymentRepository) {
    this.calloutHandler = calloutHandler;
    this.paymentRepository = paymentRepository;
  }

  public Map<String, OpportunityResponse> createAgreement(List<OpportunityRequest> opportunities) {
    return null;
  }
  public Map<String, OpportunityResponse> updateAgreement(List<OpportunityRequest> opportunities) {
    return null;
  }
  public Map<String, OpportunityResponse> submitAgreement(List<OpportunityRequest> opportunities) {
    return null;
  }
  public Map<String, OpportunityResponse> deleteAgreement(List<OpportunityRequest> opportunities) {
    return null;
  }
  public Map<String, OpportunityResponse> getFundingMixData(List<OpportunityRequest> opportunities) {
    return null;
  }
  public Map<String, OpportunityResponse> createPriceCategory(List<OpportunityRequest> opportunities) {
    return null;
  }
  public Map<String, OpportunityResponse> searchPriceCategory(List<OpportunityRequest> opportunities) {
    return null;
  }
  public Map<String, OpportunityResponse> getPriceCategoryStatus(List<OpportunityRequest> opportunities) {
    return null;
  }
}