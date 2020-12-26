import { LightningElement } from 'lwc';

export default class DefaultValuesThroughButton extends LightningElement {
    /**
        Step-1: Goto Object Manager and Select the Object. Ex: Opportunity

        Step-2: Click Buttons, Link and Actions

        Step-3: Click New Button or Link 

        Step-4: Enter Label. Example: Create Contact
                Select Display Type Radio Button = Detail Page Button
                Enter the default values as below in the text editor
                

                Example-1: /lightning/o/Contact/new?defaultFieldValues=AccountId={!Opportunity.AccountId}
                           Note:  if you notice error is occurred when Lookup value is empty (Ex: Account Name is empty),then use URLFOR as below
                    
                           {!URLFOR(‘/lightning/o/Contact/new?defaultFieldValues=’ +IF(ISBLANK(Opportunity.AccountId), ”, ‘,AccountId=’+Opportunity.AccountId))}



                Example-2: lightning/o/Account/new?defaultFieldValues= 
                             Name={!URLENCODE(Account.Name)},
                             OwnerId={!Account.OwnerId}, 
                             AccountNumber={!Account.AccountNumber}, 
                             NumberOfEmployees=350,
                             CustomCheckBox__c={!IF(Account.SomeCheckBox__c,true,false)}

        Step-5: Click on Page Layout and select the appropriate Page Layout. Ex: Opportunity Layout

        Step-6: Click on Mobile & Lightning Options

        Step-7: Drag and Drop the above Created Button under the section "Salesforce Mobile and Lightning Experience Actions"

        Step-8: Save the PageLayout.

        Step-9: Open the Record Detail Page. Ex: Opportunity Record Detail Page. 

        Step-10: you will see the above created button on the page. If not refresh the page.
     */
}