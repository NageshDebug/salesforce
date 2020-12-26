import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord, getRecordCreateDefaults, generateRecordInputForCreate } from 'lightning/uiRecordApi';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import ACCOUNT_PHONE from '@salesforce/schema/Account.Phone';
import ACCOUNT_NUMBER from '@salesforce/schema/Account.AccountNumber';
import ACCOUNT_INDUSTRY from '@salesforce/schema/Account.Industry';

export default class OnChangeHandler1 extends LightningElement {
    //Bind UI fields
    phoneField = ACCOUNT_PHONE.fieldApiName;
    nameField = NAME_FIELD.fieldApiName;
    accountNumberField = ACCOUNT_NUMBER.fieldApiName;
    accountIndustryField = ACCOUNT_INDUSTRY.fieldApiName;

    error;
    recordInput;

    //Step1: Get accountCreateddefaults using getRecordCreateDefaults adptor
    @wire(getRecordCreateDefaults, { objectApiName: ACCOUNT_OBJECT })
    accountCreateddefaults({ data, error }) {
        //If accountCreateddefaults return success
        if (data) {
            //Step2: call generateRecordInputForCreate to create the input for creation and keep in recordInput
            //generateRecordInputForCreate has two parameters
            //1. record=data.record
            const record = data.record;

            //2. AccountObjectInfo to filter only createable field in response
            const AccountObjectInfo = data.objectInfos[ACCOUNT_OBJECT.objectApiName];

            // Creates a record input with default field values
            this.recordInput = generateRecordInputForCreate(record, AccountObjectInfo);

            //set  error undefined in case of success
            this.error = undefined;
        } else if (error) {// if return failed
            //set  recordInput undefined in case of failure
            this.recordInput = undefined;
            this.error = error;
        }
    }

    //Function called to capture the input field
    handleFieldChange(event) {
        this.recordInput.fields[event.target.dataset.fieldName] = event.target.value;
    }

    //Function is called from Create Account button from LWC template
    createAccount() {
        //call createRecord to create account and pass recordInput
        createRecord(this.recordInput).then((account) => {
            //Create showtoastevent to display success msg
            const stEvent = new ShowToastEvent({
                title: 'Success',
                message: 'Account created, with id: ' + account.id,
                variant: 'success'
            });

            //fire the event
            this.dispatchEvent(stEvent);
        }).catch((error) => {
            console.log('This is error :' + error.body.message);
            //Create showtoastevent to display error msg
            const errorEvent = new ShowToastEvent({
                title: 'Error creating record',
                message: reduceErrors(error).join(', '),
                variant: 'error'
            })

            //fire the event
            this.dispatchEvent(errorEvent);
        });
    }
}


