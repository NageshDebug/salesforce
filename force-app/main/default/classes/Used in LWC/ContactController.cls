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
}
