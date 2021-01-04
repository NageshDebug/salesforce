public with sharing class Problem5 {
  public static void readCustomMetadata(List<Account> accounts) {
    for (Account anAccount : accounts) {
      AccountHelper myAccountHelper = new AccountHelper();
      if (myAccountHelper.isSyncEnabled) {
        //Call Sync Methods
      } else {
        //Do nothing
      }
    }
  }

  public static void readCustomMetadata1(List<Account> accounts) {
    for (Account anAccount : accounts) {
      Problem5WithSingleton myAccountHelper = Problem5WithSingleton.getInstance();
      if (myAccountHelper.isSyncEnabled) {
        //Call Sync Methods
      } else {
        //Do nothing
      }
    }
  }

  public class AccountHelper {
    public Boolean isSyncEnabled { get; private set; }

    public AccountHelper() {
      for (Custom_Metadata__mdt mdmIntegration : [SELECT Custom_Field__c FROM Custom_Metadata__mdt WHERE developerName = 'Default']) {
        isSyncEnabled = String.isNotBlank(mdmIntegration.Custom_Field__c);
      }
    }
  }
}