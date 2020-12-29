public class UserAgeValidationReceiver implements IReceiver {
  public void Handle(object request) {
    UserRegistrationRequest userRegistrationRequest = (UserRegistrationRequest) request;

    if (userRegistrationRequest.age < 18) {
      throw new ApplicationException('age validation failed');
    }
  }
}
