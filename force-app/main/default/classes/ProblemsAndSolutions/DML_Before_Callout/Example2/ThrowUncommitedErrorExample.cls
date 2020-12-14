public class ThrowUncommitedErrorExample {
  /***

Salesforce uncommitted error example between two callouts
---------------------------------------------------------

 Another area this often arises in is when your system automatically created Trace Logs for callouts. 
 Make sure the trace logs get inserted when all Apex callouts are complete. 
 
 You can cache the trace logs for bulk insert if you have multiple Apex callouts. 
 Just generate a list of Trace logs and insert them when all processing is completed.
 */

  public static void getPosts() {
    Http http = new Http();

    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://jsonplaceholder.typicode.com/posts');
    request.setMethod('GET');

    HttpResponse response = http.send(request);

    if (response.getStatusCode() == 200) {
      //The first callout was successful, now perform dml before the next callout
      Account a = [SELECT Id, Name, Account_ExtId__c FROM Account WHERE Name LIKE '%Nagesh%' LIMIT 1];
      a.Name = 'Some update';
      a.Account_ExtId__c = 'TEST12345';
      update a;

      //Now let's make a second callout, this will throw the uncommited error
      response = http.send(request);
      System.debug(response);
    }
  }
}
