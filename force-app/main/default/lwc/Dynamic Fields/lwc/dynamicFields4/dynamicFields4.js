import { LightningElement, api, track, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
export default class DynamicFields4 extends LightningElement {
    @api recordId;
    @track fields;
    @api objectApiName;
    @wire(getRecord, { recordId: '$recordId', fields: '$fields' })
    record;

    connectedCallback() {
        this.fields = this.objectApiName === 'Account' ? ['Account.BillingCity', 'Account.Name'] : ['Contact.MailingCity', 'Contact.Name'];
    }

    renderedCallback() {
        console.log(this.record, 'record');
    }
}
