@isTest
private class SecurityControllerTest {
  @isTest
  private static void isUserHasAccessTest() {
    // Given
    String loggedinUser = 'Nagesh';

    SecurityService securityHandler = new SecurityServiceImpl();
    // When
    SecurityController controller = new SecurityController(securityHandler);
    Boolean isUserHasAccess = controller.isUserHasAccess(loggedinUser);
    // Then
    System.assert(isUserHasAccess);
  }
}