public with sharing class NageshOpportunityLineItemsSelector extends fflib_SObjectSelector {
  public Schema.SObjectType getSObjectType() {
    return OpportunityLineItem.sObjectType;
  }

  public List<Schema.SObjectField> getSObjectFieldList() {
    return new List<Schema.SObjectField>{ OpportunityLineItem.Id, OpportunityLineItem.Quantity, OpportunityLineItem.ProductCode };
  }
}
