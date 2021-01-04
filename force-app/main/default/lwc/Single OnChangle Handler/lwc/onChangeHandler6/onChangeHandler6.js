import { LightningElement } from 'lwc';

export default class OnChangeHandler6 extends LightningElement {
    person = {
        percentage: 10,
        firstname: 'Nagesh',
        lastname: 'Siripurapu'
    }

    //Advantages:
    //          No need to build json object seperately to save the record
    //          we can reduce lot of boiler code. no need to write seperate onchange handler method for each field
    changeHandler(event) {
        this.person = { ...this.person, [event.target.name]: event.target.value };
        console.log(this.person);
    }
}