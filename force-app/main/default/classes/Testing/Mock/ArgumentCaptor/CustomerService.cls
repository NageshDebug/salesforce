public with sharing class CustomerService implements ICustomerService {
  public static ICustomerService newInstance() {
    return (ICustomerService) MockApplication.service.newInstance(ICustomerService.class);
  }

  public void createCustomer(String name) {
    Account account = new Account(Name = name);
    System.debug('00000000000000000000000000000000000000000000000000000000000000000000');
    DuplicateAccountService.Request request = new DuplicateAccountService.Request();
    request.name = account.Name;

    System.debug('111111111111111111111111111111111111111111111111111111111111111111111');
    Boolean isDuplicate = DuplicateAccountService.newInstance().alreadyExists(request);
    System.debug('222222222222222222222222222222222222222222222222222222222222222222222'+isDuplicate);
    if (!isDuplicate) {
      insert account;
    }
  }
}
