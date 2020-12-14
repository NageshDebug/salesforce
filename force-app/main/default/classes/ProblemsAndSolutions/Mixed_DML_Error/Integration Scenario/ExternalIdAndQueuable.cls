public with sharing class ExternalIdAndQueuable {
  public void execute(QueueableContext context) {
    Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];

    Account a = new Account(Name = 'Account001', account_ExtId__c = 'Account001');
    Contact c = new Contact(FirstName = 'Chenda', LastName = 'Mok', Account = new Account(account_ExtId__c = 'Account001'), contact_ExtId__c = 'Contact001');
    User u = new User(FirstName = c.FirstName, LastName = c.LastName, Email = System.currentTimeMillis() + 'chenda.mok@yopmail.com', Username = System.currentTimeMillis() + 'chenda.mok@yopmail.com.envdev', Alias = '  cmok001', CommunityNickname = 'mokchend', ProfileId = p.Id, UserPermissionsMobileUser = false, TimeZoneSidKey = 'America/Chicago', LocaleSidKey = 'en_US', EmailEncodingKey = 'UTF-8', LanguageLocaleKey = 'en_US');
    insert new List<Sobject>{ a, c, u };
  }
}
