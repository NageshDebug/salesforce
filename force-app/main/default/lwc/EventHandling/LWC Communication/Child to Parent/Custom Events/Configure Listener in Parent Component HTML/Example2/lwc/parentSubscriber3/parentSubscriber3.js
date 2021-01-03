import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList';

export default class ParentSubscriber3 extends LightningElement {
    selectedAccountId;
    @wire(getAccountList) accountList;
    onAccountSelection(event) {
        this.selectedAccountId = event.detail.recordId;
    }
}