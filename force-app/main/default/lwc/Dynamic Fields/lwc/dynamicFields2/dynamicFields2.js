import { LightningElement, track, api } from 'lwc';

export default class DynamicFields2 extends LightningElement {
    @track listOfFields;
    @api strName; //.split=> ['Name','Phone','Website'];
    @api recordId;
    @api objectApiName;


    handleSuccess(event) {
        console.log('Record Saved successfully');
    }

    connectedCallback() {
        if (this.strName) {
            var fnames = this.strName;
            this.listOfFields = fnames.split(',').map((fld) => fld.trim());
        }
    }
}