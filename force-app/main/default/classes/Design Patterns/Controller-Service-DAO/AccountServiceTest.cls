@isTest
private with sharing class AccountServiceTest {
  @isTest
  private static void testCreateAccount() {
    Set<Account> accountSet = new Set<Account>();
    for (Integer index = 0; index < 10; index++) {
      accountSet.add(new Account(Name = 'Nagesh' + index));
    }

    AccountService accountService = (AccountService) AccountApplication.Service.newInstance(AccountService.class);
    Map<Id, Account> response = accountService.createAccount(accountSet);

    for (Account acct : response.values()) {
      System.assert(acct.Name.contains('Nagesh'));
    }
  }
}
