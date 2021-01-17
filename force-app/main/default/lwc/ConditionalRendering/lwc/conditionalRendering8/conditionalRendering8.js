import { LightningElement, track, wire } from 'lwc';
import getAccountDataList from '@salesforce/apex/AccountController.getAccountDataList';
import getAccountList from '@salesforce/apex/AccountController.getAccountList';

// datatable columns for search records
const columns = [
    {
        label: 'Name',
        fieldName: 'Name',
        type: 'text'

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

export default class ConditionalRendering8 extends LightningElement {

    //Apex wire Method to a Property
    @wire(getAccountDataList) accountObj;

    //Apex wire Method to a function
    @track accountNames;
    @track errors;
    @wire(getAccountDataList)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accountNames = data;
        } else if (error) {
            this.errors = error;
        }
    }

    //Call an Apex Method Imperatively
    @track accounts;
    @track error;

    handleLoad() {
        getAccountDataList()
            .then(result => {
                this.accounts = result;
            })
            .catch(error => {
                this.error = error;
            });
    }

    // Implement search record functionality
    @track searchData;
    @track columns = columns;
    @track errorMsg = '';
    @track strSearchAccName = '';

    handleAccountName(event) {
        this.strSearchAccName = event.detail.value;
    }

    handleSearch() {
        if (this.strSearchAccName.trim() != null && this.strSearchAccName.trim() !== '') {
            getAccountList({ searchKey: this.strSearchAccName })
                .then(result => {
                    this.searchData = result;
                })
                .catch(error => {
                    this.errorMsg = error;
                });
        }

    }
}