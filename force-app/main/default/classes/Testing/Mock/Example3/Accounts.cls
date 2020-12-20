public with sharing class Accounts {
  // Instance variable for dependency injection - see README for more details.
  @TestVisible
  private static Accounts instance = null;

  // newInstance helper for dependency injection - see README for more details.
  public static Accounts newInstance() {
    if (instance == null) {
      instance = new Accounts();
    }

    return instance;
  }

  public void handleTrigger() {
    // We need to know the IDs for our duplicate checking, which may be unset until the after triggers.
    // So we'll only handle Trigger.isAfter
    if (Trigger.isAfter) {
      // We only want to perform duplicate checking on insert/update
      if (Trigger.isInsert || Trigger.isUpdate) {
        // Send the Trigger's new records to the DuplicateAccountBlocker to prevent duplicates
        DuplicateAccountBlocker.newInstance().preventDuplicates((Map<Id, Account>) Trigger.newMap);
      }
    }
  }
}
