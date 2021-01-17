/**
 Note that in this scenario the service is returning responses as a custom Apex type. 
 
 It has been observed that using a JSON string as the response type improves the performance, 
 compared to the return type of Apex that is custom-defined. 
 
 The platform under the hood suffers from some performance issues, and this is more noticeable with large datasets.
 */
public with sharing class AccountWrapperController {
  @AuraEnabled
  public static List<AccountWrapper> queryAllAccountsWithContacts1() {
    List<AccountWrapper> accountWrapperList = new List<AccountWrapper>();
    List<Account> myAccounts = [SELECT id, Name, BillingState, Industry, Phone, Fax, (SELECT id, LastName, FirstName FROM Contacts) FROM Account];
    if (!myAccounts.isEmpty()) {
      for (Account acct : myAccounts) {
        AccountWrapper accountWrapper = new AccountWrapper();
        accountWrapper.currentAccount = acct;
        accountWrapper.accountId = acct.id;
        accountWrapper.Name = acct.Name;
        accountWrapper.BillingState = acct.BillingState;
        accountWrapper.Industry = acct.Industry;
        accountWrapper.Phone = acct.Phone;
        accountWrapper.Fax = acct.Fax;

        List<AccountWrapper.ContactDetail> contactDetails = new List<AccountWrapper.ContactDetail>();
        for (Contact ct : acct.contacts) {
          AccountWrapper.ContactDetail detail = new AccountWrapper.ContactDetail();
          detail.Id = ct.Id;
          detail.firstName = ct.FirstName;
          detail.lastName = ct.lastName;
          contactDetails.add(detail);
        }
        accountWrapper.contactDetail = contactDetails;
        accountWrapperList.add(accountWrapper);
      }
    }
    return accountWrapperList;
  }

  @AuraEnabled
  public static String queryAllAccountsWithContacts2() {
    List<Account> myAccounts = [SELECT id, Name, BillingState, Industry, Phone, Fax, (SELECT id, LastName, FirstName FROM Contacts) FROM Account];
    return JSON.serialize(myAccounts);
  }
}
