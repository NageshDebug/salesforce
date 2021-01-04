import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
export default class RecordFormDefaultValues extends LightningElement {

    @api objectApiName;
    modeName = 'edit';
    fields = [NAME_FIELD, REVENUE_FIELD, INDUSTRY_FIELD];

    handleLoad(event) {
        let detail = event.detail;
        console.log(JSON.stringify(detail));

        const fields = event.detail.record.fields;
        console.log(JSON.stringify(fields));
        fields.Name.value = 'Nagesh Siripurapu1'; // modify a field
    }

    handleSubmit(event) {
        event.preventDefault();       // stop the form from submitting
        const fields = event.detail.fields;
        fields.Name = 'Nagesh Siripurapu2'; // modify a field
        this.template.querySelector('lightning-record-form').submit(fields);
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
        console.log(JSON.stringify(event.error));
        /** if we want the user to redirect to some other page
         var url = window.location.href;
         var value = url.substr(0,url.lastIndexOf(‘/’) + 1);
         window.history.back();
         return false;
         */
    }
}