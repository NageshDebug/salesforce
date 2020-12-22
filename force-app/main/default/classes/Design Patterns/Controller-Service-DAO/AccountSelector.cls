public interface AccountSelector extends fflib_ISObjectSelector {
  List<Account> getAccountById(Set<ID> accountId);

  List<Account> getAllAccounts();
}
