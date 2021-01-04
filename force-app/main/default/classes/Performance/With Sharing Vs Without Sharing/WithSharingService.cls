public with sharing class WithSharingService {
  public static List<Account> getAccounts() {
    return [SELECT ID, NAME FROM ACCOUNT];
  }
}