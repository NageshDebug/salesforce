import { LightningElement } from 'lwc';
import startContinuation from '@salesforce/apexContinuation/ApexContinuation1.startConinuation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ApexMultipleContinuationForLWC extends LightningElement {
    result;
    isLoading = true;

    connectedCallback() {
        startContinuation()
            .then(result => {
                this.result = result;
                this.isLoading = false;
            })
            .catch(error => {
                this.displayErrorToast(error.body.message);
                this.isLoading = false;
            });
    }

    displayErrorToast(message) {
        const evt = new ShowToastEvent({
            message: message,
            variant: 'error'
        });
        this.dispatchEvent(evt);
    }
}