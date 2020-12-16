public with sharing class NageshAccountSelector extends fflib_SObjectSelector {
  public Schema.SObjectType getSObjectType() {
    return Account.sObjectType;
  }

  public List<Schema.SObjectField> getSObjectFieldList() {
    return new List<Schema.SObjectField>{ Account.Name, Account.Industry, Account.Phone, Account.Fax, Account.AnnualRevenue, Account.BillingAddress };
  }

  public List<Account> findAccountById(Set<Id> recordIds) {
    return (List<Account>) selectSObjectsById(recordIds);
  }

  public List<Account> findAccountByName(Set<String> acctNames) {
    fflib_QueryFactory queryFactory = newQueryFactory();
    queryFactory.setCondition('Name in:acctNames');
    return Database.query(queryFactory.toSOQL());
  }
}