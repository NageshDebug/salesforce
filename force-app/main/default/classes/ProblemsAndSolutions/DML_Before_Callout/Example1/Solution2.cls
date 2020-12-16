public with sharing class Solution2 {
  public static final fflib_Application.UnitOfWorkFactory UnitOfWork = new fflib_Application.UnitOfWorkFactory(new List<SObjectType>{ Account.SObjectType });

  public static void dmlBeforeCallout() {
    fflib_ISObjectUnitOfWork uow = UnitOfWork.newInstance();

    Account acct = new Account(Name = 'Nagesh');
    uow.registerNew(acct);

    String sfdcURL = URL.getSalesforceBaseUrl().toExternalForm();
    string endpoint = sfdcURL + '/services/data/v49.0/sobjects/Account/0014x000003CudFAAS';

    HttpRequest req = new HttpRequest();
    req.setEndpoint(endpoint);
    req.setMethod('GET');
    req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
    req.setHeader('Content-Type', 'application/json');
    req.setTimeout(120000);

    HttpResponse res = new Http().send(req);
    uow.commitWork();
    system.debug(res);
  }
}