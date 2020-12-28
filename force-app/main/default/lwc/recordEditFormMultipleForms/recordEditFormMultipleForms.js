import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class RecordEditFormMultipleForms extends LightningElement {
    @track error = false;

    handleSave() {
        // Submit the forms
        this.template
            .querySelectorAll("lightning-record-edit-form")
            .forEach(form => form.submit());

        // Show success/error message
        if (this.error) {
            const event = new ShowToastEvent({
                title: 'Error!',
                message: 'Some error occured. Please try again.',
                variant: 'error'
            });
            this.dispatchEvent(event);
        } else {
            const event = new ShowToastEvent({
                title: 'Success',
                message: 'Accounts saved successfully.',
                variant: 'success'
            });
            this.dispatchEvent(event);
        }
        //Reset the fields
        this.template.querySelectorAll("lightning-input-field")
            .forEach(input => input.reset());
    }

    handleError(event) {
        this.error = true;
    }
}