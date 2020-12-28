import { LightningElement, api, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { updateRecord } from 'lightning/uiRecordApi';
import { createRecord } from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class RecordEditFormDynamicUI extends NavigationMixin(LightningElement) {
    @track accountRecord = {};
    @api recordId;

    //handle load method
    handleLoad(event) {

        //To get the value of form fields on edit form
        if (this.recordId !== undefined) {
            let fields = Object.values(event.detail.records)[0].fields;
            const recordId = Object.keys(event.detail.records)[0];
            this.accountRecord = {
                Id: recordId,
                ...Object.keys(fields)
                    .filter((field) => !!this.template.querySelector(`[data-field=${field}]`))
                    .reduce((total, field) => {
                        total[field] = fields[field].value;
                        return total;
                    }, {})
            };
        }
    }

    //To add the input field value to list
    handleFieldChange(e) {
        this.accountRecord[e.currentTarget.dataset.field] = e.target.value;
    }

    //save method
    handleSubmit() {
        //To create reccord
        if (this.recordId === undefined) {
            let recordInput = { apiName: ACCOUNT_OBJECT.objectApiName, fields: this.accountRecord }
            createRecord(recordInput)
                .then(result => {
                    this.accRecord = {};
                    this.recordId = result.id;

                    // Show success messsage
                    this.dispatchEvent(new ShowToastEvent({
                        title: 'Success!!',
                        message: 'Account Created Successfully!!',
                        variant: 'success'
                    }));
                    this.handleSucess();
                })
                .catch(error => {
                    this.error = JSON.stringify(error);
                });
        }

        //To update the record
        if (this.recordId !== undefined) {
            updateRecord({ fields: this.accountRecord })
                .then(() => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'Account updated',
                            variant: 'success'
                        })
                    );
                    this.handleSucess();
                })
                .catch((error) => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Error creating record',
                            message: error.body.message,
                            variant: 'error'
                        })
                    );
                });
        }
    }

    //Handle sucess method
    handleSucess() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId,
                objectApiName: 'Account',
                actionName: 'view'
            }
        });
    }

}