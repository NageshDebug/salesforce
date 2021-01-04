import { LightningElement } from 'lwc';

export default class OnChangeHandler5 extends LightningElement {
    percentage = 10
    firstname = 'Nagesh'
    lastname = 'Siripurapu'

    changeHandler(event) {
        this[event.target.name] = event.target.value;

        //limitation of this approach, we can't perform validations or setting default values like below
        //this[event.target.name] = event.target.value <= 100 ? event.target.value : 100;

        //solution-1: use html data attibutes and use if or switch statements.
        //solution-2: use object and set default values in the object
    }
}