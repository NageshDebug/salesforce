import { LightningElement } from 'lwc';

export default class PropertyParent1 extends LightningElement {
    parentMessage = 'Communication through Api Property.'

    handleChange(evt) {
        this.parentMessage = evt.target.value;
    }
}