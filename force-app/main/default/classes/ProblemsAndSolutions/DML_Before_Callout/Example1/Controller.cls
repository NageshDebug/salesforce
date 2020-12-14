public with sharing class Controller {
  public static void dmlBeforeCallout() {
    Account acct = new Account(Name = 'Nagesh');
    insert acct;

    String sfdcURL = URL.getSalesforceBaseUrl().toExternalForm();
    string endpoint = sfdcURL+'/services/data/v49.0/sobjects/Account/0014x000003CudFAAS';


    HttpRequest req = new HttpRequest();
    req.setEndpoint(endpoint);
    req.setMethod('GET');
    req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
    req.setHeader('Content-Type', 'application/json');
    req.setTimeout(120000);

    HttpResponse res = new Http().send(req);

    system.debug(res);

    /***
    
    05:37:41.109 (284126318)|EXCEPTION_THROWN|[17]|System.CalloutException: You have uncommitted work pending. Please commit or rollback before calling out
    05:37:41.109 (284504418)|FATAL_ERROR|System.CalloutException: You have uncommitted work pending. Please commit or rollback before calling out

    
     */
  }
}
