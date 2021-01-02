import { LightningElement, api } from 'lwc';

export default class MethodChild2 extends LightningElement {
    // Default list of Contacts.
    lstContacts = ["Weird Coder", "Red Devil", "Mystic Baba", "OneManArmy Baburao"];


    // This method will add new Contact into Contact list.
    @api
    addContactToList(strContactName) {
        console.log('Child Component:' + strContactName);
        //this.lstContacts.push(strContactName);  // it doesn't work. use spread operator
        this.lstContacts = [...this.lstContacts, strContactName];
    }

}