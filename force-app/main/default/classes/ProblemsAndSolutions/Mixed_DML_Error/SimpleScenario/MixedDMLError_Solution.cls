public with sharing class MixedDMLError_Solution {
  public static void insertUserWithAccount() {
    Account a = new Account(Name = 'Siripurapu');
    insert a;

    FutureClass.insertUserWithRole(System.currentTimeMillis() + 'nagesh625@gmail.com', 'naagu', System.currentTimeMillis() + 'nagesh@gmail.com', 'naagusiri');
 
    //we CANNOT avoid mixed dml by chaining jobs out of a @future context!!!
 
  }
}