import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
export default class Example2 extends LightningElement {

    //Method-1: Get the object name static way
    //accountObject = ACCOUNT_OBJECT;

    //Method-2: Get the object name dynamically. objectApiName is "Account" when this component is placed on an account record page
    @api objectApiName;
    modeName = 'edit';
    fields = [NAME_FIELD, REVENUE_FIELD, INDUSTRY_FIELD];

    handleLoad(event) {
        // get All the fields
        let detail = event.detail;
        console.log(JSON.stringify(detail));
    }

    handleSubmit(event) {
        event.preventDefault();       // stop the form from submitting
        const fields = event.detail.fields;
        fields.Name = 'Nagesh Siripurapu'; // modify a field
        this.template.querySelector('lightning-record-form').submit(fields);
    }

    handleError(event) {
        console.log(JSON.stringify(event.error));
        this.clearEditMode();
    }

    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: "Account created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(evt);
    }

    handleCancel(event) {
        console.log(JSON.stringify(event));
    }
}