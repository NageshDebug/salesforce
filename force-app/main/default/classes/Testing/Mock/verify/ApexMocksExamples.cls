public with sharing class ApexMocksExamples
{

	public static final List<Schema.SObjectType> SOBJECTTYPES =
			new List<Schema.SObjectType>
			{
				Opportunity.SObjectType,
				OpportunityLineItem.SObjectType,
				Contact.SObjectType
			};

	public static final fflib_Application.UnitOfWorkFactory unitOfWorkFactory =
		new fflib_Application.UnitOfWorkFactory(SOBJECTTYPES);

	public static void ordering(Set<Id> opportunityId)
	{
		fflib_ISObjectUnitOfWork unitOfWork = unitOfWorkFactory.newInstance();

		//load some data
		List<Opportunity> opportunities = OpportunitiesSelector1.newInstance().selectById(new Set<Id>());
		List<OpportunityLineItem> oppLines = OpportunityLineItemsSelector1.newInstance().selectById(new Set<Id>());
		List<Contact> contacts = ContactsSelector1.newInstance().selectById(new Set<Id>());

		//process the data

		ContactsService.doStuff(new Set<Id> (), oppLines, contacts);

		//save it

		unitOfWork.registerDirty(new Opportunity());

		unitOfWork.registerNew(new List<Contact>());
		unitOfWork.registerNew(new List<Contact>());

		unitOfWork.registerNew(new Opportunity());

		unitOfWork.registerDirty(new Opportunity());
		unitOfWork.registerDirty(new Opportunity());

		unitOfWork.commitWork();
	}

	public static void capturing(Set<Id> opportunityId)
	{
		fflib_ISObjectUnitOfWork unitOfWork = unitOfWorkFactory.newInstance();

		//load some data
		List<Opportunity> opportunities = OpportunitiesSelector1.newInstance().selectById(new Set<Id>());
		List<OpportunityLineItem> oppLines = OpportunityLineItemsSelector1.newInstance().selectById(new Set<Id>());
		List<Contact> contacts = ContactsSelector1.newInstance().selectById(new Set<Id>());

		//do something with the objects
		List<OpportunityLineItem> newOppLines = new List<OpportunityLineItem>();
		newOppLines.addAll(oppLines);
		oppLines.addAll(newOppLines.clone());

		List<Contact> newContacts = new List<Contact>(contacts);
		contacts.addAll(newContacts);

		//save

		unitOfWork.registerDirty(oppLines);

		unitOfWork.registerNew(contacts);

		unitOfWork.commitWork();
		//save contacts
	}

	public static void answering(Set<Id> opportunityId)
	{
		fflib_ISObjectUnitOfWork unitOfWork = unitOfWorkFactory.newInstance();

		//load some data
		List<Opportunity> opportunities = OpportunitiesSelector1.newInstance().selectById(new Set<Id>());
		List<OpportunityLineItem> oppLines = OpportunityLineItemsSelector1.newInstance().selectById(new Set<Id>());
		List<Contact> contacts = ContactsSelector1.newInstance().selectById(new Set<Id>());

		//process the data

		ContactsService.doStuff(new Set<Id> (), oppLines, contacts);

		//save

		unitOfWork.registerDirty(oppLines);

		unitOfWork.commitWork();
	}

	public static void counters(Set<Id> opportunityId)
	{
		fflib_ISObjectUnitOfWork unitOfWork = unitOfWorkFactory.newInstance();
		List<Opportunity> opportunities = OpportunitiesSelector1.newInstance().selectById(new Set<Id>());

		//process the data
		for(Opportunity opp : opportunities)
		{
			unitOfWork.registerDirty(opp);
		}
	}
}