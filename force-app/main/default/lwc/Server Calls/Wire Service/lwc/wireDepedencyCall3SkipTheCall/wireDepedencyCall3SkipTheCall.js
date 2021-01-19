import { LightningElement, api, wire, track } from 'lwc';

import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

import ACCOUNT_PARENT_ID from '@salesforce/schema/Account.ParentId';

const FIELDS1 = [ACCOUNT_PARENT_ID];
const FIELDS2 = [ACCOUNT_PARENT_ID];

export default class WireDepedencyCall3SkipTheCall extends LightningElement {
    @api recordId;
    @track parentId;
    @track grandParentId;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS1 })
    GetParentRecordId({ error, data }) {
        if (data) {
            this.parentId = getFieldValue(data, ACCOUNT_PARENT_ID);
        } else if (error) {
            console.log('error1 ', error)
        }
    }

    /**
      Eventhough parentId is reactive property, this below wire method doesn't execute. 

      Reason: ParentId is already cached from the above wire method call response.
     */
    @wire(getRecord, { recordId: '$parentId', fields: FIELDS2 })
    GetGrandParentRecordId({ error, data }) {
        if (data) {
            this.grandParentId = getFieldValue(data, ACCOUNT_PARENT_ID);
        } else if (error) {
            console.log('error2 ', error)
        }
    }

    get HasGetGrandParentId() {
        return this.grandParentId;
    }
}