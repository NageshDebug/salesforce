public with sharing class OpportunityLineItemsSelector1 extends fflib_SObjectSelector implements IOpportunityLineItemsSelector1
{
	private static IOpportunityLineItemsSelector1 selectorImpl = null;

	public OpportunityLineItemsSelector1() {
		super(false);
	}

	public static IOpportunityLineItemsSelector1 newInstance()
	{
		if(selectorImpl == null)
		{
			return new OpportunityLineItemsSelector1();
		}

		return selectorImpl;
	}

	public static void setImpl(IOpportunityLineItemsSelector1 impl)
	{
		selectorImpl = impl;
	}

	public List<Schema.SObjectField> getSObjectFieldList() {
		return new List<Schema.SObjectField> {
			 };
	}

	public Schema.SObjectType getSObjectType() {
		return OpportunityLineItem.sObjectType;
	}

	public List<OpportunityLineItem> selectById(Set<Id> idSet) {
		return (List<OpportunityLineItem>) selectSObjectsById(idSet);
	}
}