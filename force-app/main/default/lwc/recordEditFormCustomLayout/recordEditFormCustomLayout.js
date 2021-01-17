import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class RecordEditFormCustomLayout extends NavigationMixin(LightningElement) {
    redirect = true;
    resetpage = false;
    handleSuccess(event) {
        const even = new ShowToastEvent({
            title: 'Success!',
            message: 'Record created!',
            variant: 'success'
        });
        this.dispatchEvent(even);
        if (this.redirect == true) {
            console.log('handleSuccess' + this.redirect);
            let creditnoteId = event.detail.id;
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: creditnoteId,
                    objectApiName: 'Account',
                    actionName: 'view'
                }
            })
        }
        if (this.resetpage == true) {
            this.handleReset();
        }
    }

    handleError(event) {
        const evt = new ShowToastEvent({
            title: 'Error!',
            message: event.detail.detail,
            variant: 'error',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }

    saveAndNewClick() {
        this.redirect = false;
        this.template.querySelector('lightning-record-edit-form').submit(this.fields);
        this.resetpage = true;
    }

    handleReset() {
        const inputFields = this.template.querySelectorAll(
            'lightning-input-field'
        );
        if (inputFields) {
            inputFields.forEach(field => {
                field.reset();
            });
        }
    }

    handleCancel(event) {
        var url = window.location.href;
        var value = url.substr(0, url.lastIndexOf('/') + 1);
        window.history.back();
        return false;
    }
}