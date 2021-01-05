public with sharing class AccountController {
  @AuraEnabled(cacheable=true)
  public static List<account> getAccountList() {
    return [SELECT Id, Name, Phone, Industry FROM Account WITH SECURITY_ENFORCED LIMIT 10];
  }

  @AuraEnabled(cacheable=true)
  public static AccountWrap getAccounts() {
    AccountWrap wrap = new AccountWrap();
    List<selectableAccounts> selectableAccounts = new List<selectableAccounts>();

    for (Account acc : [SELECT Id, Name, Phone FROM Account LIMIT 2]) {
      selectableAccounts obj = new selectableAccounts();
      obj.account = acc;
      obj.selected = false;
      selectableAccounts.add(obj);
    }

    wrap.selectableAccounts = selectableAccounts;
    wrap.errorText = 'No Error';

    return wrap;
  }
  public class selectableAccounts {
    @AuraEnabled
    public Account account { get; set; }
    @AuraEnabled
    public Boolean selected { get; set; }
  }
  public class AccountWrap {
    @AuraEnabled
    public List<selectableAccounts> selectableAccounts { get; set; }
    @AuraEnabled
    public String errorText { get; set; }
  }
}
