public with sharing class Realtime_MixedDMLError_Future {
  @future
  public static void createUser(String contactId, String email, String firstName, String lastName, String userName, String profileId) {
    Database.DMLOptions dmo = new Database.DMLOptions();
    dmo.EmailHeader.triggerUserEmail = true;
    User u = new User(alias = 'standt', email = email, emailencodingkey = 'UTF-8', lastname = lastname, languagelocalekey = 'en_US', localesidkey = 'en_US', profileid = profileId, timezonesidkey = 'America/Los_Angeles', username = username);

    u.setOptions(dmo);
    insert u;

    /**
    Nested Future calls not allowed. (Or) Future calls can't be chained
    First error: Future method cannot be called from a future or batch method: Realtime_MixedDMLError_NestedFuture.insertUserWithRole(String)	
  */
    //Realtime_MixedDMLError_NestedFuture.insertUserWithRole(u.id);

    //we can't call future method inside future method as above. So, i'm using Queuable Job
    ID jobID = System.enqueueJob(new AsyncExecutionExample(u));

    //Best practice: Covert this class into Queuable to avoid @future limitations.

    //Another approach is to use same logic in a batch class to overcome.

    /**
     Notes:         APEX BATCH Vs  QUEUABLE
    ---------------------------------------------------------------------------------------------------------------------------------------------------------------
      Running a batch, or multiple batches every hour could cause lock contention errors for users trying to update records during the batch runs.
     

      Know your limits! There are a lot of considerations when using batch apex. You can only have 5 concurrent scheduled batch jobs running at a time and 
      only 100 jobs in the flex queue. There is also a daily limit on number of batch apex execute methods per day that varies based on your user count. 
      
      
      A lot of developers flock to batch apex because it is very useful to get around so many limitations that you will hit when trying to run logic within a single transaction, 
      but there is no silver bullet in apex. It is always important to read through the considerations before using a new tool.
      
      
      Running a batch job could be better in a use-case where near real time is less important and the queueable logic may be invoked per every record in 
      scenarios that would mean full batches of 200 or more records at a time. 
      
      
      You can only add up to 50 queueable jobs to the queue in a given transaction, so if you find yourself using queueable from a trigger that may run 
      more than 50 times in a single transaction, you may want to go with a scheduled job instead. 
      Just 1 queueable job in a trigger will lower the number of records one can include per batch that will meet the criteria to enqueue said job to be 50 or 
      less before hitting an error.
    
     */
  }
}