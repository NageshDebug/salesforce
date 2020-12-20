@isTest
public with sharing class CreateCustomerControllerTest {
  @isTest
  public static void shouldCallDuplicateAccountServiceWithCorrectRequest() {
    // Given
    String customerName = 'Nagesh';
    fflib_ApexMocks mocks = new fflib_ApexMocks();
    IDuplicateAccountService serviceMock = (IDuplicateAccountService) mocks.mock(DuplicateAccountService.class);

    MockApplication.service.setMock(IDuplicateAccountService.class, serviceMock);

    // When
    mocks.startStubbing();
    mocks.when(serviceMock.alreadyExists((DuplicateAccountService.Request)fflib_Match.anyObject())).thenReturn(true);
    mocks.stopStubbing();
    
    CustomerService.newInstance().createCustomer(customerName);
    

    // Then
    fflib_ArgumentCaptor argument = fflib_ArgumentCaptor.forClass(DuplicateAccountService.Request.class);
    ((IDuplicateAccountService) mocks.verify(serviceMock)).alreadyExists((DuplicateAccountService.Request) argument.capture());

    DuplicateAccountService.Request calloutRequest = (DuplicateAccountService.Request) argument.getValue();
    System.assertEquals(customerName, calloutRequest.name, 'Webservice was not provided the correct request information');
  }
}
