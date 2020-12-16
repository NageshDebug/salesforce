public interface PaymentService {
  Map<String, OpportunityResponse> createAgreement(List<OpportunityRequest> opportunities);
  Map<String, OpportunityResponse> updateAgreement(List<OpportunityRequest> opportunities);
  Map<String, OpportunityResponse> submitAgreement(List<OpportunityRequest> opportunities);
  Map<String, OpportunityResponse> deleteAgreement(List<OpportunityRequest> opportunities);
  Map<String, OpportunityResponse> getFundingMixData(List<OpportunityRequest> opportunities);
  Map<String, OpportunityResponse> createPriceCategory(List<OpportunityRequest> opportunities);
  Map<String, OpportunityResponse> searchPriceCategory(List<OpportunityRequest> opportunities);
  Map<String, OpportunityResponse> getPriceCategoryStatus(List<OpportunityRequest> opportunities);
}