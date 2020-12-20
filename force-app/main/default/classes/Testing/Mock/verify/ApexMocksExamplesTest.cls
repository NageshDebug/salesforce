@isTest
private class ApexMocksExamplesTest
{
	private static final Fflib_ApexMocks MY_MOCKS = new Fflib_ApexMocks();

	@isTest
	static void test_selector_Order()
	{
		IOpportunitiesSelector1 mockOpportunitiesSelector =
			(IOpportunitiesSelector1)MY_MOCKS.mock(OpportunitiesSelector1.class);
		OpportunitiesSelector1.setImpl(mockOpportunitiesSelector);

		IOpportunityLineItemsSelector1 mockOpportunityLineItemsSelector =
			(IOpportunityLineItemsSelector1)MY_MOCKS.mock(OpportunityLineItemsSelector1.class);
		OpportunityLineItemsSelector1.setImpl(mockOpportunityLineItemsSelector);

		IContactsSelector1 mockContactsSelector = (IContactsSelector1)MY_MOCKS.mock(ContactsSelector1.class);
		ContactsSelector1.setImpl(mockContactsSelector);

		ContactsService.API mockService = new MockContactService(MY_MOCKS);
		ContactsService.setImpl(mockService);

		Fflib_ISObjectUnitOfWork mockUoW = (Fflib_ISObjectUnitOfWork)MY_MOCKS.mock(fflib_SObjectUnitOfWork.class);

		ApexMocksExamples.unitOfWorkFactory.setMock(mockUoW);


		fflib_InOrder inOrder1 =
			new fflib_InOrder(MY_MOCKS, new List<Object>
			{
				mockOpportunitiesSelector, //the order of the mock instances in this list doesn't matter
				mockOpportunityLineItemsSelector,
				mockContactsSelector
			});

		ApexMocksExamples.ordering(new Set<ID>());

		((IOpportunitiesSelector1)inOrder1.verify(mockOpportunitiesSelector, MY_MOCKS.calls(1))).selectById((Set<ID>)fflib_Match.anyObject());
		((IOpportunityLineItemsSelector1)inOrder1.verify(mockOpportunityLineItemsSelector, MY_MOCKS.calls(1))).selectById((Set<ID>)fflib_Match.anyObject());
		((IContactsSelector1)inOrder1.verify(mockContactsSelector, MY_MOCKS.calls(1))).selectById((Set<ID>)fflib_Match.anyObject());
	}

	@isTest
	static void test_UnitOfWork_order()
	{
		IOpportunitiesSelector1 mockOpportunitiesSelector = (IOpportunitiesSelector1)MY_MOCKS.mock(OpportunitiesSelector1.class);
		OpportunitiesSelector1.setImpl(mockOpportunitiesSelector);

		IOpportunityLineItemsSelector1 mockOpportunityLineItemsSelector = (IOpportunityLineItemsSelector1)MY_MOCKS.mock(OpportunityLineItemsSelector1.class);
		OpportunityLineItemsSelector1.setImpl(mockOpportunityLineItemsSelector);

		IContactsSelector1 mockContactsSelector = (IContactsSelector1)MY_MOCKS.mock(ContactsSelector1.class);
		ContactsSelector1.setImpl(mockContactsSelector);

		ContactsService.API mockService = new MockContactService(MY_MOCKS);
		ContactsService.setImpl(mockService);

		Fflib_ISObjectUnitOfWork mockUoW = (Fflib_ISObjectUnitOfWork)MY_MOCKS.mock(fflib_SObjectUnitOfWork.class);

		ApexMocksExamples.unitOfWorkFactory.setMock(mockUoW);


		fflib_InOrder inOrder1 = new fflib_InOrder(MY_MOCKS, new List<Object>{
			mockUoW
		});

		ApexMocksExamples.ordering(new Set<ID>());


		((Fflib_ISObjectUnitOfWork) inOrder1.verify(mockUoW, MY_MOCKS.calls(2))).registerDirty(new Opportunity());


		((Fflib_ISObjectUnitOfWork) inOrder1.verify(mockUoW, MY_MOCKS.calls(1))).commitWork();
	}

