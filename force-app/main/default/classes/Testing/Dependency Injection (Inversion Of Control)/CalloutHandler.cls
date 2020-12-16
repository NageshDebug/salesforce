public interface CalloutHandler {
  Map<Boolean, String> createAgreement(String requestBody);
  Map<Boolean, String> updateAgreement(String requestBody, Object queryParameter);
  Map<Boolean, String> submitAgreement(Object queryParameter);
  Map<Boolean, String> deleteAgreement(Object queryParameter);
  Map<Boolean, String> getFundingMixData(String requestBody);
  Map<Boolean, String> createPriceCategory(String requestBody);
  Map<Boolean, String> searchPriceCategory(String requestBody);
  Map<Boolean, String> getPriceCategoryStatus(Object queryParam);
}