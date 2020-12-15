@isTest
private with sharing class NestedCalloutsTest {
  @isTest
  private static void testMultipleCallouts() {
    String postResponse = '{"userId":1001,"title":"MultipleCallout Mocking","body":"MultipleCallout Mocking and Testing"}';
    String getResponse = '{"Id":1,"userId":1001,"title":"MultipleCallout Mocking","body":"MultipleCallout Mocking and Testing"}';

    CalloutHandlerMock fakePostResponse = new CalloutHandlerMock(201, 'Success', postResponse, null);
    CalloutHandlerMock fakeGetResponse = new CalloutHandlerMock(200, 'Success', getResponse, null);

    String createPostUrl = 'https://jsonplaceholder.typicode.com/posts';
    String getpostUrl = 'https://jsonplaceholder.typicode.com/posts/5';

    Map<String, HttpCalloutMock> endpointsMap = new Map<String, HttpCalloutMock>();
    endpointsMap.put(createPostUrl, fakePostResponse);
    endpointsMap.put(getpostUrl, fakeGetResponse);

    MultipleCalloutMock multiCalloutMock = new MultipleCalloutMock(endpointsMap);

    Test.setMock(HttpCalloutMock.class, multiCalloutMock);

    Test.startTest();
    NestedCallouts.Response response = NestedCallouts.createPostAndGetPost();
    System.assertEquals(1, response.Id);
    System.assertEquals(1001, response.userId);
    System.assertEquals('MultipleCallout Mocking', response.title);
    System.assert(String.isNotBlank(response.body));
    Test.stopTest();
  }

  /**
    If we try to execute the callout without mocking from test class, it will throw this exection
     "Methods defined as TestMethod do not support Web service callouts"
   */
  @isTest
  private static void testMultipleCallouts1() {
    Test.startTest();
    NestedCallouts.Response response = NestedCallouts.createPostAndGetPost();
    System.assertEquals(1, response.Id);
    System.assertEquals(1001, response.userId);
    System.assertEquals('MultipleCallout Mocking', response.title);
    System.assert(String.isNotBlank(response.body));
    Test.stopTest();
  }
}
