import { LightningElement } from 'lwc';

export default class ConditionalRendering3Toggle extends LightningElement {
    toggleText = true;
    toggleHandler() {
        this.toggleText = !this.toggleText;
    }
}