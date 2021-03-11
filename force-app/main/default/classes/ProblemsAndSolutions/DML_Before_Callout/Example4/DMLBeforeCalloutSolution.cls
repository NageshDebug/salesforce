public with sharing class DMLBeforeCalloutSolution {
  /**
      Solution-1: User click the Button
                  Collect the input from UI in class level variable (but dont commit)
                  Make callout and parse the result 
                  merge the UI input and callout response and then perform DML.
    
       Solution-2: using fflib unit of work. same concept as above

       Solution-3: split the transaction
                   Step-1: User click the Button
                   Step-2: call Apex controller method (let say, AuraEnabled method-1)
                   Step-3: Save the input data
                   Step-4: return the call to UI
                   Step-5: initiate another call using promise or callback in Javascript
                   Step-6: call Apex controller method (let say, AuraEnabled method-2)
                           this method makes callout
        
        Solution-4: using internal callout
                    Step-1: User click the Button
                    Step-2: Save the user input by calling salesforce REST API 
                            Example: URL.getSalesforceBaseUrl().toExternalForm()+'/services/data/v49.0/sobjects/Account/'
                    Step-3: make another callout
        
        Solution-5: Using platform events + Async Trigger
                    Step-1: User click the Button
                    Step-2: call Apex controller method 
                    Step-3: Publish platform event in the above controller method
                    Step-4: From the Async trigger make callout

        Solution-6: Using platform events + Process builder
                    Step-1: User click the Button
                    Step-2: call Apex controller method 
                    Step-3: Publish platform event in the above controller method
                    Step-4: Subscribe the platform event through process builder and then make callout through invicable method
     
        Solution-7: Batch + Schedular
                    1. Call the future method from the Trigger, that does the callout to get the Account Data
                    2. Save the Account Records into Database.
                    3. Execute the Schedulable Job to run after 5 seconds. (this job executes the Batch job and does the Callout)
                    https://salesforcetech.wordpress.com/2012/05/22/dml-callouts-in-sequence/

        Solution-8: @future or Queuable (prefer Queuable)
                    Step-1: User click the Button
                    Step-2: Save the user input
                    Step-3: make the callout by using Queuable or @future
         */     
}
