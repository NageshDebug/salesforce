import { LightningElement } from 'lwc';

export default class ConditionalRendering4OnchangeHandler extends LightningElement {
    // condtional hide and show demo
    inputText = null;
    changeHandler(event) {
        this.inputText = event.target.value;
    }
    get checkText() {
        return this.inputText === "Hello";
    }
}