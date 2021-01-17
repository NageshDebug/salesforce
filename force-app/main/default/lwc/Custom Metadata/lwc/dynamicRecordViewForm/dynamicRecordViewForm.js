import { LightningElement, api, wire } from 'lwc';

import listAllFields2 from '@salesforce/apex/FieldSetHelper.listAllFields2';

export default class DynamicRecordViewForm extends LightningElement {
    @api objectApiName;
    @api recordId;
    //Name,AccountNumber,Phone,Fax,Industry
    @api fieldNames;

    columnsArray = [];

    @wire(listAllFields2, { objName: '$objectApiName', columnsName: '$fieldNames', rowCount: 5, incrementCount: 5, viewMore: true })
    wiredFields({ error, data }) {
        if (data) {
            console.log(data);
            this.columnsArray = data.fieldDetails;
        }

        if (error) {
            console.log(error);
        }
    }

    get isDataAvailable() {
        return this.recordId != null && this.columnsArray.length > 0;
    }
}