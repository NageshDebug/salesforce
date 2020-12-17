public class CalloutHandlerImpl extends CalloutHandlerUtil {
    
    public Map<Boolean, String> createAgreement(String requestBody) {
        try {
            Pricing_Endpoints__mdt metadata=getOAuthToken(CalloutHandlerUtil.CalloutType.CREATE_VENDAVO_AGREEMENT);
            if (String.isNotBlank(oauthToken)) {
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
            Pricing_Endpoints__mdt metadata=getOAuthToken(CalloutHandlerUtil.CalloutType.UPDATE_VENDAVO_AGREEMENT);
            if (String.isNotBlank(oauthToken)) {                
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
            Pricing_Endpoints__mdt metadata=getOAuthToken(CalloutHandlerUtil.CalloutType.SUBMIT_VENDAVO_AGREEMENT);
            if (String.isNotBlank(oauthToken)) {
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
            Pricing_Endpoints__mdt metadata=getOAuthToken(CalloutHandlerUtil.CalloutType.DELETE_VENDAVO_AGREEMENT);
            if (String.isNotBlank(oauthToken)) {
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
            Pricing_Endpoints__mdt metadata=getOAuthToken(CalloutHandlerUtil.CalloutType.GET_FUNDINGMIX_DATA);
            if (String.isNotBlank(oauthToken)) {
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
            Pricing_Endpoints__mdt metadata=getOAuthToken(CalloutHandlerUtil.CalloutType.CREATE_PRICE_CATEGORY);
            if (String.isNotBlank(oauthToken)) {
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
            Pricing_Endpoints__mdt metadata=getOAuthToken(CalloutHandlerUtil.CalloutType.SEARCH_PRICE_CATEGORY);
            if (String.isNotBlank(oauthToken)) {
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
            Pricing_Endpoints__mdt metadata=getOAuthToken(CalloutHandlerUtil.CalloutType.GET_PRICE_CATEGORY_STATUS);
            if (String.isNotBlank(oauthToken)) {
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