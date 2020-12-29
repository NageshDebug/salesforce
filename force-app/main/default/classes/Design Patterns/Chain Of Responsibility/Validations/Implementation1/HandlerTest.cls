@isTest
public with sharing class HandlerTest {
  @isTest
  public static void test() {
    UserRegistrationRequest userRegistrationRequest = new UserRegistrationRequest();
    userRegistrationRequest.email = 'notvalid';
    userRegistrationRequest.age = 25;
    userRegistrationRequest.isoLocationCode = 'GB';

    //will return false
    system.debug(UserRegistrationValidationSender.IsValid(userRegistrationRequest));

    userRegistrationRequest.email = 'someone@live.co.uk';
    userRegistrationRequest.age = 25;
    userRegistrationRequest.isoLocationCode = 'GB';

    //will return true
    system.debug(UserRegistrationValidationSender.IsValid(userRegistrationRequest));
  }
}
