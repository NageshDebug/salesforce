public class CalloutHandler extends CalloutHandlerUtil {
  public Map<Boolean, String> createAgreement(String requestBody) {
    try {
      if (String.isNotBlank(oauthToken)) {
        Pricing_Endpoints__mdt metadata = getEndpointInfo(CalloutHandlerUtil.CalloutType.CREATE_VENDAVO_AGREEMENT);

        HttpRequest request = buildHttpRequest(metadata);
        request.setHeader(metadata.Authorization__c, metadata.Token_Type__c + oauthToken);
        request.setBody(requestBody);

        sendRequestAndParseApiResponse(request, metadata);
      }
    } catch (Exception exp) {
      parseException(exp);
    }
    return apiResponse;
  }

  public Map<Boolean, String> updateAgreement(String requestBody, Object queryParameter) {
    try {
      if (String.isNotBlank(oauthToken)) {
        Pricing_Endpoints__mdt metadata = getEndpointInfo(CalloutHandlerUtil.CalloutType.UPDATE_VENDAVO_AGREEMENT);

        HttpRequest request = buildHttpRequest(metadata);
        request.setHeader(metadata.Authorization__c, metadata.Token_Type__c + oauthToken);
        request.setEndpoint(metadata.Endpoint__c.replace('{id}', (String) queryParameter));
        request.setBody(requestBody);

        sendRequestAndParseApiResponse(request, metadata);
      }
    } catch (Exception exp) {
      parseException(exp);
    }
    return apiResponse;
  }

  public Map<Boolean, String> submitAgreement(Object queryParameter) {
    try {
      if (String.isNotBlank(oauthToken)) {
        Pricing_Endpoints__mdt metadata = getEndpointInfo(CalloutHandlerUtil.CalloutType.SUBMIT_VENDAVO_AGREEMENT);

        HttpRequest request = buildHttpRequest(metadata);
        request.setHeader(metadata.Authorization__c, metadata.Token_Type__c + oauthToken);
        request.setEndpoint(metadata.Endpoint__c.replace('{id}', (String) queryParameter));

        sendRequestAndParseApiResponse(request, metadata);
      }
    } catch (Exception exp) {
      parseException(exp);
    }
    return apiResponse;
  }

  public Map<Boolean, String> deleteAgreement(Object queryParameter) {
    try {
      if (String.isNotBlank(oauthToken)) {
        Pricing_Endpoints__mdt metadata = getEndpointInfo(CalloutHandlerUtil.CalloutType.DELETE_VENDAVO_AGREEMENT);

        HttpRequest request = buildHttpRequest(metadata);
        request.setHeader(metadata.Authorization__c, metadata.Token_Type__c + oauthToken);
        request.setEndpoint(metadata.Endpoint__c.replace('{id}', (String) queryParameter));

        sendRequestAndParseApiResponse(request, metadata);
      }
    } catch (Exception exp) {
      parseException(exp);
    }
    return apiResponse;
  }

  public Map<Boolean, String> getFundingMixData(String requestBody) {
    try {
      if (String.isNotBlank(oauthToken)) {
        Pricing_Endpoints__mdt metadata = getEndpointInfo(CalloutHandlerUtil.CalloutType.GET_FUNDINGMIX_DATA);

        HttpRequest request = buildHttpRequest(metadata);
        request.setHeader(metadata.Authorization__c, metadata.Token_Type__c + oauthToken);
        request.setEndpoint(metadata.Endpoint__c);
        request.setBody(requestBody);

        sendRequestAndParseApiResponse(request, metadata);
      }
    } catch (Exception exp) {
      parseException(exp);
    }
    return apiResponse;
  }

  public Map<Boolean, String> createPriceCategory(String requestBody) {
    try {
      if (String.isNotBlank(oauthToken)) {
        Pricing_Endpoints__mdt metadata = getEndpointInfo(CalloutHandlerUtil.CalloutType.CREATE_PRICE_CATEGORY);

        HttpRequest request = buildHttpRequest(metadata);
        request.setHeader(metadata.Authorization__c, metadata.Token_Type__c + oauthToken);
        request.setHeader(metadata.User_Context__c, UserInfo.getUserEmail());
        request.setBody(requestBody);

        sendRequestAndParseApiResponse(request, metadata);
      }
    } catch (Exception exp) {
      parseException(exp);
    }
    return apiResponse;
  }

  public Map<Boolean, String> searchPriceCategory(String requestBody) {
    try {
      if (String.isNotBlank(oauthToken)) {
        Pricing_Endpoints__mdt metadata = getEndpointInfo(CalloutHandlerUtil.CalloutType.SEARCH_PRICE_CATEGORY);

        HttpRequest request = buildHttpRequest(metadata);
        request.setHeader(metadata.Authorization__c, metadata.Token_Type__c + oauthToken);
        request.setBody(requestBody);

        sendRequestAndParseApiResponse(request, metadata);
      }
    } catch (Exception exp) {
      parseException(exp);
    }
    return apiResponse;
  }

  public Map<Boolean, String> getPriceCategoryStatus(Object queryParam) {
    try {
      if (String.isNotBlank(oauthToken)) {
        Pricing_Endpoints__mdt metadata = getEndpointInfo(CalloutHandlerUtil.CalloutType.GET_PRICE_CATEGORY_STATUS);

        HttpRequest request = buildHttpRequest(metadata);
        request.setHeader(metadata.Authorization__c, metadata.Token_Type__c + oauthToken);
        request.setEndpoint(metadata.Endpoint__c.replace('{id}', (String) queryParam));

        sendRequestAndParseApiResponse(request, metadata);
      }
    } catch (Exception exp) {
      parseException(exp);
    }
    return apiResponse;
  }
}
