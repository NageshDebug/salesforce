import { LightningElement, wire, api } from 'lwc';
import getFieldsName from '@salesforce/apex/FieldSetHelper.getFieldsName';

export default class RecordFormFieldSet extends LightningElement {
    @api recordId;
    @api objectApiName;
    @api fieldSetName;

    fields = [];

    handleSubmit(event) {
        console.log('onsubmit event recordEditForm' + event.detail.fields);
    }
    handleSuccess(event) {
        console.log('onsuccess event recordEditForm', event.detail.id);
    }

    connectedCallback() {
        console.log(this.recordId);
    }

    @wire(getFieldsName, { objectApiName: '$objectApiName', fieldSetName: '$fieldSetName' })
    wiredFields({ error, data }) {
        if (data) {
            this.fields = data.split(',');
        }

        if (error) {
            console.log(error);
        }
    }
}