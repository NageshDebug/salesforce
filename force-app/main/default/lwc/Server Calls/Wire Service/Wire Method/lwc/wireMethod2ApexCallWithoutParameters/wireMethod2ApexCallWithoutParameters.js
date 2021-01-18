import { LightningElement, wire } from 'lwc';

import getAccountsList from '@salesforce/apex/AccountController.getAccountsList';

export default class WireMethod2ApexCallWithoutParameters extends LightningElement {

    accounts;
    error;

    @wire(getAccountsList)
    wireaAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
            this.error = undefined;
        }
        else if (error) {
            this.error = error;
            this.accounts = undefined;
        }
    }
}