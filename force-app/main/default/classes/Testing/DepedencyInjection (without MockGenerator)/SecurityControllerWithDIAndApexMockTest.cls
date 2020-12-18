@isTest
public with sharing class SecurityControllerWithDIAndApexMockTest {
  @isTest
  private static void openDoor_userHasAccess_doorOpen() {
    // Given
    fflib_ApexMocks mocks = new fflib_ApexMocks();
    SecurityService securityServiceMock = (SecurityService) mocks.mock(SecurityService.class);
    OpportunityRepository opportunityRepositoryMock = (OpportunityRepository) mocks.mock(OpportunityRepository.class);

    String userName = 'Nagesh';
    List<OpportunityLineItem> oppLineItems = new List<OpportunityLineItem>();
    for (Integer index = 0; index < 1; index++) {
      Id oppId = fflib_IDGenerator.generate(Opportunity.SObjectType);
      Id pricebookId = fflib_IDGenerator.generate(PriceBookEntry.SObjectType);
      Id lineitemId = fflib_IDGenerator.generate(OpportunityLineItem.SObjectType);
      oppLineItems.add(new OpportunityLineItem(Id = lineitemId, OpportunityId = oppId, PricebookEntryId = pricebookId, UnitPrice = 6900, Quantity = 100));
    }

    mocks.startStubbing();
    mocks.when(securityServiceMock.isCurrentUserAllowedToUpdate(userName)).thenReturn(true);
    mocks.when(opportunityRepositoryMock.insertOpportunityLineitem(oppLineItems)).thenReturn(true);
    mocks.stopStubbing();

    // When
    SecurityController controller = new SecurityController(securityServiceMock, opportunityRepositoryMock);
    Boolean isUserUpdated = controller.isCurrentUserAllowedToUpdate(userName, oppLineItems);

    // Then
    System.assert(isUserUpdated, 'OpportunityLineItem should be updated.');
    ((SecurityService) mocks.verify(securityServiceMock, 1)).isCurrentUserAllowedToUpdate(userName);
  }
}