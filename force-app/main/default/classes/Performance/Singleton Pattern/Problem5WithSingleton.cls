public with sharing class Problem5WithSingleton {
  private static Problem5WithSingleton accountHelperInstance = null;
  public Boolean isSyncEnabled { get; private set; }

  private Problem5WithSingleton() {
    for (Custom_Metadata__mdt mdmIntegration : [SELECT Custom_Field__c FROM Custom_Metadata__mdt WHERE developerName = 'Default']) {
      isSyncEnabled = String.isNotBlank(mdmIntegration.Custom_Field__c);
    }
  }

  public static Problem5WithSingleton getInstance() {
    if (accountHelperInstance == null) {
      accountHelperInstance = new Problem5WithSingleton();
    }
    return accountHelperInstance;
  }
}