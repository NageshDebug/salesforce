public with sharing class ULTR_Solution3 {
    /**
    UNABLE_TO_LOCK_ROW solution using Rerun method
    ------------------------------------------------
    I have been reading a few blogs and posts of the forums on how to solve the database locking error I sometime get when running @future methods. 
    The reason for the error is that some other system or user has already locked the record and now you want access to the record. 
    This is denied and an error is thrown.

    There is some solution when doing updated by specifying FOR UPDATE in your SOQL expression as mentioned in ULTR_Solution1. 
    But even with this I still got locking errors. I worked on a solution to run a batch apex job to redo the method later using Batch Apex.

    Catch the error by writing the following:
    catch (System.DMLException ex){
        if (StatusCode.UNABLE_TO_LOCK_ROW==ex.getDmlType(0))
            Debugger.createDebugRecord(ex, 'methodName');
    }

    What I did was overload the Exception class and created a custom Debugger Object. In this object I have the record Id and method name. 
    With this I created a rerun button to rerun this method with this Id.

    public static void createDebugRecord(handlerException exceptionObject, String methodName)
     {
         Database.insert(new Debugger__c
            (  
                    Message__c = exceptionObject.getMessage(),
                    Line_Number__c = exceptionObject.getLineNumber(),
                    Stack_Trace__c = exceptionObject.getStackTraceString(),
                    Method_Name__c=methodName
            ), false);
     }
     public static void createDebugRecord(DMLException dmlexceptionObject, String methodName)
     {
         Database.insert(new Debugger__c
            (      
                    DML_Record_Id__c = dmlexceptionObject.getDmlId(0),
                    DML_Type__c = dmlexceptionObject.getTypeName(),
                    Message__c = dmlexceptionObject.getDmlMessage(0),
                    Line_Number__c = dmlexceptionObject.getDmlIndex(0),
                    Stack_Trace__c = dmlexceptionObject.getDmlStatusCode(0),
                    Method_Name__c=methodName
            ),false);
     }

     My handleException extends Exception
     public class handlerException extends Exception{}

     Run a Batch Apex/Batch Java to retry all the failed records.
     
     */
}
