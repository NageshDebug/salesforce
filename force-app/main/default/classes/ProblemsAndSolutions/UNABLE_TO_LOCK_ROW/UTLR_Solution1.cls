public with sharing class UTLR_Solution1 {
  /**    
    Avoid unable to lock row exception in salesforce
    --------------------------------------------------

    In Apex, you can use FOR UPDATE to lock sObject records while they’re being updated in order to prevent race conditions and other thread safety problems.
    
    Salesforce gives us the ability to lock records using the FOR UPDATE clause in Apex. 
    If you have ever received the UNABLE TO LOCK ROW or UNABLE TO OBTAIN EXCLUSIVE ACCESS OF THIS RECORD error then you may be able to use the SOQL FOR UPDATE keyword to solve your issues

    So what does the UNABLE TO LOCK ROW error really mean? 
    Essentially this means that two or more processes were trying to make updates to the same record at a given time. 
    When a record is being inserted/updated in Salesforce, related records are also locked. 
    
    Example-1:
    if an update is being executed on an opportunity record then the related Account record is also locked.

    Example-2:
    we might see the UNABLE TO LOCK ROW error thrown could be one user making an update to an account record while a background batch job is running on the 
    same record. In this scenario either the user or the batch job could receive the UNABLE TO LOCK ROW ERROR.

    While an sObject record is locked, no other client or user is allowed to make updates either through code or the Salesforce user interface.

    Account [] accts = [SELECT Id FROM Account LIMIT 2 FOR UPDATE];
    NOTE:- While the records are locked by a client, the locking client can modify their field values in the database in the same transaction. 
    
    Other clients have to wait until the transaction completes and the records are no longer locked before being able to update the same records. 
    
    Other clients can still query the same records while they’re locked.

    If you attempt to lock a record currently locked by another client, you will get a QueryException. Similarly, if you attempt to update a record currently 
    locked by another client, you will get a DmlException.

    If a client attempts to modify a locked record, the update operation might succeed if the lock gets released within a short amount of time after the update 
    call was made. In this case, it is possible that the updates will overwrite those made by the locking client if the second client obtained an old copy of 
    the record. To prevent this from happening, the second client must lock the record first. 
    
    The locking process returns a fresh copy of the record from the database through the SELECT statement. The second client can use this copy to make new updates.

    SOQL FOR Clause : What is it?
    --------------------------------
    The SOQL FOR update clause can be used in Apex to lock queried rows. 
    When we run a SOQL query we can add the FOR UPDATE clause, this means that all the records returned by the SOQL query will be locked for the running 
    Apex transaction. The Lock is released when the Apex transaction completes. 
    
    If another process tries to make updates to the locked records they will be blocked. The process that is blocked will wait for up to ten seconds for the 
    lock to be released after which the job will fail. If you run into a situation where you need your records to be locked for more than ten seconds you’ll 
    need to look at optimizing your job. If this is happening due to a long running batch job then you could try reducing your batch size.

    Here’s the syntax for using the FOR UPDATE clause. 
    List<Account> accounts = [SELECT Id FROM Account FOR UPDATE];

    When you run the above query in Apex the Account records will be locked to this transaction until the transaction is complete.

    SOQL FOR Clause : Considerations
    ------------------------------------
    1.ORDER BY cannot be used when using FOR UPDATE
    2.Record Locks received using the FOR UPDATE clause will lock the records queried but also related records like parent reconds
    3.If an Apex transaction uses the FOR UPDATE clause while querying records then the records queried can be updated by that Apex Transaction alone. 
      Only when the transaction completes can other processes make updates to the same records. All other processes will be blocked until the Apex transaction 
      holding the lock has completed execution
      In the scenario where an Apex transaction is currently is process which holds the FOR UPDATE lock on records and a second Apex Transaction tries to 
      obtain the lock, the second transactions SOQL query using the FOR UPDATE clause will wait for up to 10 seconds for the first transaction to complete. 
      If the first transaction does not compete in these 10 seconds then a QueryException will be thrown

      Similarly to the above scenario, a DmlException is thrown if the first transaction is performing DML while the second transaction is waiting for the lock 
      for over 10 seconds

      Record Locks are automatically released when an Apex transaction makes a HTTP callout

    UNABLE TO LOCK ROW - Bulk Api fixes
    ------------------------------------
    FIX-1: If you are inserting/updating a bunch of child records through BATCH JOBS then try and sort your data by the parent Ids, this will help prevent 
              errors being thrown due to multiple threads trying to lock the same parent records

    FIX-2: Try running your job in Serial mode, this turns off the threading of the job so only one thread will run at a given time. 
              This will definitely slow down your data load and should only be used as a last resort.
     
     */
}
