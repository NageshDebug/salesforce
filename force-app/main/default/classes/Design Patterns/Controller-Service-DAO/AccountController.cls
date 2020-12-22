/**
    Purposes
    ----------
    1. UI validations
    2. Dont expose field API names to UI
    3. Translate Server side exceptions to User friendly messages to display in UI
    4. Handle Caching for performance
    5. Initiate long running requests
    6. Split the transaction into multiple to handle specific scenarios like perform DML before callout.
    7. Any convertions like displaying the amount field in different currencies without creating custom fields.
    8. Convert the data into bulkification.
    9. Pagination.
    10. Eagerly Loading and Lazy loading
 */

public class AccountController {
  @AuraEnabled
  public static AccountDTO.AccountResponse createAccount(AccountDTO.AccountRequest request) {
    try {
      return AccountHandler.createAccount(request);
    } catch (Exception exp) {
      throw new AuraHandledException('Error occured while creating the Account');
    }
  }

  @AuraEnabled
  public static AccountDTO.AccountResponse updateAccount(AccountDTO.AccountRequest request) {
    try {
      return AccountHandler.updateAccount(request);
    } catch (Exception exp) {
      throw new AuraHandledException('Error occured while updating the Account');
    }
  }

  @AuraEnabled
  public static AccountDTO.AccountResponse deleteAccount(ID accountId) {
    try {
      return AccountHandler.deleteAccount(new Set<ID>{ accountId });
    } catch (Exception exp) {
      throw new AuraHandledException('Error occured while deleting the Account');
    }
  }

  @AuraEnabled
  public static AccountDTO.AccountResponse getAccountById(ID accountId) {
    try {
      return AccountHandler.getAccountById(new Set<ID>{ accountId });
    } catch (Exception exp) {
      throw new AuraHandledException('Error occured while getting the Account');
    }
  }

  @AuraEnabled
  public static AccountDTO.AccountResponse getAllAccounts() {
    try {
      return AccountHandler.getAllAccounts();
    } catch (Exception exp) {
      throw new AuraHandledException('Error occured while getting the Accounts');
    }
  }
}