	@isTest
	static void test_UnitOfWork_order_InStrictlyWay()
	{
		IOpportunitiesSelector1 mockOpportunitiesSelector = (IOpportunitiesSelector1)MY_MOCKS.mock(OpportunitiesSelector1.class);
		OpportunitiesSelector1.setImpl(mockOpportunitiesSelector);

		IOpportunityLineItemsSelector1 mockOpportunityLineItemsSelector = (IOpportunityLineItemsSelector1)MY_MOCKS.mock(OpportunityLineItemsSelector1.class);
		OpportunityLineItemsSelector1.setImpl(mockOpportunityLineItemsSelector);

		IContactsSelector1 mockContactsSelector = (IContactsSelector1)MY_MOCKS.mock(ContactsSelector1.class);
		ContactsSelector1.setImpl(mockContactsSelector);

		ContactsService.API mockService = new MockContactService(MY_MOCKS);
		ContactsService.setImpl(mockService);

		Fflib_ISObjectUnitOfWork mockUoW = (Fflib_ISObjectUnitOfWork)MY_MOCKS.mock(fflib_SObjectUnitOfWork.class);
		ApexMocksExamples.unitOfWorkFactory.setMock(mockUoW);

		fflib_InOrder inOrder1 = new fflib_InOrder(MY_MOCKS, new List<Object>{mockUoW});

		ApexMocksExamples.ordering(new Set<ID>());

		((Fflib_ISObjectUnitOfWork) inOrder1.verify(mockUoW, MY_MOCKS.calls(1))).registerDirty( new Opportunity());

		((Fflib_ISObjectUnitOfWork) inOrder1.verify(mockUoW, MY_MOCKS.calls(2))).registerNew(new List<Contact>());


		((Fflib_ISObjectUnitOfWork) inOrder1.verify(mockUoW, MY_MOCKS.calls(1))).registerNew(new Opportunity());

		((Fflib_ISObjectUnitOfWork) inOrder1.verify(mockUoW, MY_MOCKS.calls(1))).registerDirty( new Opportunity());

		((Fflib_ISObjectUnitOfWork) inOrder1.verify(mockUoW, MY_MOCKS.calls(1))).commitWork();
	}

	@isTest
	static void test_Capturing()
	{
		List<Opportunity> mockOpportunities = new List<Opportunity>();
		List<OpportunityLineItem> mockLines = new List <OpportunityLineItem>
		{
			new OpportunityLineItem(Description ='one'),
			new OpportunityLineItem(Description ='two'),
			new OpportunityLineItem(Description ='tree')
		};

		List<Contact> mockContacts = new List <Contact>
		{
			new Contact(Description ='ctone'),
			new Contact(Description ='cttwo'),
			new Contact(Description ='cttree'),
			new Contact(Description ='ctfour')
		};

		IOpportunitiesSelector1 mockOpportunitiesSelector = (IOpportunitiesSelector1)MY_MOCKS.mock(OpportunitiesSelector1.class);
		IOpportunityLineItemsSelector1 mockOpportunityLineItemsSelector = (IOpportunityLineItemsSelector1)MY_MOCKS.mock(OpportunityLineItemsSelector1.class);
		IContactsSelector1 mockContactsSelector = (IContactsSelector1)MY_MOCKS.mock(ContactsSelector1.class);
		MY_MOCKS.startStubbing();

		MY_MOCKS.when(mockOpportunitiesSelector.selectById(new Set<Id>())).thenReturn(mockOpportunities);
		MY_MOCKS.when(mockOpportunityLineItemsSelector.selectById(new Set<Id>())).thenReturn(mockLines);
		MY_MOCKS.when(mockContactsSelector.selectById(new Set<Id>())).thenReturn(mockContacts);

		MY_MOCKS.stopStubbing();
		OpportunitiesSelector1.setImpl(mockOpportunitiesSelector);
		OpportunityLineItemsSelector1.setImpl(mockOpportunityLineItemsSelector);
		ContactsSelector1.setImpl(mockContactsSelector);

		Fflib_ISObjectUnitOfWork mockUoW = (Fflib_ISObjectUnitOfWork)MY_MOCKS.mock(fflib_SObjectUnitOfWork.class);
		ApexMocksExamples.unitOfWorkFactory.setMock(mockUoW);

		fflib_ArgumentCaptor captor1 = fflib_ArgumentCaptor.forClass(List<OpportunityLineItem>.class);
		fflib_ArgumentCaptor captor2 = fflib_ArgumentCaptor.forClass(List<Contact>.class);


		ApexMocksExamples.capturing(new Set<Id>());


		((Fflib_ISObjectUnitOfWork) MY_MOCKS.verify(mockUoW)).registerDirty((List<OpportunityLineItem>) captor1.capture());
		((Fflib_ISObjectUnitOfWork) MY_MOCKS.verify(mockUoW)).registerNew((List<Contact>) captor2.capture());


		List<OpportunityLineItem> oppLinesCaptured = (List<OpportunityLineItem>)captor1.getValue();
		List<Contact> contactsCaptured = (List<Contact>)captor2.getValue();

		System.assertEquals(6, oppLinesCaptured.size(), '');
		System.assertEquals(8, contactsCaptured.size(), '');
	}

