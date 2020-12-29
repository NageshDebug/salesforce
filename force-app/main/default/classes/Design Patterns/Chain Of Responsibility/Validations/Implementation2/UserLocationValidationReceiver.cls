public class UserLocationValidationReceiver implements IReceiver {
     
    public void Handle(object request) {
        
        UserRegistrationRequest userRegistrationRequest = (UserRegistrationRequest)request;
         
        if (userRegistrationRequest.isoLocationCode != 'GB' ) {
            throw new ApplicationException('location validation failed');
        }
    }
}