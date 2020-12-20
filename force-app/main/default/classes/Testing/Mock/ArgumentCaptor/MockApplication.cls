public with sharing class MockApplication {
  public static final fflib_Application.ServiceFactory Service = new fflib_Application.ServiceFactory(new Map<Type, Type>{ ICustomerService.class => CustomerService.class, IDuplicateAccountService.class => DuplicateAccountService.class });
}
