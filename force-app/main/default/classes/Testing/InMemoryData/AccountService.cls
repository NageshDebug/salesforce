public with sharing class AccountService {
  public static List<String> createAccount(List<Account> accountList) {
    List<String> response = new List<String>();
    if (accountList == null || accountList.isEmpty()) {
      response.add('Input can\'t be null or empty');
    }

    for (Account acct : accountList) {
      if (String.isBlank(acct.Account_ExtId__c)) {
        response.add('Account_ExtId__c can\'t be null or empty');
      }

      if (String.isBlank(acct.Industry)) {
        response.add('Industry can\'t be null or empty');
      }

      if (String.isBlank(acct.Name)) {
        response.add('Name can\'t be null or empty');
      }
    }

    if (response.isEmpty()) {
      insert accountList;
    }
    return response;
  }
}
