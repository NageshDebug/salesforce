@isTest
public with sharing class MultipleCalloutMock implements HttpCalloutMock {
  public class CustomCalloutException extends Exception {}

  Map<String, HttpCalloutMock> requests;

  public MultipleCalloutMock(Map<String, HttpCalloutMock> requests) {
    this.requests = requests;
  }

  public HTTPResponse respond(HTTPRequest req) {
    HttpCalloutMock mock = requests.get(req.getEndpoint());
    if (mock != null) {
      return mock.respond(req);
    } else {
      throw new CustomCalloutException('HTTP callout not supported for test methods');
    }
  }

  public void addRequestMock(String url, HttpCalloutMock mock) {
    requests.put(url, mock);
  }
}
