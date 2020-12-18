@isTest
public with sharing class ControllerMockGeneratorTest {
  @isTest
  public static void testCreateProductLineitems() {
    // create mocks instance using ApexMocks framework
    fflib_ApexMocks mocks = new fflib_ApexMocks();

    // use the generic interface to instantiate service mock
    SecurityService securityService = new Mocks.SecurityServiceMockImpl(mocks);

    // use the generic interface to instantiate repository mock
    OpportunityRepository oppRepository = new Mocks.OpportunityRepositoryMockImpl(mocks);

    String userName = 'Nagesh';
    List<OpportunityLineItem> oppLineItems = new List<OpportunityLineItem>();
    for (Integer index = 0; index < 1; index++) {
      Id oppId = fflib_IDGenerator.generate(Opportunity.SObjectType);
      Id pricebookId = fflib_IDGenerator.generate(PriceBookEntry.SObjectType);
      Id lineitemId = fflib_IDGenerator.generate(OpportunityLineItem.SObjectType);
      oppLineItems.add(new OpportunityLineItem(Id = lineitemId, OpportunityId = oppId, PricebookEntryId = pricebookId, UnitPrice = 6900, Quantity = 100));
    }

    mocks.startStubbing();
    mocks.when(securityService.isCurrentUserAllowedToUpdate(userName)).thenReturn(true);
    mocks.when(oppRepository.insertOpportunityLineitem(oppLineItems)).thenReturn(true);
    mocks.stopStubbing();

    // When
    SecurityController controller = new SecurityController(securityService, oppRepository);
    Boolean isUserUpdated = controller.isCurrentUserAllowedToUpdate(userName, oppLineItems);

    // Then
    System.assert(isUserUpdated, 'OpportunityLineItem should be updated.');
    ((SecurityService) mocks.verify(securityService, 1)).isCurrentUserAllowedToUpdate(userName);
  }
}
