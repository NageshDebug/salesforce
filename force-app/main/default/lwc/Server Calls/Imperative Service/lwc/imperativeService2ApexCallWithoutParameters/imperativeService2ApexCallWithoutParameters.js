import { LightningElement, track } from 'lwc';
import getImperativeContactList from '@salesforce/apex/ContactController.getImperativeContactList';
export default class ImperativeService2ApexCallWithoutParameters extends LightningElement {
    @track contacts;
    @track error;

    connectedCallback() { //you can build a method for a button
        getImperativeContactList()
            .then(result => {
                this.contacts = result;
                this.error = undefined;
            }).catch(error => {
                this.error = error;
                this.contacts = undefined;

            })
    }
}