	@isTest
	static void test_WithoutCapturing()
	{
		List<Opportunity> mockOpportunities = new List<Opportunity>();
		List<OpportunityLineItem> mockLines = new List <OpportunityLineItem>
		{
			new OpportunityLineItem(Description ='one'),
			new OpportunityLineItem(Description ='two'),
			new OpportunityLineItem(Description ='tree')
		};

		List<Contact> mockContacts = new List <Contact>
		{
			new Contact(Description ='ctone'),
			new Contact(Description ='cttwo'),
			new Contact(Description ='cttree'),
			new Contact(Description ='ctfour')
		};

		IOpportunitiesSelector1 mockOpportunitiesSelector = (IOpportunitiesSelector1)MY_MOCKS.mock(OpportunitiesSelector1.class);
		IOpportunityLineItemsSelector1 mockOpportunityLineItemsSelector = (IOpportunityLineItemsSelector1)MY_MOCKS.mock(OpportunityLineItemsSelector1.class);
		IContactsSelector1 mockContactsSelector = (IContactsSelector1)MY_MOCKS.mock(ContactsSelector1.class);
		MY_MOCKS.startStubbing();

		MY_MOCKS.when(mockOpportunitiesSelector.selectById(new Set<Id>())).thenReturn(mockOpportunities);
		MY_MOCKS.when(mockOpportunityLineItemsSelector.selectById(new Set<Id>())).thenReturn(mockLines);
		MY_MOCKS.when(mockContactsSelector.selectById(new Set<Id>())).thenReturn(mockContacts);

		MY_MOCKS.stopStubbing();
		OpportunitiesSelector1.setImpl(mockOpportunitiesSelector);
		OpportunityLineItemsSelector1.setImpl(mockOpportunityLineItemsSelector);
		ContactsSelector1.setImpl(mockContactsSelector);

		Fflib_ISObjectUnitOfWork mockUoW = (Fflib_ISObjectUnitOfWork)MY_MOCKS.mock(fflib_SObjectUnitOfWork.class);
		ApexMocksExamples.unitOfWorkFactory.setMock(mockUoW);

		List<OpportunityLineItem> expectedOppLines = new List <OpportunityLineItem>
		{
			new OpportunityLineItem(Description ='one'),
			new OpportunityLineItem(Description ='two'),
			new OpportunityLineItem(Description ='tree'),
			new OpportunityLineItem(Description ='one'),
			new OpportunityLineItem(Description ='two'),
			new OpportunityLineItem(Description ='tree')
		};

		ApexMocksExamples.capturing(new Set<Id>());

		((Fflib_ISObjectUnitOfWork) MY_MOCKS.verify(mockUoW)).registerDirty(expectedOppLines);
	}

	@isTest
	static void test_Answering()
	{
		List<Opportunity> mockOpportunities = new List<Opportunity>();
		List<OpportunityLineItem> mockLines = new List <OpportunityLineItem>
		{
			new OpportunityLineItem(Description ='one'),
			new OpportunityLineItem(Description ='two'),
			new OpportunityLineItem(Description ='tree')
		};

		List<Contact> mockContacts = new List <Contact>
		{
			new Contact(Description ='ctone')
		};

		IOpportunitiesSelector1 mockOpportunitiesSelector = (IOpportunitiesSelector1)MY_MOCKS.mock(OpportunitiesSelector1.class);
		IOpportunityLineItemsSelector1 mockOpportunityLineItemsSelector = (IOpportunityLineItemsSelector1)MY_MOCKS.mock(OpportunityLineItemsSelector1.class);
		IContactsSelector1 mockContactsSelector = (IContactsSelector1)MY_MOCKS.mock(ContactsSelector1.class);
		Fflib_ISObjectUnitOfWork mockUoW = (Fflib_ISObjectUnitOfWork)MY_MOCKS.mock(fflib_SObjectUnitOfWork.class);
		ContactsService.API mockService = new MockContactService(MY_MOCKS);

		MY_MOCKS.startStubbing();

		MY_MOCKS.when(mockOpportunitiesSelector.selectById(new Set<Id>())).thenReturn(mockOpportunities);
		MY_MOCKS.when(mockOpportunityLineItemsSelector.selectById(new Set<Id>())).thenReturn(mockLines);
		MY_MOCKS.when(mockContactsSelector.selectById(new Set<Id>())).thenReturn(mockContacts);

		MY_MOCKS.when(mockService.doStuff(new Set<Id>(), mockLines, mockContacts)).thenAnswer(new MyAnswer());

		MY_MOCKS.stopStubbing();
		OpportunitiesSelector1.setImpl(mockOpportunitiesSelector);
		OpportunityLineItemsSelector1.setImpl(mockOpportunityLineItemsSelector);
		ContactsSelector1.setImpl(mockContactsSelector);

		ContactsService.setImpl(mockService);

		ApexMocksExamples.unitOfWorkFactory.setMock(mockUoW);


		ApexMocksExamples.answering(new Set<Id>());

		List<OpportunityLineItem> expectedOppLines = new List <OpportunityLineItem>
		{
			new OpportunityLineItem(Description ='one'),
			new OpportunityLineItem(Description ='two'),
			new OpportunityLineItem(Description ='tree'),
			new OpportunityLineItem(Description ='one'),
			new OpportunityLineItem(Description ='two'),
			new OpportunityLineItem(Description ='tree'),
			new OpportunityLineItem(Description ='one'),
			new OpportunityLineItem(Description ='two'),
			new OpportunityLineItem(Description ='tree')
		};

		((Fflib_ISObjectUnitOfWork) MY_MOCKS.verify(mockUoW)).registerDirty(expectedOppLines);
	}


