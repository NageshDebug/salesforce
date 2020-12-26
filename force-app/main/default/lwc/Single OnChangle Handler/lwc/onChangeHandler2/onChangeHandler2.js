import { LightningElement } from 'lwc';

export default class OnChangeHandler2 extends LightningElement {
    firstName;
    lastName;
    name;

    takeInputs() {
        this.firstName = this.template.querySelector("[data-field='FirstName']").value;
        this.lastName = this.template.querySelector("[data-field='LastName']").value;

        this.name = this.firstName + " " + this.lastName;
    }
}