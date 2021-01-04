import { LightningElement } from 'lwc';

export default class Parent3 extends LightningElement {
    myName = 'Nagesh';

    onChangeHandler(event) {
        this.myName = event.detail.value;
    }
}