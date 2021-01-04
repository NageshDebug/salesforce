/**
    Create generic schedulable class to run multiple batch job in salesforce
    ------------------------------------------------------------------------
    Issue-1: Many times we are comes in a scenario were we need to schedule a batch job. And to schedule each batch we are creating a separate schedulable class, 
    that makes code redundant and time consuming.  

    Issue-2: We need to stop and reschedule the batch job if anything to modify in the batch job.
             
    Issue-3: Deployments activities will be failed, if there is any related jobs running during the deployment.
             
    Note: Through UI settings we can do the options (2&3). but it is not good to stop the batch completely and restart the batch job.

    With respect to the above problem i have created a generic schedulable class to schedule n number of batch jobs.

    
    How to run this Schedular
    ----------------------------
        String caseStatus='open';
        String query = 'SELECT Id FROM Case WHERE Status= '+caseStatus+'';
        GenericBatchJobScheduler scheduler = new GenericBatchJobScheduler('BatchJobDemo', 100,query);
        String scheduleTime = '0 30 1 * * ?'; // 1 am 30 mins
        system.schedule('Case Batch', scheduleTime, scheduler);
        
        
        String stagename='Prospecting';
        String query = 'SELECT id,name,amount FROM Opportunity WHERE stagename = '+stagename+'';
        GenericBatchJobScheduler scheduler = new GenericBatchJobScheduler('BatchJobDemo', 100,query);
        String scheduleTime = '0 20 11 * * ?'; // 11 am 20 mins
        system.schedule('Opty Batch', scheduleTime, scheduler);


        Schedule the above batch one by one and track the status in the Scheduled jobs menu under setup.
 */
public with sharing class GenericBatchJobScheduler implements Schedulable {
  public String CLASSNAME;
  public Integer BATCHSIZE;
  public String QUERY;
  public GenericBatchJobScheduler(String batchClassName, Integer count, String query) {
    CLASSNAME = batchClassName;
    BATCHSIZE = count;
    QUERY = query;
  }
  public void execute(SchedulableContext sc) {
    String param = '{"query": "' + QUERY + '"}';
    Database.Batchable<SObject> batchObj = (Database.Batchable<SObject>) JSON.deserialize(param, Type.forName(CLASSNAME));
    Database.executeBatch(batchObj, BATCHSIZE);
  }
}