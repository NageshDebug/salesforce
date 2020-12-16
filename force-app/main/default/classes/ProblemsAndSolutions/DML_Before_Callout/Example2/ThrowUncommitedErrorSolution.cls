public with sharing class ThrowUncommitedErrorSolution {
  public static void getPostsResolveError() {
    Http http = new Http();

    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://jsonplaceholder.typicode.com/posts');
    request.setMethod('GET');

    HttpResponse response = http.send(request);

    if (response.getStatusCode() == 200) {
      //The first callout was successful, now perform dml before the next callout
      Account a = [SELECT Id, Name FROM Account LIMIT 1];
      //Here you could be storing information from the callout on the Account, I'll just hard-code a string for simplicity
      a.Name = 'Some update';
      a.Account_ExtId__c='TEST1234567';
      //DO NOT UPDATE HERE

      //Now let's make a second callout, this will throw the uncommited error
      response = http.send(request);
      System.debug(response);

      //UPDATE HERE, after all callouts are completed
      update a;
    }
  }
}