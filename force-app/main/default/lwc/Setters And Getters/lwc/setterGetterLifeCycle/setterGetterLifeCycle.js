import { LightningElement } from 'lwc';

export default class SetterGetterLifeCycle extends LightningElement {
    defaultMsg = "We are learning ";
    outputMessage;

    constructor() {
        super();
        console.log('Constructor called');
    }

    connectedCallback() {
        //code
        console.log('connectedCallback called');
    }

    get message() {
        console.log('Getter method Called');
        return this.defaultMsg + "Lightning Web Component";
    }

    set message(val) {
        console.log('Setter method called');
        this.outputMessage = val;
    }

    handleMessage(event) {
        console.log('Handler method called');
        this.message = event.target.value;
    }
}