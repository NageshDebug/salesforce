import { LightningElement } from 'lwc';

export default class ConditionalRendering1 extends LightningElement {
    //if:true demo logic
    showText = false;
    showHandler() {
        this.showText = true;
    }
}
