@isTest
public class RequestSenderTest {
  @isTest
  static void getGooglePageWithServiceLocatorTest() {
    ServiceLocator.setMock(RequestSender.class, FakeRequestSender.class);
    String body = RequestSender.getInstance().getGooglePage();
    System.assertEquals('GOOGLE', body);
  }

  public class FakeRequestSender extends RequestSender {
    public override HttpResponse sendRequest(HttpRequest request) {
      HttpResponse response = new HttpResponse();
      response.setStatusCode(200);
      response.setBody('GOOGLE');
      return response;
    }
  }
}