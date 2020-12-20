public with sharing class CreateCustomerController {
  public String accountName { get; set; }

  public PageReference createCustomer() {
    CustomerService.newInstance().createCustomer(accountName);
    return null;
  }
}