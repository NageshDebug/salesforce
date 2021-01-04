public with sharing class Problem4 {
  private static Problem4 self;
  private Schema.DescribeSObjectResult sObjectResult;
  private Problem4() {
    SObjectType accountType = Schema.getGlobalDescribe().get('Account_Client__c');
    sObjectResult = accountType.getDescribe();

    //Do the inspection operation
  }

  public static Problem4 getInstance() {
    if (self == null) {
      self = new Problem4();
    }
    return self;
  }

  public ID getRecordTypeId(String recordTypeName){
    return sObjectResult.getRecordTypeInfosByName().get(recordTypeName).getRecordTypeId();
  }
}