/*******************************************************************************************
* @Name         IteratorExampleBatch 
* @Author       FirstName LastName <author@email.com>
* @Date         01/13/2020
* @Group        Apex Batches
* @Description  This batch class demonstrates use of iterator in apex batch class.
*******************************************************************************************/
/* MODIFICATION LOG
* Version          Developer          Date               Description
*-------------------------------------------------------------------------------------------
*  1.0              Firstname      01/13/2020          Initial Creation                                                      
*******************************************************************************************/
global class IteratorExampleBatch implements Database.Batchable<String>, Database.AllowsCallouts {
    //Make sure you add below endpoint to remote site settings
    private final String API_BASE = 'https://th-apex-http-callout.herokuapp.com/';
    /**************************************************************************************
    * @Description  This method gets all animals, get corresponding animal IDs and sends to 
    *               execute for processing
    * @Param		bc - BatchableContext
    * @Return        Iterable<String> - List of animals whose details need to be retrieved
    **************************************************************************************/ 
    global Iterable<String> start(Database.BatchableContext bc) {
        List<String> animalIdList = new List<String>();
        //Move the API call code to a separate class for reusability
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(API_BASE+'animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            Map<String, Object> resultMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            for (Object animal: (List<Object>) resultMap.get('animals')) {
                animalIdList.add((String)animal);
            }
        }
        return animalIdList;
    }

    /**************************************************************************************
    * @Description  This method gets details of individual animal by hitting API
    * @Param		bc - BatchableContext
    * @Param		accountanimalIdListList - Chunk of animal Ids that needs to be processed
    * @Return       NA
    **************************************************************************************/ 
    global void execute(Database.BatchableContext bc, List<String> animalIdList){
        //Do some heavy processing here. In this case get more details about each animal :) 
        //Move the API call code to a separate class for reusability
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        for(String animalId: animalIdList) {
            System.debug('Getting details about'+animalId);
            request.setEndpoint(API_BASE+'animals/'+animalId);
            HttpResponse response = http.send(request);
            if (response.getStatusCode() == 200) {
                Map<String, Object> resultMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                System.debug('Got details about animal ' + response.getBody());
                //Bulkify the results and store in records
            }else {
                system.debug('Unable to get about animal => '+response.getStatusCode()+response.getBody());
            }
        }
    }  

    /**************************************************************************************
    * @Description  This method executes any post-processing operations
    * @Param		bc - BatchableContext
    * @Return       NA
    **************************************************************************************/
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }    
}