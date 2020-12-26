import { LightningElement } from 'lwc';

export default class OnChangeHandler3 extends LightningElement {
    dateFieldValue;
    dateTimeFieldValue;
    timeFieldValue;
    colorFieldValue;
    fileUploadValue;
    textFieldValue;
    emailFieldValue;
    passwordFieldValue;
    phoneFieldValue;
    urlFieldValue;
    numberFieldValue;
    checkBoxFieldValue;
    checkBoxButtonFieldValue;
    toogleFieldValue;
    searchFieldValue;
    handleChange(event) {
        var value;
        if (event.target.type === 'checkbox' || event.target.type === 'checkbox-button' || event.target.type === 'toggle') {
            value = event.target.checked;
        } else {
            value = event.target.value;
        }
        if (event.target.dataset.id === 'dateField') {
            this.dateFieldValue = value;
        } else if (event.target.dataset.id === 'datetimeField') {
            this.dateTimeFieldValue = value;
        } else if (event.target.dataset.id === 'timeField') {
            this.timeFieldValue = value;
        } else if (event.target.dataset.id === 'colorField') {
            this.colorFieldValue = value;
        } else if (event.target.dataset.id === 'fileField') {
            this.fileUploadValue = value;
        } else if (event.target.dataset.id === 'textField') {
            this.textFieldValue = value;
        } else if (event.target.dataset.id === 'emailField') {
            this.emailFieldValue = value;
        } else if (event.target.dataset.id === 'passwordField') {
            this.passwordFieldValue = value;
        } else if (event.target.dataset.id === 'phoneField') {
            this.phoneFieldValue = value;
        } else if (event.target.dataset.id === 'urlField') {
            this.urlFieldValue = value;
        } else if (event.target.dataset.id === 'numberField') {
            this.numberFieldValue = value;
        } else if (event.target.dataset.id === 'checkboxField') {
            this.checkBoxFieldValue = value;
        } else if (event.target.dataset.id === 'checkbox-buttonField') {
            this.checkBoxButtonFieldValue = value;
        } else if (event.target.dataset.id === 'toggleField') {
            this.toogleFieldValue = value;
        } else if (event.target.dataset.id === 'searchField') {
            this.searchFieldValue = value;
        }
    }
}


