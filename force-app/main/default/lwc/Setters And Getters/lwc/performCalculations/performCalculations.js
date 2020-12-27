import { LightningElement } from 'lwc';

export default class PerformCalculations extends LightningElement {
    //defining js properties
    firstNumber;
    secondNumber;

    //The onchnage handler of the number input fields
    handleChange(event) {
        if (event.target.name === 'input1') {
            this.firstNumber = event.target.value;
        } else if (event.target.name === 'input2') {
            this.secondNumber = event.target.value;
        }
    }

    get sumOfTwoNumber() {
        //parseInt Converts a string to an integer.
        if (this.firstNumber && this.secondNumber) {
            return parseInt(this.firstNumber) + parseInt(this.secondNumber);
        }
    }
}