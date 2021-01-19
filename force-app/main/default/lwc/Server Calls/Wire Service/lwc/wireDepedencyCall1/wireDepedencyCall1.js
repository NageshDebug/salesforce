import { LightningElement, wire, track } from 'lwc';
import { getPicklistValues, getObjectInfo } from 'lightning/uiObjectInfoApi';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';


export default class WireDepedencyCall1 extends LightningElement {
    @track rtId;
    @track error;

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    handleResult({ error, data }) {
        if (data) {
            this.rtId = data.defaultRecordTypeId;
        } else {
            this.error = error;
        }
    }

    @wire(getPicklistValues, { recordTypeId: "$rtId", fieldApiName: TYPE_FIELD })
    picklistValues;

    get hasPicklistValues() {
        return this.picklistValues && this.picklistValues.data && this.picklistValues.data.values;
    }
}