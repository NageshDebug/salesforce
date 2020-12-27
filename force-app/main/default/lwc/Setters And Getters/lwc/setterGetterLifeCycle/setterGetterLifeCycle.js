import { LightningElement } from 'lwc';
/**
    Case-1: When the component initialized
                Constructor called
                connectedCallback called
                Getter method Called


    Case-2: When Onchange event fired (upon changing the values in the input fields)
                Handler method called
                Setter method called
                Getter method Called
 
    Note:  Do not use renderedCallback() to change the state of a component, such as loading values or 
           setting properties. Use getters and setters instead.
 */
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