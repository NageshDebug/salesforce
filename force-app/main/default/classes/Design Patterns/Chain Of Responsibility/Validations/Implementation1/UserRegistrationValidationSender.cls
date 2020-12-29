public class UserRegistrationValidationSender {
  public static boolean IsValid(UserRegistrationRequest userRegistrationRequest) {
    try {
      //create the first handler in the chain;
      Handler handler = new UserEmailValidationHandler();
      //then use SetNext to add the other validation handlers
      handler.SetNext(new UserAgeValidationHandler()).SetNext(new UserLocationValidationHandler());
      //then call the handle method
      handler.Handle(userRegistrationRequest);
    } catch (ApplicationException ex) {
      //added system debug to view the errors when trying this example
      system.debug(ex);
      return false;
    }

    return true;
  }
}
