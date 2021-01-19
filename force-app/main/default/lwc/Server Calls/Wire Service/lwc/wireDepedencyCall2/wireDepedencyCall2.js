import { LightningElement, api, wire, track } from 'lwc';

import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_PARENT_ID from '@salesforce/schema/Account.ParentId';

const FIELDS1 = [ACCOUNT_PARENT_ID];
const FIELDS2 = [ACCOUNT_NAME];

export default class WireDepedencyCall2 extends LightningElement {
    @api recordId;
    @track parentId;
    @track grandParentName

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS1 })
    GetParentRecordId({ error, data }) {
        if (data) {
            this.parentId = getFieldValue(data, ACCOUNT_PARENT_ID);
        } else if (error) {
            console.log('error1 ', error)
        }
    }

    @wire(getRecord, { recordId: '$parentId', fields: FIELDS2 })
    GetGrandParentRecordId({ error, data }) {
        if (data) {
            this.grandParentName = getFieldValue(data, ACCOUNT_NAME);
        } else if (error) {
            console.log('error2 ', error)
        }
    }

    get HasGetGrandParentName() {
        return this.grandParentName;
    }
}