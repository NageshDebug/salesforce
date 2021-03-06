import { LightningElement } from 'lwc';

export default class CardHeader extends LightningElement {
    firstName;
    lastName;

    onChangeFirstName(event) {
        this.firstName = event.target.value;
    }

    onChangeLastName(event) {
        this.lastName = event.target.value;
    }

    renderedCallback() {
        const style = document.createElement('style');
        style.innerText = `c-card-header .slds-card__header {
                                background-color: #54C2B2;
                            }`;
        this.template.querySelector('lightning-card').appendChild(style);
    }

    get getFullName() {
        let fullName = '';
        if (this.firstName) {
            fullName = fullName + '' + this.firstName;
        }

        if (this.lastName) {
            fullName = fullName + ' ' + this.lastName;
        }

        return fullName;
    }
}