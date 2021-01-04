@isTest
private class RecordTypeHandler {
  /**
     The issue here is that the Record Type Name is nothing but a label, which can be easily changed by an administrator in 
     Production, thus breaking your code without any warning. The second issue with this approach is that the logic might 
     break in multi-language environments in case somebody translates the label. 
     
     However, as far as I know, this was the only approach to obtain a Record Type Id without issuing a SOQL query.
     This brings us to the second approach that uses the RecordType object. 
    
     You can execute a SOQL query against this object to get the Record Type Id by Developer Name, which is much more stable 
     than the label, it isn’t affected by translations, and cannot be changed that easily.
     */
  @isTest
  private static void getRecordTypeIdByName() {
    String recordTypeName = 'Custom Record Type';
    ID recordTypeId = Schema.SObjectType.Account_Client__c.getRecordTypeInfosByName().get(recordTypeName).getRecordTypeId();
    System.assertEquals('0124x0000009EHtAAM', recordTypeId);
  }

  @isTest
  private static void getRecordTypeIdByName1() {
    String recordTypeName = 'Custom Record Type';
    ID recordTypeId = Account_Client__c.sObjectType.getDescribe().getRecordTypeInfosByName().get(recordTypeName).getRecordTypeId();
    System.assertEquals('0124x0000009EHtAAM', recordTypeId);
  }

  @isTest
  private static void getRecordTypeIdByDeveloperName() {
    String recordTypeDeveloperName = 'Custom_Record_Type';
    Id recordTypeId = Schema.SObjectType.Account_Client__c.getRecordTypeInfosByDeveloperName().get(recordTypeDeveloperName).getRecordTypeId();
    System.assertEquals('0124x0000009EHtAAM', recordTypeId);
  }

  @isTest
  private static void getRecordTypeIdByDeveloperName1() {
    String recordTypeDeveloperName = 'Custom_Record_Type';
    Id recordTypeId = Account_Client__c.sObjectType.getDescribe().getRecordTypeInfosByDeveloperName().get(recordTypeDeveloperName).getRecordTypeId();
    System.assertEquals('0124x0000009EHtAAM', recordTypeId);
  }

  @isTest
  private static void getRecordTypeIdBySOQL() {
    String recordTypeDeveloperName = 'Custom_Record_Type';
    Id recordTypeId = [SELECT Id FROM RecordType WHERE DeveloperName = :recordTypeDeveloperName AND sObjectType = 'Account_Client__c'].Id;
    System.assertEquals('0124x0000009EHtAAM', recordTypeId);
  }

  @isTest
  private static void getDeveloperNameByRecordTypeId() {
    String recordTypeDeveloperName = 'Custom_Record_Type';
    String developerName = Schema.SObjectType.Account_Client__c.getRecordTypeInfosById().get('0124x0000009EHtAAM').getDeveloperName();
    System.assertEquals(recordTypeDeveloperName, developerName);
  }

  //No need to run SOQL query or using metadata API. You can directly create a new RecordType instance with RecordTypeLabel(Unique).
  //This techinque is very useful in test classes to setup the data
  @isTest
  private static void createRecordWithoutRecordTypeId() {
    Account_Client__c acctClient = new Account_Client__c(Name = 'Nagesh', RecordType = new RecordType(Name = 'Custom Record Type'));
    insert acctClient;
    System.assert(acctClient.Id != null);
  }

  @isTest
  private static void getDeveloperNameByObjectId() {
    Account_Client__c acctClient = new Account_Client__c(Name = 'Nagesh', RecordType = new RecordType(Name = 'Custom Record Type'));
    insert acctClient;

    System.assertEquals('0124x0000009EHtAAM', acctClient.RecordTypeId);
  }
}