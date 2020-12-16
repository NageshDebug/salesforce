public with sharing class NageshOpportunitySelector extends fflib_SObjectSelector {
  public NageshOpportunitySelector() {
    super(false);
  }
  public NageshOpportunitySelector(Boolean includeFieldSetFields) {
    super(includeFieldSetFields);
  }
  public List<Schema.SObjectField> getSObjectFieldList() {
    return new List<Schema.SObjectField>{ Opportunity.Id, Opportunity.Name, Opportunity.StageName };
  }

  public Schema.SObjectType getSObjectType() {
    return Opportunity.sObjectType;
  }

  //Default ordering is whereby all queries which do not explicitly define their own ordering through setting up a query using a query factory will inherit the default ordering.
  //Default behaviour: defaults to the name field of the object if it is not encrypted or CreatedDate if there the object has createdDated or Id

  //we can override the default behaviour in 2 ways
  //Method-1: override getOrderBy method as below
  //Method-2: by using queryfactory  Example: refer this method "findByOpportunityLineItemIdIdAndPageNumber"
  public override String getOrderBy() {
    return 'Name DESC, StageName ASC NULLS LAST';
  }

  public List<Opportunity> findOpportunityById(Set<ID> idSet) {
    return (List<Opportunity>) selectSObjectsById(idSet);
  }

  public List<Opportunity> findOpportunityByName(Set<String> name) {
    return [SELECT Id, Name FROM Opportunity WHERE Name IN :name];
  }

  //we can passes a false parameter to the newQueryFactory method to instruct the base class to ignore the fields specified in getSObjectFieldList when creating the query factory instance.
  //Default value is true
  public List<Opportunity> findOpportunityByNameUsingQueryFactory(Set<String> name) {
    fflib_QueryFactory queryFactory = newQueryFactory();
    queryFactory.selectField('ID').selectField('Name').setCondition('Name IN :name').setCondition('SystemModstamp = LAST_N_DAYS:30');
    return Database.query(queryFactory.toSOQL());
  }

  public Decimal findAggregateDetails(List<Id> oppIds) {
    String groupByClause = 'StageName';

    String formatQuery = String.format('Select {0} sumOfProbability, {1} from Opportunity where Id IN :oppIds Group By {2}', new List<String>{ 'sum(Probability)', groupByClause, groupByClause });
    List<AggregateResult> aggregateResult = (List<AggregateResult>) Database.query(formatQuery);

    Decimal sumOfProbability = 0;
    if (aggregateResult != null && !aggregateResult.isEmpty()) {
      sumOfProbability = (Decimal) aggregateResult[0].get('sumOfProbability');
    }
    return sumOfProbability;
  }

  //Parent to Child Query (Sub queries)
  public Opportunity findRelatedDetails(Id oppLineItemId) {
    fflib_QueryFactory qf = new fflib_QueryFactory(Opportunity.sObjectType);
    qf.selectField('name').selectField('Id').setCondition('Id In (Select OpportunityId from OpportunityLineItem where Id=:oppLineItemId)');
    qf.subselectQuery('Invoices__r').selectField('Id').selectField('Name').selectField('InvoiceDate__c');
    qf.subselectQuery('Orders').selectField('Id').selectField('Name').selectField('OrderNumber').setCondition('Status=\'Draft\'');
    //Generated Query:
    //SELECT Id, Name, (SELECT Id, InvoiceDate__c, Name FROM Invoices__r),(SELECT Id, Name, OrderNumber FROM Orders WHERE Status='Draft')  FROM Opportunity WHERE Id In (Select OpportunityId from OpportunityLineItem where Id=:oppLineItemId)
    return Database.query(qf.toSOQL());
  }

  //Subqueries
  public List<Opportunity> selectByIdWithLineItems(Set<Id> recordIds) {
    fflib_QueryFactory query = newQueryFactory();
    query.setCondition('Id IN :recordIds');

    new OpportunityLineItemsSelector().addQueryFactorySubselect(query, 'OpportunityLineItems');
    //Generated Query
    //SELECT Id, Name, StageName, (SELECT Description, Id, ListPrice, OpportunityId, PricebookEntryId, Quantity, SortOrder, TotalPrice, UnitPrice FROM OpportunityLineItems ORDER BY SortOrder ASC NULLS FIRST , PricebookEntry.Name ASC NULLS FIRST )  FROM Opportunity WHERE Id IN :recordIds ORDER BY Name DESC NULLS FIRST , StageName ASC NULLS LAST
    return (List<Opportunity>) Database.query(query.toSOQL());
  }

  public List<Opportunity> findByOpportunityLineItemIdIdAndPageNumber(Id oppLineItemId, Integer pageNumber) {
    Integer calcOffset = pageNumber * 200;
    Integer maxOpportunitiesPerPage = 20;
    fflib_QueryFactory queryFactory = newQueryFactory();
    fflib_QueryFactory.Ordering ordering = new fflib_QueryFactory.Ordering(Opportunity.CreatedDate, fflib_QueryFactory.SortOrder.DESCENDING, false);
    queryFactory.addOrdering(ordering);
    List<fflib_QueryFactory.Ordering> orderings = queryFactory.getOrderings();
    orderings.remove(0);
    String queryWithOffSet = queryFactory.setCondition('Id In (Select OpportunityId from OpportunityLineItem where Id=:oppLineItemId)').setLimit(maxOpportunitiesPerPage).toSOQL() + ' offset ' + calcOffset;
    //Generated Query
    //SELECT Id, Name, StageName FROM Opportunity WHERE Id In (Select OpportunityId from OpportunityLineItem where Id=:oppLineItemId) ORDER BY StageName ASC NULLS LAST , CreatedDate DESC NULLS FIRST  LIMIT 20 offset 200
    return (List<Opportunity>) Database.query(queryWithOffSet);
  }
  /****
    OR:
        will match for any value in picklist
        String.join(goalTypeList, ',')
 
    AND:
        will match for all the value in picklist
        String.join(goalTypeList, ';')
 */
  public List<Opportunity> findOpportunitiesByMultipicklistValues(List<String> targetProducts, List<String> dealEligibleCountries, List<String> installationStatus, List<String> discountTypes, List<String> invoiceStatus, List<ID> oppIdList) {
    fflib_QueryFactory queryFactory = newQueryFactory();
    String targetProductList = '\'' + String.join(targetProducts, '\',\'') + '\'';
    String dealEligibleCountriesList = '\'' + String.join(dealEligibleCountries, '\',\'') + '\'';

    String query = queryFactory.setCondition('StageName=\'Discovery\'AND Id=:oppIdList AND (Target_Products__c INCLUDES(' + targetProductList + ') AND Deal_Eligible_Countries__c INCLUDES(' + dealEligibleCountriesList + ') AND DeliveryInstallationStatus__c IN :installationStatus AND DiscountType__c IN :discountTypes AND InvoicedStatus__c IN :invoiceStatus)').setLimit(2).toSOQL();

    //Generated Query
    //SELECT Id, Name, StageName FROM Opportunity WHERE StageName='Discovery'AND Id=:oppIdList AND (Target_Products__c INCLUDES('Express Checkout','Virtual Terminal','Paypal Here') AND Deal_Eligible_Countries__c INCLUDES('IN','AU','CN','GB') AND DeliveryInstallationStatus__c IN :installationStatus AND DiscountType__c IN :discountTypes AND InvoicedStatus__c IN :invoiceStatus) ORDER BY Name DESC NULLS FIRST , StageName ASC NULLS LAST  LIMIT 2
    return (List<Opportunity>) Database.query(query);
  }

  public List<Opportunity> findByIdWithLineItems(Set<Id> recordIds) {
    fflib_QueryFactory query = newQueryFactory();
    query.setCondition('Id IN :recordIds');
    query.selectFieldSet(SObjectType.Opportunity.FieldSets.MyFieldset);
    return (List<Opportunity>) Database.query(query.toSOQL());
  }

  //To execute this method, we need to do constructor overloadingto call the super class constructor
  //and then call the method "selectSObjectsById" or any query factory method like "addQueryFactorySubselect"
  public override List<Schema.FieldSet> getSObjectFieldSetList() {
    return new List<Schema.FieldSet>{ SObjectType.Opportunity.FieldSets.MyFieldset };
  }

  //Query Child to Parent
  public List<Opportunity> findOpportunityAndItsParentAccounts(Set<Id> recordIds) {
    return Database.query(newQueryFactory().selectField('Account.Name').selectField('Account.Parent.Name').setCondition('Id IN :recordIds').toSOQL());
  }

  //Query Child to Parent (calling selector from selector)
  public List<Opportunity> findOpportunityAndAccountsDetails(Set<Id> recordIds) {
    fflib_QueryFactory query = newQueryFactory();
    query.setCondition('id in :recordIds');

    fflib_SObjectSelector accountSelector = new NageshAccountSelector();
    accountSelector.configureQueryFactoryFields(query, 'Account');

    return (List<Opportunity>) Database.query(query.toSOQL());
  }

  //Where Conditions
  //Only Last condition will be taken into consideration. I.e Last where condition overrides the previous conditions.

  //Refer this method "findOpportunitiesByMultipicklistValues" for multiple where conditions

  //Be aware that in the where condition there are no security checks performed done by the framework to prevent SOQL injections.
  //Ensure that any user supplied input is correctly escaped using String.escapeSingleQuotes.
  public List<Opportunity> findOpportunityWithMultipleWhereConditions(Set<Id> recordIds) {
    fflib_QueryFactory query = newQueryFactory();
    query.setCondition('Id IN :recordIds').setCondition('StageName=\'Discovery\'').setCondition('SystemModstamp = LAST_N_DAYS:30');
    //Generated Query
    //SELECT Id, Name, StageName FROM Opportunity WHERE SystemModstamp = LAST_N_DAYS:30 ORDER BY Name DESC NULLS FIRST , StageName ASC NULLS LAST
    return (List<Opportunity>) Database.query(query.toSOQL());
  }

  //Note: 2 queries will be fired. we can achieve the same result using single query, if we know the reference field.
  //Example: Refer this method: "configureQueryFactoryFields"
  public List<Opportunity> findByOpportunityAndAccountDetailsUsingDifferentSelectors(Set<String> acctNames) {
    List<Opportunity> opportunities = new List<Opportunity>();
    List<Account> acctList = new NageshAccountSelector().findAccountByName(acctNames);

    Set<Id> acctIds = new Set<Id>();
    for (Account acct : acctList) {
      acctIds.add(acct.Id);
    }

    if (!acctIds.isEmpty()) {
      fflib_QueryFactory queryFactory = newQueryFactory();
      queryFactory.setCondition('AccountId IN:acctIds');
      opportunities = Database.query(queryFactory.toSOQL());
    }
    return opportunities;
  }
}