import { LightningElement } from 'lwc';

export default class DefaultValuesThroughFormulaField extends LightningElement {
    /**
     Step-1: Create formula field
            HYPERLINK('/lightning/o/Opportunity/new?defaultFieldValues=AccountId='+Id, 'Create Opportunity' ,'_blank')

    
     Step-2: Add it to the page layout. Ex: Account PageLayout.

     Example: Creating Opportunity from Account detail page layout. It will auto populate the AccountID
    
     */
}