public interface PaymentService {
  Map<Boolean, String> createAgreement(List<Opportunity> opportunities);
  Map<Boolean, String> updateAgreement(List<Opportunity> opportunities);
  Map<Boolean, String> submitAgreement(List<Opportunity> opportunities);
  Map<Boolean, String> deleteAgreement(List<Opportunity> opportunities);
  Map<Boolean, String> getFundingMixData(List<Opportunity> opportunities);
  Map<Boolean, String> createPriceCategory(List<Opportunity> opportunities);
  Map<Boolean, String> searchPriceCategory(List<Opportunity> opportunities);
  Map<Boolean, String> getPriceCategoryStatus(List<Opportunity> opportunities);
}
