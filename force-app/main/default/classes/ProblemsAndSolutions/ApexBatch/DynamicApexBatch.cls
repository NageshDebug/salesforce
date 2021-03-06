global with sharing class DynamicApexBatch implements Database.Batchable<sObject>, Database.stateful {
  /* String qry = 'SELECT  Status__c  FROM  XYZ';
String field = 'Status';
String val ='Active';

Database.executeBatch(new DynamicApexBatch(qry,field,val),200);*/

  global final String query;
  global final String field;
  global String value;
  global String operation;

  public UpdateObjectBatchClass(String qry, String f, Sting val, String operation) {
    query = qry;
    field = f;
    value = val;
    operation=operation;
  }

  public Database.QueryLocator start(Database.BatchableContext BC) {
    return Database.getQueryLocator(Query);
  }

  public void execute(Database.BatchableContext BC, List<sobject> scope) {
    for (sObject src : scope) {
      src.put(field, value);
    }
    if('CREATE'.equalsIgnorecase(operation)){
        INSERT scope;
    }
    if('UPDATE'.equalsIgnorecase(operation)){
        update scope;
    }
    if('DELETE'.equalsIgnorecase(operation)){
        delete scope;
    }    
  }

  public void finish(Database.BatchableContext BC) {
  }
}
