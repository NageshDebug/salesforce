import { LightningElement } from 'lwc';

import NAME_FIELD from '@salesforce/schema/Account.Name';
import ACCOUNT_PHONE from '@salesforce/schema/Account.Phone';
import ACCOUNT_FAX from '@salesforce/schema/Account.Fax';

export default class OnChangeHandler4 extends LightningElement {
    name;
    phone;
    fax;

    //map these fields with UI Record API
    nameField = NAME_FIELD.fieldApiName;
    phoneField = ACCOUNT_PHONE.fieldApiName;
    faxField = ACCOUNT_FAX.fieldApiName;

    onChangeHandler(event) {
        let value = event.detail.value;
        switch (event.target.name) {
            case this.nameField: {
                this.name = value;
                break;
            }
            case this.phoneField: {
                this.phone = value;
                break;
            }
            case this.faxField: {
                this.fax = value;
                break;
            }
        }
    }

    saveContact() {
        const isInputsCorrect = [...this.template.querySelectorAll('lightning-input')]
            .reduce((validSoFar, inputField) => {
                inputField.reportValidity();
                return validSoFar && inputField.checkValidity();
            }, true);
        if (isInputsCorrect) {
            //perform success logic

        }
    }
}