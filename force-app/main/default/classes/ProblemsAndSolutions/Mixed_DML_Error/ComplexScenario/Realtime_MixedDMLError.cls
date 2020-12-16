public with sharing class Realtime_MixedDMLError {
  public static void insertContactAndUserWithPermissioNSet() {
    Contact cnt = new Contact(LastName = 'Siripurapu');
    insert cnt;

    Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    String email = System.currentTimeMillis() + 'nagesh625@gmail.com';
    Realtime_MixedDMLError_Future.createUser(cnt.id, email, 'Nagesh', 'Siripurapu', email, p.Id);
  }
}