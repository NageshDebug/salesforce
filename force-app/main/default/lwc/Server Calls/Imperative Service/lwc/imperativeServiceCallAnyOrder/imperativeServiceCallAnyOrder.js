import { LightningElement } from 'lwc';

import getContactDetails from '@salesforce/apex/ContactController.getContactDetails';

const CONTACTS_IDS = [
    '0034x000007M4taAAC',
    '0034x000002Kr31AAC',
    '0034x000007LPsWAAW'
];

export default class ImperativeServiceCallAnyOrder extends LightningElement {

    connectedCallback() {
        const apexPromises = CONTACTS_IDS.map(contactId => getContactDetails({
            recordId: contactId
        }));
        this.resolveApexPromises(apexPromises);
    }

    resolveApexPromises(apexPromises) {
        Promise.all(apexPromises)
            .then((result) => {
                console.log(result);
            })
            .catch((error) => {
                console.log(error);
            })
            .finally(() => {
                console.log('Finally');
            })
        /* OUTPUT
           0: {Id: "0033V00000AQ3ptQAD", Name: "Emanuel Manzanares"}
           1: {Id: "0033V00000AQ3pzQAD", Name: "Millie Brooks"}
           2: {Id: "0033V00000AQ3pvQAD", Name: "Takuya Watanabe"}
           Finally
         */
    }
}