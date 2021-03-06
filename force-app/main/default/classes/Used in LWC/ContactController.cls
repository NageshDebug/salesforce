public with sharing class ContactController {
  @AuraEnabled
  public static Contact getContactDetails(Id recordId) {
    return [SELECT Id, Name FROM Contact WHERE Id = :recordId];
  }

  @AuraEnabled
  public static string getTextMethod1() {
    return 'APEX-METHOD-1';
  }

  @AuraEnabled
  public static string getTextMethod2() {
    return 'APEX-METHOD-2';
  }

  @AuraEnabled
  public static string getTextMethod3() {
    return 'APEX-METHOD-3';
  }

  @AuraEnabled
  public static string getTextMethod4(String message1) {
    return 'APEX-METHOD-4';
  }

  @AuraEnabled
  public static string getTextMethod5(String message2) {
    return 'APEX-METHOD-5';
  }

  @AuraEnabled(cacheable=true)
  public static List<Contact> searchContactList(String accountName) {
    if (String.isBlank(accountName)) {
      return new List<Contact>();
    }

    String key = '%' + accountName + '%';
    return [SELECT Id, Name, Email FROM Contact WHERE Account.Name LIKE :key];
  }

  @AuraEnabled
  public static List<Contact> getImperativeContactList() {
    return [SELECT Id, Name, Email FROM Contact LIMIT 1];
  }

  @AuraEnabled
  public static List<Contact> searchImperativeContactList(String accountName) {
    if (String.isBlank(accountName)) {
      return new List<Contact>();
    }
    String key = '%' + accountName + '%';
    return [SELECT Id, Name, Email FROM Contact WHERE Account.Name LIKE :key];
  }

  @AuraEnabled(Cacheable=true)
    public static List<Contact> getContacts(){
        List<Contact> contactList = [SELECT Id, FirstName, LastName, Email, Phone, AccountId,Level__c FROM Contact where FirstName!=null and Email!=null WITH SECURITY_ENFORCED];
        return contactList;
    }
}
