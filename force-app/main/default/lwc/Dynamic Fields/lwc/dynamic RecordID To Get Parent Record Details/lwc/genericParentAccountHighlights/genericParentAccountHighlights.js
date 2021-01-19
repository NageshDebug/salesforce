import { LightningElement, wire, api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class GenericParentAccountHighlights extends LightningElement {
    @api recordId;
    @api objectApiName;
    @api accountFieldName;
    @wire(getRecord, { recordId: '$recordId', fields: '$fields' }) myRecord;

    get accountId() {
        if (this.accountFieldName &&
            this.myRecord &&
            this.myRecord.data &&
            this.myRecord.data.fields &&
            this.myRecord.data.fields[this.accountFieldName] &&
            this.myRecord.data.fields[this.accountFieldName].value) {
            return this.myRecord.data.fields[this.accountFieldName].value;
        }
        return undefined;
    }

    get accountFieldNameForGetRecord() {
        return this.objectApiName + '.' + this.accountFieldName;
    }

    get isMissingFieldName() {
        return !(this.accountFieldName);
    }

    get fields() {
        let returnValue = [];
        returnValue.push(this.accountFieldNameForGetRecord);
        return returnValue;
    }
}