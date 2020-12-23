public class StaticAndDynamicQueries {
  //Be very careful with SOQL injections with dynamic queries.
  public static void dynamicSOQL1(String currentOwnerName, String newOwnerName) {
    String soqlQuery = 'Select id, OwnerId from Account where Owner.Name like {0}';
    Map<ID, Account> updateAccountWithNewOwnerName = new Map<ID, Account>();
    List<Account> accountsAssignedToCurrentOwner = Database.query(soqlQuery.replace('{0}', currentOwnerName));

    for (Account accountsToUpdateOwner : accountsAssignedToCurrentOwner) {
      updateAccountWithNewOwnerName.put(accountsToUpdateOwner.OwnerId, accountsToUpdateOwner);
    }
    update updateAccountWithNewOwnerName.values();
  }

  public static void dynamicSOQL2(String ownerName) {
    String query = 'Select id from Account where Owner.Name=' + ownerName;
    Database.QueryLocator qu = Database.getQueryLocator(query);
    // Get an iterator
    Database.QueryLocatorIterator it = qu.iterator();
    // Iterate the records
    while (it.hasNext()) {
      Account a = (Account) it.next();
      System.debug('====Account Values====' + a);
    }
  }

  /**
   When schema refactoring, we can easily identify the references for field names and table names
   */
  public static void staticSOQL(String ownerName) {
    List<Account> accounts = [SELECT id FROM account WHERE Owner.Name = :ownerName LIMIT 100];
  }

  public static void combineDynamicAndStaticSOQL(String newOwnerName) {
    Database.QueryLocator qu = Database.getQueryLocator([SELECT id FROM account] + ' where Owner.Name =' + newOwnerName);
    Database.QueryLocatorIterator it = qu.iterator();
    while (it.hasNext()) {
      Account a = (Account) it.next();
      System.debug('====Account Values====' + a);
    }
  }
}
