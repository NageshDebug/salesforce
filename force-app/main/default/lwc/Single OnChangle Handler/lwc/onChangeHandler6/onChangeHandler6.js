import { LightningElement } from 'lwc';

export default class OnChangeHandler6 extends LightningElement {
    person = {
        percentage: 10,
        firstname: 'Nagesh',
        lastname: 'Siripurapu'
    }

    changeHandler(event) {
        this.person = { ...this.person, [event.target.name]: event.target.value };
        console.log(this.person);
    }
}