public class AccountCalloutServiceImpl extends AccountCalloutServiceHandler implements AccountCalloutService {
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
}