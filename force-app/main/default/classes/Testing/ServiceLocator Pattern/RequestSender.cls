public virtual class RequestSender {
  public static RequestSender getInstance() {
    return (RequestSender) ServiceLocator.getInstance(RequestSender.class);
  }

  public virtual HttpResponse sendRequest(HttpRequest request) {
    Http sender = new Http();
    return sender.send(request);
  }

  public String getGooglePage() {
    HttpRequest request = new HttpRequest();
    request.setMethod('GET');
    request.setEndpoint('https://www.google.com/');
    HttpResponse response = sendRequest(request);
    if (response.getStatusCode() == 200) {
      return response.getBody();
    }
    return null;
  }
}