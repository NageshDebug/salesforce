import { LightningElement, api } from 'lwc';

export default class ConditionalRendering6Child extends LightningElement {
    @api selectedAccount;
    @api account;

    get showCard() {
        if (this.selectedAccount == this.account.Name)
            return true;
        return false;
    }
}