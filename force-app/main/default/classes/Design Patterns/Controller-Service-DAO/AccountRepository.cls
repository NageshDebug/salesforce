public interface AccountRepository extends fflib_ISObjectDomain {
  Map<Id, Account> createAccount(Set<Account> account);

  Map<ID, Account> updateAccount(Set<Account> accounts);

  Map<ID, String> deleteAccount(Set<ID> accountId);
}
