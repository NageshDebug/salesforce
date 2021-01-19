import { LightningElement, wire, api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class ContactAccountHighlights extends LightningElement {
    @api recordId;
    @wire(getRecord, { recordId: '$recordId', fields: ['Contact.AccountId'] }) myContact;

    get accountId() {
        if (this.myContact &&
            this.myContact.data &&
            this.myContact.data.fields &&
            this.myContact.data.fields.AccountId &&
            this.myContact.data.fields.AccountId.value) {
            return this.myContact.data.fields.AccountId.value;
        }
        return undefined;

    }

}