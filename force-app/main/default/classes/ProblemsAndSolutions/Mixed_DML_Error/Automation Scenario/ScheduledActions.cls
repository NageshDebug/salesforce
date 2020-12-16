public with sharing class ScheduledActions {
  /***
    Issue:
    If you use a Process to attempt to do both things in a single transaction an error will appear.

    Error: An error occurred at element myRule_1_A1 (FlowRecordCreate).
    INSERT --- INSERT FAILED --- ERRORS : (MIXED_DML_OPERATION) DML operation on setup object is not permitted after you have updated a non-setup object (or vice versa): Invoice_Statement__c, original object: User

    Steps to reproduce:
    --------------------
    1. Create a Process on the User Object
    2. Set the criteria as Active | equals | True
    3. Set the Immediate Action as Create Record on the Account object.
    4. Activate the Process
    5. Create and Activate a New User.

    Process Builder Solution
    --------------------------
    When the action runs in the same transaction, add the action under the Scheduled Action. This placement separates your update or create action from your Immediate Actions. 

    Scheduled Action is available under the following conditions: 

    The Evaluation Criteria setting is:
    1. 'Created'
    2. 'When a record is created or edited'
    3. And the 'Do you want to execute the actions only when specified changed are made to the record?' is enabled under 'Advanced' on the 'Define Criteria for this Action Group' page.
     
    
    Workflow Solution
    ---------------------
    we can add Timebased workflow rules


    Flow Solution
    --------------------
    we needed to add either Screen flow element or Local Action. This would need to be inserted in between the two DML actions.
    
    */
}