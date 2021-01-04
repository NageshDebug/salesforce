public with sharing class Trigger_Scenario_Based_Tips {
  /**
    1. There is a validation rule which will fire if amount = 100 and will display the error message. 
       There is a workflow rule which will fire if amount > 100 and will update amount field to 100. 
       One of user saved the record by giving value as 1000. What will the value of the amount field?
       
       Answer: Validation rules will fire first then workflow rules will fire. So, the answer is 100 (Even though there is a validation 
       rule because of the workflow rule it will accept 100 in the amount field).

    2. There is a before trigger which will fire if amount = 100 and will display the error message.
       
       Answer: There is a workflow rule which will fire if amount > 100 and will update amount field to 100. 
       One of user saved the record by giving value as 1000.

    3. What will the value of the amount field?
       
       Answer: It will throw the validation error because after the workflow field update before triggers fire one more time.


     */
}