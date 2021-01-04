public class UserAgeValidationHandler extends Handler {
  public override void Handle(object request) {
    UserRegistrationRequest userRegistrationRequest = (UserRegistrationRequest) request;

    if (userRegistrationRequest.age < 18) {
      throw new ApplicationException('age validation failed');
    }

    //invoke the base class if we are still valid to go to the next check
    super.Handle(request);
  }
}