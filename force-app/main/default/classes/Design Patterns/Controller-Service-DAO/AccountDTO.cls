/**
    Purposes
    ----------
    carry forward the data form controller to UI.
        -> if i remove/modify the custom field, it shouldn't break the UI. otherwise we need to rebuild the UI.
        -> if the component is reused in multiple places, it should be loose coupling. So, it is not good to expose fields to UI.

    Advantages
    1. mimimze the fields at database level.
       No need to create UI hidden fields, indicators or flags related fields in the database 

       I.e Typically wrapper classes are used to temporarily associate prpoerties with an sObject that are specific to the 
       current scenario, and that do not make sense to add as fields to the sObject and persist to the database.

    2. No need to create seperate formula fields as per the UI recamendation.
       Ex: Display the amount in UI in different currencies.

    3. Reduce multiple server side calls (Query the data from multiple objects at once and then we can wrap it before sending to UI)
       In Salesforce Lightning component whenever we want multiple filtered data from a separate object or from the same object in a 
       single list we use wrapper class.

    For example,
    If I want records of Account object with all records, some filtered Accounts and Records from Contact Object, Then I have to make 
    multiple server calls to fetch this data like :

    1. One server call for fetching Account object records.
    2. Second server call for fetching Account Filtered records.
    3. Third server call for fetching Contact object records.

    Instead, If I get these records from the server-side controller (Apex Class) in a single server call in a single list then I can use this list and 
    these individual list 1,2,3 wherever needed Sounds Great !! right ?? 

    4. It will plays an important to calculate aggregations like sum or total, average, min and max etc for child records.

    5. It handles complex serialize issues. Complex Collections are not supported yet in Lighting components.
       we can serialize the data before sending to UI.
    */
public class AccountDTO {
  @AuraEnabled
  public Object error;

  @AuraEnabled
  public Object success;

  @AuraEnabled
  public List<AccountRequest> request;

  public class AccountRequest {
    @AuraEnabled
    public ID accountId;

    @AuraEnabled
    public String accountName;

    @AuraEnabled
    public String Industry;
  }

  public class AccountResponse {
    @AuraEnabled
    public ID accountId;

    @AuraEnabled
    public String accountName;

    @AuraEnabled
    public String Industry;
  }
}
