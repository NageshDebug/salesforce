public with sharing class DuplicateAccountService implements IDuplicateAccountService {
  public static IDuplicateAccountService newInstance() {
    return (IDuplicateAccountService) MockApplication.service.newInstance(IDuplicateAccountService.class);
  }

  public Boolean alreadyExists(DuplicateAccountService.Request request) {
    Boolean isDuplicate = false;

    // Callout logic goes here...

    return isDuplicate;
  }

  public class Request {
    public String name;
  }
}