import { LightningElement, wire, api } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';

export default class DynamicFields1 extends LightningElement {
    @api rtId;
    @api objectApiName; // string eg 'Account'
    @api fieldApiName; // string eg 'Type' 
    @wire(getPicklistValues, {
        recordTypeId: '$rtId',
        fieldApiName: '$calculatedFieldApiName'
    })
    picklistValues;

    get calculatedFieldApiName() {
        if (isString(this.objectApiName) && isString(this.fieldApiName)) {
            return `${this.objectApiName}.${this.fieldApiName}`;
        }
        return undefined;
    }

    get displayPicklistValues() {
        return JSON.stringify(this.picklistValues);
    }
}

function isString(value) {
    return typeof value === 'string';
}