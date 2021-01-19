import { LightningElement, api, wire, track } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import getAccountById from '@salesforce/apex/AccountController.getAccountById';

import ACCOUNT_ID from '@salesforce/schema/Contact.AccountId';
export default class ImperativeServiceCallFromGetterMethod extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields: [ACCOUNT_ID] })
    contactRecord;

    @track acctResponse = [];

    get accountDetails() {
        if (this.contactRecord.data) {
            let accountId1 = getFieldValue(this.contactRecord.data, ACCOUNT_ID);
            console.log('AccountId======>' + accountId1);
            getAccountById({ accountId: accountId1 }).then(x => this.acctResponse = [...this.acctResponse, x]);
        }
    }

    get hasAccountResponse() {
        return this.acctResponse.length > 0;
    }
}