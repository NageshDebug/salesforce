@isTest
private with sharing class AccountServiceTest {
  /***
     Advantage of InMemory Data Setup is: 
        No DML operations=> No need to follow Salesforce Record lifecycle (doesn't run validation rules, workflow rules, process builders, Flows and Triggers (Before and AFter) etc)
        So, deployment time is very less.  

     Difference between Inmemory data setup by creating object and JSON string. 
     Inmemory data setup by creating object limitation: we can't set values for rollup summary fields, formula fields without saving the record
     
     By using JSON we can set the values for rollup summary fields, formula fields.
     
     */

  @isTest
  private static void testCreateAccount() {
    Account acct = new Account();
    acct.Name = 'Nagesh';
    acct.Industry = 'Agriculture';
    acct.Account_ExtId__c = null;

    List<String> errors = AccountService.createAccount(new List<Account>{ acct });
    System.assertEquals(1, errors.size());
  }

  @isTest
  private static void testCreateAccount_bestWay() {
    Account acct = (Account) JSON.deserialize('{"Id":"aIu0v00000002OeCAI","Name":"Nagesh","Account_ExtId__c":null,"Industry":"Agriculture"}', Account.class);

    List<String> errors = AccountService.createAccount(new List<Account>{ acct });
    System.assertEquals(1, errors.size());
  }

  @isTest
  private static void testCreateAccountList_bestWay() {
    List<Account> acctList = (List<Account>) JSON.deserialize('[{"Id":"0014x000007KlBlAAK","Name":"Account001","Type":null,"Phone":null,"AccountNumber":null,"Industry":null,"Account_ExtId__c":"Account001"},{"Id":"0014x000007Ksx7AAC","Name":"Account001","Type":null,"Phone":null,"AccountNumber":null,"Industry":null,"Account_ExtId__c":"Account00137"},{"Id":"0014x000007Kl9cAAC","Name":"BooBoo","Type":null,"Phone":null,"AccountNumber":null,"Industry":null,"Account_ExtId__c":"Test1234"},{"Id":"0014x000003CudFAAS","Name":"Burlington Textiles Corp of America","Type":"Customer - Direct","Phone":"(336) 222-7000","AccountNumber":"CD656092","Industry":"Apparel","Account_ExtId__c":null},{"Id":"0014x000003CudHAAS","Name":"Dickenson plc","Type":"Customer - Channel","Phone":"(785) 241-6200","AccountNumber":"CC634267","Industry":"Consulting","Account_ExtId__c":null}]', List<Account>.class);

    List<String> errors = AccountService.createAccount(acctList);
    System.assertEquals(5, errors.size());
  }
}
