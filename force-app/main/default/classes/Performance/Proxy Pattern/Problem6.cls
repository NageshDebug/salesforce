/**
 02:00:18:477 USER_DEBUG [29]|DEBUG|Method-1 Spent Time:13856
 02:00:25:801 USER_DEBUG [58]|DEBUG|Method-2 Spent Time:3912
 */
@isTest
public with sharing class Problem6 {
  @isTest
  public static void withOutProxy() {
    List<Account> accounts = new List<Account>();
    for (Integer i = 0; i < 5; i++) {
      accounts.add(new Account(Name = 'Nagesh' + i));
    }
    insert accounts;

    Integer startTime = Limits.getCpuTime();
    ExternalAccountService service = new ExternalAccountService();
    service.getAccount(accounts[0].ID);
    service.getAccount(accounts[1].ID);
    service.getAccount(accounts[2].ID);
    service.getAccount(accounts[3].ID);
    service.getAccount(accounts[4].ID);
    service.getAccount(accounts[0].ID);
    service.getAccount(accounts[1].ID);
    service.getAccount(accounts[2].ID);
    service.getAccount(accounts[3].ID);
    service.getAccount(accounts[4].ID);
    service.getAccount(accounts[0].ID);
    service.getAccount(accounts[1].ID);
    service.getAccount(accounts[2].ID);
    service.getAccount(accounts[3].ID);
    service.getAccount(accounts[4].ID);
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-1 Spent Time:' + (endTime - startTime));
  }

  @isTest
  public static void withProxy() {
    List<Account> accounts = new List<Account>();
    for (Integer i = 0; i < 25; i++) {
      accounts.add(new Account(Name = 'Nagesh' + i));
    }
    insert accounts;

    Integer startTime = Limits.getCpuTime();
    ProxyService service = new ProxyService(new ExternalAccountService());
    service.getAccountWithProxy(accounts[0].ID);
    service.getAccountWithProxy(accounts[1].ID);
    service.getAccountWithProxy(accounts[2].ID);
    service.getAccountWithProxy(accounts[3].ID);
    service.getAccountWithProxy(accounts[4].ID);
    service.getAccountWithProxy(accounts[0].ID);
    service.getAccountWithProxy(accounts[1].ID);
    service.getAccountWithProxy(accounts[2].ID);
    service.getAccountWithProxy(accounts[3].ID);
    service.getAccountWithProxy(accounts[4].ID);
    service.getAccountWithProxy(accounts[0].ID);
    service.getAccountWithProxy(accounts[1].ID);
    service.getAccountWithProxy(accounts[2].ID);
    service.getAccountWithProxy(accounts[3].ID);
    service.getAccountWithProxy(accounts[4].ID);
    Integer endTime = Limits.getCpuTime();
    System.debug('Method-2 Spent Time:' + (endTime - startTime));
  }
}