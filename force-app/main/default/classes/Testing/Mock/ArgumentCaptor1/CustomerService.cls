public with sharing class CustomerService implements ICustomerService {
  public static ICustomerService newInstance() {
    return (ICustomerService) MockApplication.service.newInstance(ICustomerService.class);
  }

  public void createCustomer(String name) {
    Account account = new Account(Name = name);
    DuplicateAccountService.Request request = new DuplicateAccountService.Request();
    request.name = account.Name;

    Boolean isDuplicate = DuplicateAccountService.newInstance().alreadyExists(request);
    if (!isDuplicate) {
      insert account;
    }
  }
}