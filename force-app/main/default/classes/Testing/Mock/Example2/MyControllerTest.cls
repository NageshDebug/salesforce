@isTest
public class MyControllerTest {
  public static testMethod void testCalculateValues() {
    fflib_ApexMocks mocks = new fflib_ApexMocks();
    MyInterface mockMyService = (MyInterface) mocks.mock(MyService.class);

    mocks.startStubbing();
    mocks.when(mockMyService.calculateValues(5, 3)).thenReturn(8);
    mocks.stopStubbing();

    Test.startTest();
    MyController controller = new MyController(mockMyService);
    controller.valueOne = 5;
    controller.valueTwo = 3;
    Integer totalValue = controller.calculatedTotalValue();
    Test.stopTest();

    System.assertEquals(8, totalValue, 'The service should return 8');
  }
}
