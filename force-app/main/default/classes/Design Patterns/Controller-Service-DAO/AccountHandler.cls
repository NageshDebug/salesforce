/**
    Purposes
    ----------
    1. Dataloading validations
    2. Dont expose field API names to clients. If we modify any field clients will affect.
    3. Translate Server side exceptions to User friendly messages for clients
    4. Handle Caching for performance
    5. Handle the data through bulkification.
    6. Initiate the Async calls like Queuable Jobs and Batch Jobs etc..
 */

public with sharing class AccountHandler {
  //Dependency Injection easy for mocking to write the Unit tests and loose coupling.
  public static AccountService accountService = (AccountService) AccountApplication.Service.newInstance(AccountService.class);

  public static AccountDTO createAccount(AccountDTO request) {
    Set<Account> accounts = convertDTOToDomainObject(request);
    Map<Boolean, Object> accountMap = accountService.createRecord(accounts);

    return accountMap.get(false)!=null? parseException(accountMap):convertDomainObjectToDTO(accountMap);
  }

  public static AccountDTO updateAccount(AccountDTO request) {
    return null;
  }

  public static AccountDTO deleteAccount(Set<ID> accountId) {
    return null;
  }

  public static AccountDTO getAccountById(Set<ID> accountId) {
    return null;
  }

  public static AccountDTO getAllAccounts() {
    return null;
  }

  public static Id submitAccountJob() {
    return null;
  }

  private static Set<Account> convertDTOToDomainObject(AccountDTO dto) {
    Set<Account> accounts = new Set<Account>();
    for (AccountDTO.AccountRequest request : dto.request) {
      accounts.add(new Account(Name = request.accountName, Industry = request.Industry));
    }
    return accounts;
  }

  private static AccountDTO convertDomainObjectToDTO(Map<Boolean, Object> mp) {
    AccountDTO dto = new AccountDTO();
    dto.success = mp.get(true);

    return dto;
  }

  private static AccountDTO parseException(Map<Boolean, Object> mp) {
    AccountDTO dto = new AccountDTO();
    dto.error = mp.get(false);
    return dto;
  }
}
