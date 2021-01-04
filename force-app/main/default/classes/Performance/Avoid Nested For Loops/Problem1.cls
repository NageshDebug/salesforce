public with sharing class Problem1 {
  public static void method1() {
    List<Account> accounts = [SELECT Id, Name FROM Account LIMIT 50000];

    for (Integer i = 0; i < accounts.Size(); i++) {
      accounts[i].Name = accounts[i].Name + 'Go';
    }
  }

  public static void method2() {
    List<Account> accounts = [SELECT Id, Name FROM Account LIMIT 50000];

    for (Account currAccount : accounts) {
      currAccount.Name = currAccount.Name + 'Go';
    }
  }

  public static void method3() {
    for (Account currAccount : [SELECT Id, Name FROM Account LIMIT 50000]) {
      currAccount.Name = currAccount.Name + 'Go';
    }
  }

  public static void method4() {
    List<Account> accounts = [SELECT Id, Name FROM Account LIMIT 50000];

    for (Integer i = 0, j = accounts.Size(); i < j; i++) {
        j--;
      accounts[i].Name = accounts[i].Name + 'Go';
      accounts[j].Name = accounts[j].Name + 'Go';
    }
  }

  public static void method5() {
    List<Account> accounts = [SELECT Id, Name FROM Account LIMIT 50000];
    Integer i = 0;
    Integer j = accounts.size();
    while (i < j) {
    j--;
      accounts[i].Name = accounts[i].Name + 'Go';
      accounts[j].Name = accounts[j].Name + 'Go';
      i++;
      
    }
  }
}