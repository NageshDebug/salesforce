import { LightningElement, api } from 'lwc';

export default class SetterMethodChild1 extends LightningElement {
    fruit;
    @api get fruitName() {
        return this.fruit;
    }
    set fruitName(value) {
        this.setAttribute('fruitName', value);
        this.fruit = value;
        this.handleValueChange(value);
    }

    //a method called in setter
    handleValueChange(value) {
        console.log(value);
        //do something
    }
}