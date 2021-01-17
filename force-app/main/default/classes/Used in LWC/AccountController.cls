public with sharing class AccountController {
  @AuraEnabled(cacheable=true)
  public static List<Account> getAccountList() {
    return [SELECT Id, Name, AnnualRevenue, Industry, Phone FROM Account];
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

  @AuraEnabled(cacheable=true)
  public static list<Account> retriveAccs(String strAccName) {
    strAccName = '%' + strAccName + '%';
    list<Account> lstAccs = [SELECT Id, Name, Industry, Phone, Type FROM Account WHERE Name LIKE :strAccName];

    if (lstAccs.isEmpty()) {
      throw new AuraHandledException('No Record Found..');
    }
    return lstAccs;
  }

  @AuraEnabled(cacheable=true)
    public static List<Account> searchAccountNameMethod (String accStrName, String accStrPhone, String accStrWebsite, String accStrIndustry, String accStrDescription){
        String keyNameString = '%' +  accStrName + '%';
        return [Select Id, Name, Phone, Website, Industry, Description From Account Where Name like:keyNameString];
     } 

     /** Method to implement Apex Wire Method to a property, apex wire method to a function and 
    Call an Apex Method Imperatively  **/
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountDataList(String searchKey) {
        
        List<Account> accObjList = [SELECT  Id, Name From Account Limit 5];
        
        return accObjList;
    } 
 
    /** Method to get Account in search result **/
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(String searchKey) {
        searchKey = '%' + searchKey + '%';
        List<Account> accList = [SELECT  Id, Name, Industry, Phone, Type From Account WHERE Name LIKE :searchKey];

        return accList;
    }
}
