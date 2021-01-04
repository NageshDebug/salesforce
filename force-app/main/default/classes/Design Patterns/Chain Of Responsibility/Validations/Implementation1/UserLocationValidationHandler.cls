public class UserLocationValidationHandler extends Handler {
  public override void Handle(object request) {
    UserRegistrationRequest userRegistrationRequest = (UserRegistrationRequest) request;

    if (userRegistrationRequest.isoLocationCode != 'GB') {
      throw new ApplicationException('location validation failed');
    }

    //invoke the base class if we are still valid to go to the next check
    super.Handle(request);
  }
}