import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList';

export default class WirePropertyVsWireMethod extends LightningElement {
    /**
     Problem - Apex method will be invoked after all the Life Cycle Hooks are invoked so the above approach will not be of any help.
    
     Optimised Solution - Wire Apex method to a function instead of a property. 
                         If you try to understand what happens here, all the Life Cycle Hooks are invoked and then it will automatically wire the apex method 
                         to the function and with in the function you can log the data sent back by apex method.
     */
    @wire(getAccountList)
    accounts;

    connectedCallback() {
        console.log(JSON.stringify(this.accounts));  //it print's empty string
    }

    renderedCallback() {
        console.log(JSON.stringify(this.accounts)); //it print's empty string
    }

    get accountsToDisplay() {
        return JSON.stringify(this.accounts);
    }

    @wire(getAccountList)
    wiredAccounts({ error, data }) {
        if (data) {
            console.log('wiredAccounts:' + data);
        } else if (error) {
            console.log('wiredAccounts:' + error);
        }
    }
}