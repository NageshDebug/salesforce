@isTest
private class NextgenControllerTest {
  @isTest
  private static void mock_non_void_method() {
    String nextgenId = '5';
    String exceptionMessage = 'Get Operation Failed';
    fflib_ApexMocks mocks = new fflib_ApexMocks();
    NextgenService mockService = (NextgenService) mocks.mock(NextgenServiceImpl.class);

    mocks.startStubbing();
    mocks.when(mockService.getNextgenDetailsById(nextgenId)).thenThrow(new NoDataFoundException(exceptionMessage));
    mocks.stopStubbing();

    Test.startTest();
    try {
      NextgenController controller = new NextgenController(mockService);
      NextgenWrapper nextgenDetails = controller.getNextgenDetailsById(nextgenId);
    } catch (Exception exp) {
      System.assertEquals(true, exp instanceof NoDataFoundException);
      System.assertEquals(exceptionMessage, exp.getMessage());
    }
    Test.stopTest();

    ((NextgenService) mocks.verify(mockService, 1)).getNextgenDetailsById(nextgenId);
  }

  @isTest
  private static void mock_non_void_method_1() {
    String nextgenId = '5';
    String exceptionMessage = 'Get Operation Failed';
    fflib_ApexMocks mocks = new fflib_ApexMocks();
    NextgenService mockService = (NextgenService) mocks.mock(NextgenServiceImpl.class);

    mocks.startStubbing();
    mocks.when(mockService.getNextgenDetailsById(nextgenId)).thenAnswer(new NextgenControllerTest.ExceptionForAnswer(exceptionMessage));
    mocks.stopStubbing();

    Test.startTest();
    try {
      NextgenController controller = new NextgenController(mockService);
      NextgenWrapper nextgenDetails = controller.getNextgenDetailsById(nextgenId);
    } catch (Exception exp) {
      System.assertEquals(true, exp instanceof fflib_ApexMocks.ApexMocksException);
      System.assertEquals(exceptionMessage, exp.getMessage());
    }
    Test.stopTest();

    ((NextgenService) mocks.verify(mockService, 1)).getNextgenDetailsById(nextgenId);
  }

  @isTest
  private static void mock_void_method() {
    NextgenWrapper wrapper = new NextgenWrapper();
    wrapper.Id = '5';
    wrapper.name = 'PA-10001';
    wrapper.isApproved = true;

    String exceptionMessage = 'Save Operation Failed';

    fflib_ApexMocks mocks = new fflib_ApexMocks();
    NextgenService mockService = (NextgenService) mocks.mock(NextgenServiceImpl.class);

    mocks.startStubbing();
    ((NextgenService) mocks.doThrowWhen(new NoDataFoundException(exceptionMessage), mockService)).saveNextgenRecord(wrapper);
    mocks.stopStubbing();

    Test.startTest();
    try {
      NextgenController controller = new NextgenController(mockService);
      controller.saveNextgenRecord(wrapper);
    } catch (Exception exp) {
      System.assertEquals(true, exp instanceof NoDataFoundException);
      System.assertEquals(exceptionMessage, exp.getMessage());
    }
    Test.stopTest();

    ((NextgenService) mocks.verify(mockService, 1)).saveNextgenRecord(wrapper);
  }

  @isTest
  private static void mock_void_method_1() {
    NextgenWrapper wrapper = new NextgenWrapper();
    wrapper.Id = '5';
    wrapper.name = 'PA-10001';
    wrapper.isApproved = true;

    String exceptionMessage = 'Save Operation Failed';

    fflib_ApexMocks mocks = new fflib_ApexMocks();
    NextgenService mockService = (NextgenService) mocks.mock(NextgenServiceImpl.class);

    mocks.startStubbing();
    ((NextgenService) mocks.doAnswer(new ExceptionForAnswer(exceptionMessage), mockService)).saveNextgenRecord(wrapper);
    mocks.stopStubbing();

    Test.startTest();
    try {
      NextgenController controller = new NextgenController(mockService);
      controller.saveNextgenRecord(wrapper);
    } catch (Exception exp) {
      System.assertEquals(true, exp instanceof fflib_ApexMocks.ApexMocksException);
      System.assertEquals(exceptionMessage, exp.getMessage());
    }
    Test.stopTest();

    ((NextgenService) mocks.verify(mockService, 1)).saveNextgenRecord(wrapper);
  }

  public class ExceptionForAnswer implements fflib_Answer {
    String exceptionMessage;
    ExceptionForAnswer(String exceptionMessage) {
      this.exceptionMessage = exceptionMessage;
    }
    public Object answer(fflib_InvocationOnMock invocation) {
      throw new fflib_ApexMocks.ApexMocksException(this.exceptionMessage);
    }
  }
}