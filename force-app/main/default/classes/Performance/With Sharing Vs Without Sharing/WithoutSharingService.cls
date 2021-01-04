public without sharing class WithoutSharingService {
    public static List<Account> getAccounts() {
    return [SELECT ID, NAME FROM ACCOUNT];
  }
}