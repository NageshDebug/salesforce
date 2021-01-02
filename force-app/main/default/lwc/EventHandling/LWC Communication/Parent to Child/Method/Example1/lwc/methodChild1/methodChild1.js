import { LightningElement, api } from 'lwc';

export default class MethodChild1 extends LightningElement {
    updatedCase;

    @api
    changeUpperCase(phrase) {
        this.updatedCase = phrase.toUpperCase();
    }
}