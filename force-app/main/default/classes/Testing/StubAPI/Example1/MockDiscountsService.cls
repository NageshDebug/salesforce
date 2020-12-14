@isTest
global class MockDiscountsService implements StubProvider {
  Integer amount;

  public MockDiscountsService(Integer amount) {
    this.amount = amount;
  }

  global Object handleMethodCall(Object stubbedObject, String stubbedMethodName, System.Type returnType, List<System.Type> listOfParamTypes, List<String> listOfParamNames, List<Object> listOfArgs) {
    if (stubbedMethodName == 'getDiscount') {
      Decimal discount = 0;

      if (amount >= 10 && amount < 20)
        discount = 10;
      if (amount >= 20 && amount < 50)
        discount = 20;
      if (amount >= 50)
        discount = 30;

      return discount;
    }

    return null;
  }
}
