public with sharing class Solution1 {
  public static void dmlBeforeCallout() {
    String sfdcURL = URL.getSalesforceBaseUrl().toExternalForm();
    String endpoint = sfdcURL + '/services/data/v49.0/sobjects/Account/';

    String payload = '{"Name":"Nagesh"}';
    HttpRequest req = new HttpRequest();
    req.setEndpoint(endpoint);
    req.setMethod('POST');
    req.setBody(payload);
    req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
    req.setHeader('Content-Type', 'application/json');
    req.setTimeout(120000);

    HttpResponse res = new Http().send(req);
    if (res != null && res.getStatusCode() == 201) {
      Map<String, Object> accountDetails = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
      String accountId = (String)accountDetails.get('id');
    
      req = new HttpRequest();
      req.setEndpoint(endpoint + accountId);
      req.setMethod('GET');
      req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
      req.setHeader('Content-Type', 'application/json');
      req.setTimeout(120000);

      res = new Http().send(req);

      system.debug(res);
    }
  }
}