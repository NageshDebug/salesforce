import { LightningElement, track, wire } from 'lwc';
import searchContactList from '@salesforce/apex/ContactController.searchContactList';

const DELAY = 300;

export default class WireMethod2ApexCallWithParameters extends LightningElement {
    @track searchKey = '';

    contacts;
    error;

    @wire(searchContactList, { accountName: '$searchKey' })
    wireContacts({ error, data }) {
        if (data) {
            this.contacts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }

    searchContact(event) {
        window.clearTimeout(this.delayTimeout);
        const searchKey = event.target.value;
        // eslint-disable-next-line @lwc/lwc/no-async-operation
        this.delayTimeout = setTimeout(() => {
            this.searchKey = searchKey;
        }, DELAY);
    }
}