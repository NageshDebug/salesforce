import { LightningElement } from 'lwc';

export default class SetterMethodParent1 extends LightningElement {
    fieldValue;
    handleChange(event) {
        this.fieldValue = event.target.value;
    }
}