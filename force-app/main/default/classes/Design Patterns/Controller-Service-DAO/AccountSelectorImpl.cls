/**
 Purpose
 -----------
 1. Transaction Management between 
      --2 Salesforce orgs 
      --Salesforce org and other any external system (API, another cloud etc)
      --Salesforce org and any external database  (Oracle, MYSQL, ETL like informatica etc) through Salesforce Connect
 2. Initiate API callouts
 3. Initiate Database connectivity to query the data and to do CRUD operations
      --check permissions like FLS 
 4. Handles business logic.
 * 
 */
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