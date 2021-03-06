public class RequestResponseHandler {
    
    private static RequestResponseHandler handler;
    
    private RequestResponseHandler(){}
    
    public static RequestResponseHandler getInstance(){
        if(handler == null){
            return new RequestResponseHandler();
        }
        else{
            return handler;
        }
    }
    
    public RelatedListRequestWrapper createRequest(String recordId, String metaDatakey,
                                                   String relationshipFieldApiName, String dynamicCondition, 
                                                   String sortField, String sortDirection){
        RelatedListRequestWrapper reqWrapper = 
            new RelatedListRequestWrapper(recordId, metaDatakey,
                                         relationshipFieldApiName, dynamicCondition, 
                                         sortField, sortDirection);
        System.debug('$$ reqWrapper: '+reqWrapper);                                               
        return reqWrapper;                                               
    }
    
    public RelatedListResultWrapper createResponse(List<Object> allRecords, reusable_List_MetaData__mdt metaDataRec){
         
        List<Object> TopSelectedRecords = new List<Object>();
        Integer topRecords = (Integer) metaDataRec.Top_records_to_be_shown__c;
        Integer index = 0;
        
        for(Object obj : allRecords){
            if(index<topRecords){
                TopSelectedRecords.add(obj);
            }
            index++;
        } 
        
        RelatedListResultWrapper resultWrapper = 
            new RelatedListResultWrapper(allRecords, TopSelectedRecords, metaDataRec.Column_JSON__c, 
                                         metaDataRec.Column_Buttons_JSON__c, 
                                         metaDataRec.Column_Header_Buttons_JSON__c, 
                                         metaDataRec.Component_Title__c, metaDataRec.Header_Buttons_JSON__c, metaDataRec.Header_Icon__c);
        return resultWrapper;
    }

}