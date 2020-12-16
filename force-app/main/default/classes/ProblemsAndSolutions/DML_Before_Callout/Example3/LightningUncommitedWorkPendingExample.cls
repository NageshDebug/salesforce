public with sharing class LightningUncommitedWorkPendingExample {
  /*
       @Description when this method is called from Lightning it will cause the uncommited work pending to surface
       The error is thrown because we perform dml prior to making the http callout
    */
  @AuraEnabled
  public static String throwUncommitedError() {
    //Perform some DML
    Account acc = [SELECT Id, Name FROM Account LIMIT 1];
    acc.Name = 'BooBoo';
    acc.Account_ExtId__c = 'Test123';
    update acc;

    //Now make a HTTP callout, this will result in the error being thrown
    Http http = new Http();

    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://jsonplaceholder.typicode.com/posts');
    request.setMethod('GET');

    HttpResponse response = http.send(request);

    if (response.getStatusCode() == 200) {
      response = http.send(request);
      return response.getBody();
    }
    return null;
  }

  /**
   * @description You can see below that we have split the original method into two methods,
   * these can be safely called one at a time via Lightning. You just need to chain them together
   */
  @AuraEnabled
  public static Boolean performDML() {
    try {
      Account acc = [SELECT Id, Name FROM Account LIMIT 1];
      acc.Name = 'BooBoo';
      acc.Account_ExtId__c = 'Test1234';
      update acc;
      return true;
    } catch (Exception e) {
      return false;
    }
  }

  @AuraEnabled
  public static String performHttpCallout() {
    Http http = new Http();

    HttpRequest request = new HttpRequest();
    /*
           https://jsonplaceholder.typicode.com has loads of sample json callouts
           Don't forget to add it to your remote site settings
        */
    request.setEndpoint('https://jsonplaceholder.typicode.com/posts');
    request.setMethod('GET');

    HttpResponse response = http.send(request);

    if (response.getStatusCode() == 200) {
      response = http.send(request);
      return response.getBody();
    }
    return null;
  }
}