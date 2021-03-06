public abstract class CalloutHandlerUtil implements CalloutHandler{
    public String oauthToken;
    public Map<Boolean, String> apiResponse;
    private static Boolean isRunningInSandbox;
    
    @testVisible
    private static List<Pricing_Endpoints__mdt> endpointMetadata;
    
    public enum CalloutType {
        	OAUTH,
            CREATE_VENDAVO_AGREEMENT,
            UPDATE_VENDAVO_AGREEMENT,
            SUBMIT_VENDAVO_AGREEMENT,
            DELETE_VENDAVO_AGREEMENT,
            GET_FUNDINGMIX_DATA,
            CREATE_PRICE_CATEGORY,
            SEARCH_PRICE_CATEGORY,
            GET_PRICE_CATEGORY_STATUS
            }
    
    public Pricing_Endpoints__mdt getOAuthToken(CalloutHandlerUtil.CalloutType calloutType) {
        Pricing_Endpoints__mdt endpointMetadata;
        try {
            Map<String, Pricing_Endpoints__mdt> endpointMetadataMap = new Map<String, Pricing_Endpoints__mdt>();
            for (Pricing_Endpoints__mdt mdt : queryMetadata(calloutType)) {
                endpointMetadataMap.put(mdt.Label, mdt);
            }
            
            Pricing_Endpoints__mdt oAuthMetadata = endpointMetadataMap.get(CalloutHandlerUtil.CalloutType.OAUTH.name());
            endpointMetadata = endpointMetadataMap.get(calloutType.name());
            
            if(oAuthMetadata==null || endpointMetadata==null){
                throw new CalloutException('Endpoint configurations not exist in the metadata or wrongly configured. Please check OAUTH and '+calloutType.name()+' configurations.');
            }
            
            HttpRequest request = buildHttpRequest(oAuthMetadata);
            HttpResponse response = new Http().send(request);
            
            Boolean isSuccess = parseApiResponse(response.getStatusCode() == oAuthMetadata.Status_Code__c, response.getStatusCode(), response.getStatus(), response.getBody(), response.getHeader(oAuthMetadata.Debug_ID__c));
            if (isSuccess) {
                Map<String, String> accessToken = (Map<String, String>) JSON.deserialize(response.getBody(), Map<String, String>.class);
                oauthToken = accessToken.get(oAuthMetadata.Access_Token__c);
            }
        } catch (Exception exp) {
            parseException(exp);
        }
        return endpointMetadata;
    }
    
    public HttpRequest buildHttpRequest(Pricing_Endpoints__mdt metadata) {
        HttpRequest request = new HttpRequest();
        request.setMethod(metadata.HTTP_Method__c);
        request.setEndpoint(metadata.Endpoint__c);
        request.setTimeout(Integer.valueOf(metadata.Timeout__c));
        if (String.isNotBlank(metadata.Payload__c)) {
            request.setBody(metadata.Payload__c);
        }
        
        List<String> headers = metadata.Headers__c.split('\n');
        for (String header : headers) {
            List<String> keyValue = header.split('=');
            request.setHeader(keyValue[0], keyValue[1]);
        }
        return request;
    }
    
    public void sendRequestAndParseApiResponse(HttpRequest request, Pricing_Endpoints__mdt metadata) {
        System.debug('Request--------------------------->'+request);
        HttpResponse response = new Http().send(request);
        System.debug('Response--------------------------->'+response);
        parseApiResponse(response.getStatusCode() == metadata.Status_Code__c, response.getStatusCode(), response.getStatus(), response.getBody(), response.getHeader(metadata.Debug_ID__c));
    }
    
    public void parseException(Exception exp) {
        CalloutHandlerUtil.ExceptionDetails errorResponse = new CalloutHandlerUtil.ExceptionDetails(exp.getLineNumber(), exp.getCause(), exp.getStackTraceString(), exp.getMessage());
        apiResponse = new Map<Boolean, String>{ false => JSON.serialize(errorResponse) };
    }
    
    public Boolean parseApiResponse(Boolean isSuccess, Integer statusCode, String status, String response, String debugId) {
        CalloutHandlerUtil.ApiResponse resp = new CalloutHandlerUtil.ApiResponse(isSuccess, statusCode, status, response, debugId);
        apiResponse = new Map<Boolean, String>{ isSuccess => JSON.serialize(resp) };
        return isSuccess;
    }
    
    private static Boolean isRunningInSandbox() {
        return (isRunningInSandbox == null) ? [SELECT IsSandbox FROM Organization LIMIT 1].IsSandbox : isRunningInSandbox;
    }
    
    private static List<Pricing_Endpoints__mdt> queryMetadata(CalloutHandlerUtil.CalloutType calloutType) {
        Set<String> callouTypes = new Set<String>{'OAUTH',calloutType.name()};
        String environment = isRunningInSandbox() ? 'Sandbox' : 'Production';
        return (endpointMetadata == null || endpointMetadata.isEmpty()) ? [SELECT Label, Access_Token__c, Authorization__c, Debug_ID__c, Endpoint__c, Environment__c, Headers__c, HTTP_Method__c, Payload__c, Status_Code__c, Timeout__c, Token_Type__c, User_Context__c FROM Pricing_Endpoints__mdt WHERE Environment__c = :environment AND Label IN :callouTypes] : endpointMetadata;
    }
    
    public class ApiResponse {
        public Boolean isSuccess;
        public Integer statusCode;
        public String status;
        public String response;
        public String debugId;
        
        public ApiResponse(Boolean isSuccess, Integer statusCode, String status, String response, String debugId) {
            this.isSuccess = isSuccess;
            this.statusCode = statusCode;
            this.status = status;
            this.response = response;
            this.debugId = debugId;
        }
    }
    
    public class ExceptionDetails {
        public Integer lineNumber;
        public Exception cause;
        public String message;
        public String stackTrace;
        
        public ExceptionDetails(Integer lineNumber, Exception cause, String message, String stackTrace) {
            this.lineNumber = lineNumber;
            this.cause = cause;
            this.stackTrace = stackTrace;
            this.message = message;
        }
    }
}