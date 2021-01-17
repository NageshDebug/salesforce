import { LightningElement } from 'lwc';

export default class ConditionalRendering2 extends LightningElement {
    //if:false demo logic
    hideText = false;
    hideHandler() {
        this.hideText = true;
    }
}