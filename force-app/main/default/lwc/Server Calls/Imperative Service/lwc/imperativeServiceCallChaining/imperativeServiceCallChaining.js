import { LightningElement } from 'lwc';

import getContactDetails from '@salesforce/apex/ContactController.getContactDetails';
import getTextMethod1 from '@salesforce/apex/ContactController.getTextMethod1';
import getTextMethod2 from '@salesforce/apex/ContactController.getTextMethod2';
import getTextMethod3 from '@salesforce/apex/ContactController.getTextMethod3';

export default class ImperativeServiceCallChaining extends LightningElement {
    connectedCallback() {
        this.getContactDetailsApex('0034x000002Kr31AAC');
    }

    getContactDetailsApex(contactId) {
        getContactDetails({
            recordId: contactId
        }).then((result) => {
            console.log(result);
            return getTextMethod1();
        }).then((result) => {
            console.log(result);
            return getTextMethod2();
        }).then((result) => {
            console.log(result);
            return getTextMethod3();
        }).then((result) => {
            console.log(result);
        }).catch((error) => {
            console.log(error);
        }).finally(() => {
            console.log('Finally');
        })
        /* OUTPUT
           {Id: "0033V00000AQ3ptQAD", Name: "Emanuel Manzanares"}
           Finally
        */
    }
}