public with sharing class NumberOfStatements {
  /**
    Tip to avoid apex timeout exception in some use cases.

    As we all know, Apex code has limitation of  Number of code statements that can be executed. 
    While writing Apex code, we should take care of number of code statement that are  executed to avoid governor limits. 
    It is useful to understand how to reduce the number of executed code statements so that we can stay within the governor limits.
 */
  public static void NumberOfExecutionStatements() {
    //Creating List of all account Ids
    List<id> accIdsList = new List<id>();

    //Creating set of all account Ids
    Set<id> accIdsSet = new Set<id>();

    //Creating Map with account id as key and account record as value
    Map<Id, Account> accountIdObjMap = new Map<Id, Account>();

    //Fetching all accounts
    List<account> accList = [SELECT Id, name, rating, AccountNumber FROM account LIMIT 50000];

    //Fetching Account ids
    for (Account acc : accList) {
      accIdsSet.add(acc.id);
      accIdsList.add(acc.id);
      accountIdObjMap.put(acc.id, acc);
    }
  }

  /**
   In the code above, if there are large number of records(say 50000) then for loop will be executed 50000  times and also every line in for loop will be 
   executed 50000 times. We can avoid this unnecessary for loop by using good SOQL query which will return map instead of list. 
   
   After that we can easily get list of accounts or set of account Id’s or List of account Id’s using methods.
   */
  public static void NumberOfExecutionStatements_Reduced() {
    //Creating Map with account id as key and account record as value
    Map<Id, Account> accountIdObjMap = new Map<Id, Account>([SELECT Id, name, site, rating, AccountNumber FROM Account LIMIT 50000]);

    //getting list of account using map.values method
    List<account> accList = accountIdObjMap.values();

    //getting set of account Id's using map.keySet method
    Set<id> accIdsSet = accountIdObjMap.keySet();

    //getting list of account Id's using list.addAll method
    List<id> accIdsList = new List<id>(accIdsSet);
  }
}
