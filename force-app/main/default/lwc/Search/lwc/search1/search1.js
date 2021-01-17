import { LightningElement } from 'lwc';

import serachAccs from '@salesforce/apex/AccountController.retriveAccs';

// datatable columns
const columns = [
    {
        label: 'Name',
        fieldName: 'Name',
        type: 'text',
    }, {
        label: 'Industry',
        fieldName: 'Industry',
    }, {
        label: 'Phone',
        fieldName: 'Phone',
        type: 'phone',
    }, {
        label: 'Type',
        fieldName: 'Type',
        type: 'text'
    },
];
export default class Search1 extends LightningElement {
    searchData;
    columns = columns;
    errorMsg = '';
    strSearchAccName = '';


    handleAccountName(event) {
        this.strSearchAccName = event.detail.value;
    }

    handleSearch() {
        if (!this.strSearchAccName) {
            this.errorMsg = 'Please enter account name to search.';
            this.searchData = undefined;
            return;
        }

        serachAccs({ strAccName: this.strSearchAccName })
            .then(result => {
                this.searchData = result;
                console.log(this.searchData);
            })
            .catch(error => {
                this.searchData = undefined;
                console.log('error =====> ' + error);
                //console.log('error2 =====> ' + JSON.stringify(error));
                this.errorMsg = 'Error occured';
            })
    }

}