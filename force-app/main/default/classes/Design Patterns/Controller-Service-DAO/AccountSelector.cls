public interface AccountSelector extends fflib_ISObjectSelector {
  List<Account> getAccountByName(Set<String> accountNames);
}