	public class MyAnswer implements fflib_Answer
	{
		public Object answer(fflib_InvocationOnMock invocation)
		{
			List<OpportunityLineItem> oppLines = (List<OpportunityLineItem>) invocation.getArgument(1);

			List<OpportunityLineItem> newOppLines = new List<OpportunityLineItem>();
			newOppLines.addAll(oppLines);
			oppLines.addAll(newOppLines.clone());
			oppLines.addAll(newOppLines.clone());

			List<Contact> contacts = (List<Contact>) invocation.getArgument(2);
			return contacts;
		}
	}


	@isTest
	static void test_counters()
	{
		List<Opportunity> mockOpportunities = new List<Opportunity>
		{
			new Opportunity(Description ='one'),
			new Opportunity(Description ='two'),
			new Opportunity(Description ='tree')
		};

		IOpportunitiesSelector1 mockOpportunitiesSelector = (IOpportunitiesSelector1)MY_MOCKS.mock(OpportunitiesSelector1.class);
		MY_MOCKS.startStubbing();
		MY_MOCKS.when(mockOpportunitiesSelector.selectById(new Set<Id>())).thenReturn(mockOpportunities);
		MY_MOCKS.stopStubbing();
		OpportunitiesSelector1.setImpl(mockOpportunitiesSelector);

		Fflib_ISObjectUnitOfWork mockUoW = (Fflib_ISObjectUnitOfWork)MY_MOCKS.mock(fflib_SObjectUnitOfWork.class);
		ApexMocksExamples.unitOfWorkFactory.setMock(mockUoW);

		ApexMocksExamples.counters(new Set<Id>());

		((Fflib_ISObjectUnitOfWork) MY_MOCKS.verify(mockUoW,
			MY_MOCKS.description('verifying with the single opportunity'))).
				registerDirty(mockOpportunities[0]);
		((Fflib_ISObjectUnitOfWork) MY_MOCKS.verify(mockUoW,
			MY_MOCKS.description('verifying with the single opportunity'))).
				registerDirty(mockOpportunities[1]);
		((Fflib_ISObjectUnitOfWork) MY_MOCKS.verify(mockUoW,
			MY_MOCKS.description('verifying with the single opportunity'))).
				registerDirty(mockOpportunities[2]);


		((Fflib_ISObjectUnitOfWork) MY_MOCKS.verify(mockUoW,
			MY_MOCKS.times(3).description('verifying with all the opportunities  altogether'))).
				registerDirty((Opportunity) fflib_Match.anySobject());


		((Fflib_ISObjectUnitOfWork) MY_MOCKS.verify(mockUoW,
			MY_MOCKS.atLeast(2).description('verifying with the atLeast option'))).
				registerDirty((Opportunity) fflib_Match.anySobject());


		((Fflib_ISObjectUnitOfWork) MY_MOCKS.verify(mockUoW,
			MY_MOCKS.atMost(4).description('verifying with the atMost option'))).
				registerDirty((Opportunity) fflib_Match.anySobject());


		((Fflib_ISObjectUnitOfWork) MY_MOCKS.verify(mockUoW,
			MY_MOCKS.between(2, 4).description('verifying with the between option'))).
				registerDirty((Opportunity) fflib_Match.anySobject());


		((Fflib_ISObjectUnitOfWork) MY_MOCKS.verify(mockUoW,
			MY_MOCKS.never().description('verifying with the never'))).commitWork();
	}


	private class MockContactService implements ContactsService.API
	{
		private Fflib_ApexMocks mocks;

		public MockContactService(Fflib_ApexMocks mocks)
		{
			this.mocks = mocks;
		}

		public List<Contact> doStuff(Set<Id> cotactsIds, List<OpportunityLineItem> oppLines, List<Contact> contacts)
		{
			return (List<Contact>) mocks.mockNonVoidMethod(
				this,
				'doStuff',
				new List<Type>
				{
					System.Type.forName('Set<Id>'), System.Type.forName('List<OpportunityLineItem>'), System.Type.forName('List<Contact>')
				},
				new List<Object>
				{
					cotactsIds, oppLines, contacts
				});
		}
	}
}