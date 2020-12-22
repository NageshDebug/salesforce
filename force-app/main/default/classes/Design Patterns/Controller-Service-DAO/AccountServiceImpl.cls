//https://codereview.stackexchange.com/questions/180553/is-this-the-right-approach-for-controller-service-dao-implementation
public class AccountServiceImpl implements AccountService {
  public Map<Boolean, Object> createRecord(Set<Account> accounts) {
    Map<Boolean, Object> mp = new Map<Boolean, Object>();
    try {
      // Create unit of work to capture work and commit it under one transaction
      fflib_ISObjectUnitOfWork uow = AccountApplication.UnitOfWork.newInstance();

      //register new accounts to insert into database
      List<Account> accountList = new List<Account>(accounts);
      uow.registerNew(accountList);

      // Commit updates to opportunities
      uow.commitWork();
    } catch (Exception exp) {
      mp.put(false, exp);
    }
    return mp;
  }

  public Map<Boolean, Object> updateRecord(Set<sObject> accounts) {
    //this.accountRepository.updateAccount(accounts);
    return null;
  }

  public Map<Boolean, Object> deleteRecord(Set<ID> accountId) {
    //this.accountRepository.deleteAccount(accountId);
    return null;
  }

  public List<Object> getRecordById(Set<ID> accountId) {
    //this.accountSelector.getAccountById(accountId);
    return null;
  }

  public List<Object> getAllRecords() {
    //this.accountSelector.getAllAccounts();
    return null;
  }
}
