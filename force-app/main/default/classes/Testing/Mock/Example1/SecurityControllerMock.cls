@istest
private class SecurityControllerMock {
  @isTest
  private static void isUserHasAccessTest() {
    // Given
    String userName = 'Nagesh';
    fflib_ApexMocks mocks = new fflib_ApexMocks();
    SecurityService securityHandlerMock = (SecurityService) mocks.mock(SecurityServiceImpl.class);

    mocks.startStubbing();
    mocks.when(securityHandlerMock.isCurrentUserAllowedToEnter(userName)).thenReturn(true);
    mocks.stopStubbing();

    // When
    SecurityController standardHouse = new SecurityController(securityHandlerMock);
    Boolean isUserHasAccess = standardHouse.isUserHasAccess(userName);

    // Then
    System.assert(isUserHasAccess);
    ((SecurityService) mocks.verify(securityHandlerMock, 1)).isCurrentUserAllowedToEnter(userName);
  }
}
