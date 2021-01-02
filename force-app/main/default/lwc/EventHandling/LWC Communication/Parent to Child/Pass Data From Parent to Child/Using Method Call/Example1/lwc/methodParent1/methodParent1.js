import { LightningElement } from 'lwc';

export default class MethodParent1 extends LightningElement {
    handlePhraseChange(event) {
        this.template.querySelector('c-method-child1').changeUpperCase(event.target.value);
    }
}