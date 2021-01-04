@isTest
public with sharing class ReceiverTest {
  @isTest
  public static void test() {
    UserRegistrationRequest userRegistrationRequest = new UserRegistrationRequest();
    userRegistrationRequest.email = 'andakscnalsnc';
    userRegistrationRequest.age = 25;
    userRegistrationRequest.isoLocationCode = 'GB';

    //will return false
    system.debug(UserRegistrationValidationReceiver.IsValidUsingReceivers(userRegistrationRequest));

    userRegistrationRequest.email = 'someone@live.co.uk';
    userRegistrationRequest.age = 36;
    userRegistrationRequest.isoLocationCode = 'GB';

    //will return true
    system.debug(UserRegistrationValidationReceiver.IsValidUsingReceivers(userRegistrationRequest));
  }
}