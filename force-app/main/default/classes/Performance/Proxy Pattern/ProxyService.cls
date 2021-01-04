public with sharing class ProxyService {
  public Map<Id, Account> mp=new Map<Id, Account>();
  private ExternalAccountService service;
  public ProxyService(ExternalAccountService service) {
    this.service = service;
  }

  public Account getAccountWithProxy(ID accountID) {
    if (!mp.containsKey(accountID)) {
      mp.put(accountID,this.service.getAccount(accountID));
    }
    return mp.get(accountID);
  }
}