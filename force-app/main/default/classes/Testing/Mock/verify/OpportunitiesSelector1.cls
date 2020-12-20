public with sharing class OpportunitiesSelector1 extends fflib_SObjectSelector implements IOpportunitiesSelector1
{
	private static IOpportunitiesSelector1 selectorImpl = null;

	public OpportunitiesSelector1() {
		super(false);
	}

	public static IOpportunitiesSelector1 newInstance()
	{
		if(selectorImpl == null)
		{
			return new OpportunitiesSelector1();
		}

		return selectorImpl;
	}

	public static void setImpl(IOpportunitiesSelector1 impl)
	{
		selectorImpl = impl;
	}

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
             };
    }

    public Schema.SObjectType getSObjectType() {
        return Opportunity.sObjectType;
    }

    public List<Opportunity> selectById(Set<Id> idSet) {
        return (List<Opportunity>) selectSObjectsById(idSet);
    }
}