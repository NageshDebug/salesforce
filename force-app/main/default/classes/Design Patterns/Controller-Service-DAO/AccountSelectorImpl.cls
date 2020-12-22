public class AccountSelectorImpl extends fflib_SObjectSelector implements AccountSelector {
  public Schema.SObjectType getSObjectType() {
    return Opportunity.sObjectType;
  }

  public List<Schema.SObjectField> getSObjectFieldList() {
    return new List<Schema.SObjectField>{ Account.Id, Account.Name, Account.Industry };
  }

  public List<Account> getAccountById(Set<ID> accountId) {
    return null;
  }

  public List<Account> getAllAccounts() {
    return null;
  }
}
