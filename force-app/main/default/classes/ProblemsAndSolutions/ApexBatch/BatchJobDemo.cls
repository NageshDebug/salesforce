global class BatchJobDemo implements Database.Batchable<SObject> {
  global String query;
  global String queryString;
  global String objectName;
  global String status;
  global BatchJobDemo(string queryString, string objectName, string status) {
    this.queryString = queryString;
    this.objectName = objectName;
    this.status = status;
  }

  global BatchJobDemo() {
  }

  global Database.QueryLocator start(Database.BatchableContext BC) {
    return Database.getQueryLocator(query);
  }

  global void execute(Database.BatchableContext BC, List<sobject> scope) {
    system.debug(query + '__' + queryString);
    String sObjectType = '';

    if (scope.size() > 0) {
      if (scope[0] != null) {
        sObjectType = String.valueOf(scope[0].getSObjectType()); // Getting Object type
      }
      if (sObjectType != '' && sObjectType == 'Case') {
        // do something
      } else {
        //do something
      }
    }
  }

  global void finish(Database.BatchableContext BC) {
    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();

    Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
    message.setSubject('Batch execution has been completed');
    message.setPlainTextBody('Batch..');
    String currentuser = UserInfo.getUserId();
    String[] emailRecipients = new List<String>{ 'info@tech-works.in' };
    emailRecipients.add(currentuser);
    message.setToAddresses(emailRecipients);
    mails.add(message);
    Messaging.sendEmail(mails);
  }
}