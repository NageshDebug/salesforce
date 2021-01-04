public class AccountRepositoryImpl extends fflib_SObjectDomain implements AccountRepository {
  public static AccountRepository newInstance(List<Account> recordList) {
    return (AccountRepository) AccountApplication.Domain.newInstance(recordList);
  }

  public static AccountRepository newInstance(Set<Id> recordIdSet) {
    return (AccountRepository) AccountApplication.Domain.newInstance(recordIdSet);
  }

  public AccountRepositoryImpl(List<Account> sObjectList) {
    super(sObjectList);
  }

  public class Constructor implements fflib_SObjectDomain.IConstructable {
    public fflib_SObjectDomain construct(List<SObject> sObjectList) {
      return new AccountRepositoryImpl(sObjectList);
    }
  }
  public Map<Id, Account> createAccount(Set<Account> account) {
    return null;
  }

  public Map<ID, Account> updateAccount(Set<Account> accounts) {
    return null;
  }

  public Map<ID, String> deleteAccount(Set<ID> accountId) {
    return null;
  }
}