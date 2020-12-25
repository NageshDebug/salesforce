public with sharing class Trigger_Best_Practices {
  /**
     Types of Triggers:
        – Before Triggers
        – After Triggers

     Before Trigger: Before triggers are used to perform the logic on the same object and specifically we cannot use the DML 
                     operation (Insert, update, delete) on these triggers. These triggers fired before the data saved into the 
                     database.

                     Before triggers can be used to update or validate record values before they are saved to the database.
                            -In the case of validation check in the same object.
                            -Insert or update the same object.
                
                     Can be used to perform validations and stop the creation / updation / deletion of records if they are 
                     not satisfying the criteria.

                     Set record default values. 
                     
                     Data can be modified in before triggers only, hence record field auto population by the system can be performed here.

                    Limitations of Before Triggers
                        You can’t access the Id field of new records in Before Triggers
                        Formula fields are not calculated in Before Triggers
                        Roll-up summaries are not available
                        
     After Trigger: 
                    After triggers are used to perform the logic on the related objects and these triggers are used access 
                    the fields values that are created by system (Ex: CreatedBy, LasteModifiedBy , Record Id etc..).

                    After triggers can be used to access field values that are set by the database (such as a record's Id or 
                    lastUpdated field) and to affect changes in other records, such as logging into an audit table or firing 
                    asynchronous events with a queue.
                            -Insert/Update related object, not the same object.
                            -Notification email.
                            -access some formula field values on the record in the insert/update process
                    
                    We cannot use After trigger if we want to update same record because after saving, record will be 
                    committed to database and record will be locked. The records, which fired with after trigger are 
                    read only. so  it causes read only error(System.FinalException: Record is read-only) if we perform 
                    operation on same object.
                    
                    if you want to delete the record from the same object in after trigger, it will give the runtime error.

                    
     Bulk Triggers: By default, every trigger is a bulk trigger which is used to process the multiple records at a time as a 
                    batch. For each batch of 200 records.



     When to choose Before Vs After Trigger
     --------------------------------------
        //This lazy dude wrote code to auto-accept and close all cases!
        trigger LazyEmployee on Case (after insert) {  //After Trigger is not correct to use here
            List<Case> newCases = new List<Case>();    //No need to create another collection
            for (Case a : Trigger.new) {
                a.Status = 'Closed';
                a.Owner  = 'Nagesh';                   //I would like prefer to use ownerId instead of owner. 
                newCases.add(a)
            }
            update newCases;                           //No need to fire DML explicitly
        }


        //Fixed version
        //This lazy dude wrote code to auto-accept and close all cases!
        trigger LazyEmployee on Case (before insert) {
            for (Case newCase : Trigger.new) {
                newCase.Status  = 'Closed';
                newCase.OwnerId = '005i0000000OAOO'; //Dont hardcode the IDs directly. If it is onetime dataloading, it is ok. but is not good practice.
            }
        }
     */
}
