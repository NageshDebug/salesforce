import { LightningElement } from 'lwc';

export default class Call_LWC_From_QuickAction extends LightningElement {
    Message = 'Hello, I am Lightning web component ';
    closeModal() {
        this.dispatchEvent(new CustomEvent('closeQuickAction'));
    }
}