import { LightningElement } from 'lwc';

export default class MethodParent2 extends LightningElement {
    strContactName = '';

    // To call the child component method to add the Contact into the list.
    addContact(event) {
        console.log('Parent Component:' + this.strContactName);
        const objChild = this.template.querySelector('c-method-child2');
        objChild.addContactToList(this.strContactName);
    }

    // To update the Contact name after updating it on UI. 
    changeName(event) {
        this.strContactName = event.target.value;
    }
}