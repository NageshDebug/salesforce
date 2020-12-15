public with sharing class NestedCallouts {
  public static NestedCallouts.Response createPostAndGetPost() {
    NestedCallouts.Request req = new NestedCallouts.Request('Nagesh', 'Siripurapu', 100);
    String jsonRequest = JSON.serialize(req);

    Http http = new Http();

    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://jsonplaceholder.typicode.com/posts');
    request.setMethod('POST');
    request.setHeader('Content-type', 'application/json; charset=UTF-8');
    request.setBody(jsonRequest);

    HttpResponse response = http.send(request);
    NestedCallouts.Response res;
    if (response.getStatusCode() == 201) {
      res = (NestedCallouts.Response) JSON.deserialize(response.getBody(), NestedCallouts.Response.class);

      //Hardcoded this value for testing purpose
      res.Id = 5;

      request = new HttpRequest();
      request.setEndpoint('https://jsonplaceholder.typicode.com/posts/' + res.id);
      request.setMethod('GET');
      response = http.send(request);

      if (response.getStatusCode() == 200) {
        res = (NestedCallouts.Response) JSON.deserialize(response.getBody(), NestedCallouts.Response.class);
      }
    }
    return res;
  }
  public class Request {
    public String title;
    public String body;
    public Integer userId;

    Request(String title, String body, Integer userId) {
      this.title = title;
      this.body = body;
      this.userId = userId;
    }
  }
  public class Response {
    public Integer id;
    public Integer userId;
    public String body;
    public String title;
  }
}
