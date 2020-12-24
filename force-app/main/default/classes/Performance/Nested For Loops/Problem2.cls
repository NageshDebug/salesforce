public with sharing class Problem2 {
  public static void multipleNestedLoops() {
    //Query all  Customer - Direct accounts
    List<Account> accounts = [SELECT Id FROM Account WHERE Type = 'Customer - Direct'];

    //Query all cases with status of open
    List<Case> openCases = [SELECT Id, AccountId, Status FROM Case WHERE Status = 'Open'];

    //Query All cases with status of working
    List<Case> workingCases = [SELECT Id, AccountId, Status FROM Case WHERE Status = 'Working'];

    //Loop through accounts
    for (Account acc : accounts) {
      //Loop through open Cases
      for (Case cse : openCases) {
        //If case is related to the account update the status
        if (acc.Id == cse.AccountId) {
          cse.Status = 'Closed';
        }
      }

      //Loop through working Cases
      for (Case cse : workingCases) {
        //If case is related to the account update the status
        if (acc.Id == cse.AccountId) {
          cse.Status = 'Closed';
        }
      }
    }
    update workingCases;
    update openCases;
  }

  public static void refactoredCode() {
    //Query all  Customer - Direct accounts and the associated cases that are Open or Working
    List<Account> accounts = [SELECT Id, (SELECT Id, Status FROM Cases WHERE Status = 'Open' OR Status = 'Working') FROM Account WHERE Type = 'Customer - Direct'];
    //List to store cases
    List<Case> cases = new List<Case>();

    //Loop through accounts
    for (Account acc : accounts) {
      //Now loop through relevent cases
      for (Case cse : acc.cases) {
        //Update the status of each case
        cse.Status = 'Closed';
        cases.add(cse);
      }
    }
    //Update Cases status
    update cases;
  }

  public static void refactoredCode1() {
    //Query all  Customer - Direct accounts and the associated cases that are Open or Working
    Map<ID, Account> accounts = new Map<ID, Account>([SELECT Id, (SELECT Id, Status FROM Cases WHERE Status = 'Open' OR Status = 'Working') FROM Account WHERE Type = 'Customer - Direct']);
    //List to store cases
    List<Case> cases = new List<Case>();

    //Loop through accounts
    //Now loop through relevent cases
    for (ID accountID : accounts.keySet()) {
      cases.addAll(accounts.get(accountID).cases);
    }

    for (Case cse : cases) {
      //Update the status of each case
      cse.Status = 'Closed';
    }
    //Update Cases status
    update cases;
  }

  public static void refactoredCode2() {
      List<Case> cases = new List<Case>();
    //Query all  Customer - Direct accounts and the associated cases that are Open or Working
    for (Case cse : [SELECT Id, Status, AccountId FROM Case WHERE (Status = 'Open' OR Status = 'Working') AND Account.Type = 'Customer - Direct']){
      //Update the status of each case
      cse.Status = 'Closed';
      cases.add(cse);
    }
    //Update Cases status
    update cases;
  }
}
