import { LightningElement, api, track, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getFieldDetails from '@salesforce/apex/FieldSetHelper.getFieldDetails';
export default class CustomMetadataRecordEditForm extends NavigationMixin(LightningElement) {
    @api recordId;
    @api objectApiName;

    @api objectName;
    @api buttonLabel;
    @api typeString;

    @track fieldList;

    @wire(getFieldDetails, { objectAPiName: '$objectName', typeString: '$typeString' })
    wiredFieldList({ error, data }) {
        if (data) {
            this.fieldList = data;
            console.log(data);
        }

        if (error) {
            console.log(error);
        }
    }
    handleSuccess(event) {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                "recordId": event.detail.id,
                "objectApiName": this.objectName,
                "actionName": "view"
            },
        });
        console.log();
    }
}
