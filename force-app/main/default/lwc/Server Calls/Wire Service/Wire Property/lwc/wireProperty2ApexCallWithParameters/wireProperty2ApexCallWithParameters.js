import { LightningElement, track, wire } from 'lwc';
import searchContactList from '@salesforce/apex/ContactController.searchContactList';

const DELAY = 300;

export default class WireProperty2ApexCallWithParameters extends LightningElement {
    @track searchKey = '';

    @wire(searchContactList, { accountName: '$searchKey' }) contacts;

    searchContact(event) {
        window.clearTimeout(this.delayTimeout);
        const searchKey = event.target.value;
        // eslint-disable-next-line @lwc/lwc/no-async-operation
        this.delayTimeout = setTimeout(() => {
            this.searchKey = searchKey;
        }, DELAY);
    }
}