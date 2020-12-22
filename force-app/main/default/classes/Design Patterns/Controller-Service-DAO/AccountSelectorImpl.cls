public class AccountSelectorImpl extends fflib_SObjectSelector implements AccountSelector {
  public Schema.SObjectType getSObjectType() {
    return Account.sObjectType;
  }

  public List<Schema.SObjectField> getSObjectFieldList() {
    return new List<Schema.SObjectField>{ Account.Id, Account.Name, Account.Industry };
  }

  public List<Account> getAccountByName(Set<String> accountNames) {
    fflib_QueryFactory queryFactory = newQueryFactory();
    queryFactory.setCondition('Name in:accountNames');
    return Database.query(queryFactory.toSOQL());
  }
}
