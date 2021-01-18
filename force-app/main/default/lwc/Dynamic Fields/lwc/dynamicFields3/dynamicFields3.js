import { LightningElement, api, wire, track } from 'lwc';

import { getPicklistValues } from 'lightning/uiObjectInfoApi';

export default class DynamicFields3 extends LightningElement {
    @api strName;
    @api rtId;
    @api objectApiName;
    @track listOfFields;
    @wire(getPicklistValues, {
        recordTypeId: '$rtId',
        fieldApiName: '$listOfFields'
    })
    picklistValues;

    connectedCallback() {
        if (this.strName) {
            this.listOfFields = `${this.objectApiName}.${this.strName}`;
            console.log(this.listOfFields);
        }
    }

    get displayPicklistValues() {
        return JSON.stringify(this.picklistValues);
    }
}
