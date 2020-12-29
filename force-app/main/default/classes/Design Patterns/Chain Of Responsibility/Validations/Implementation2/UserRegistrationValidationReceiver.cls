public with sharing class UserRegistrationValidationReceiver {
    public static boolean IsValidUsingReceivers (UserRegistrationRequest userRegistrationRequest){
      try {
          list <IReceiver> receivers = new List<IReceiver> {
              new UserEmailValidationReceiver(),
              new UserAgeValidationReceiver(),
              new UserLocationValidationReceiver()
          };
                   
          ValidationHandler handler = new ValidationHandler(receivers);
           
          handler.Handle(userRegistrationRequest);
           
      } catch  (ApplicationException ex) {
          system.debug(ex);
          return false;
      }
      return true; 
  }  
}
