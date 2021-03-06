import { LightningElement, wire, track } from "lwc";
import getContacts from "@salesforce/apex/ContactController.getContacts";

export default class DynamicCSS extends LightningElement {
    contactRecords;
    @track selectedContactRecords = [];

    // Get a list of contacts for the component
    @wire(getContacts)
    wiredRecord({ error, data }) {
        if (data) {
            this.contactRecords = data;
        } else if (error) {
            console.log("Error: " + error.message);
        }
    }

    handleClick(event) {
        console.log('click')
        const contactId = event.currentTarget.dataset.id;
        console.log(contactId);

        const matchedContacts = this.selectedContactRecords.filter(contact => contact.Id === contactId);
        console.log('matchedContacts=>' + matchedContacts);
        if (matchedContacts.length >= 1) {
            this.hilightSelectedContact(contactId);
        } else {
            this.addContactToSelectedRecordList(contactId);
        }
    }

    hilightSelectedContact(contactId) {
        console.log('hilightSelectedContact=>1');
        const selectedContactElements = this.template.querySelectorAll(`[data-selectedid='${contactId}]`);
        console.log('hilightSelectedContact=>2=>' + selectedContactElements);
        selectedContactElements.forEach(element => { element.setAttribute('class', 'selected-item selected-item-shadow') });
        setTimeout(() => {
            element.setAttribute('class', 'slds-item')
        }, 500);
    }

    addContactToSelectedRecordList(contactId) {
        const selectedContact = this.contactRecords.filter(contact => contact.Id === contactId);
        this.selectedContactRecords = this.selectedContactRecords.concat(selectedContact);
    }

    get recordsSelected() {
        return this.selectedContactRecords.length > 0;
    }

    /*
      handleClick(event) {
        const type = event.currentTarget.dataset.type;
        const recordId = event.currentTarget.dataset.id;
        const email = event.currentTarget.dataset.email;
        switch (type) {
          case "select":
            this.addContactToList(recordId);
            break;
          case "contact":
            alert("Email is: " + email);
            break;
          default:
            console.log("type action not set");
            break;
        }
      }
      */

}