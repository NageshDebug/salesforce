
import { LightningElement, api, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccounts';
import { CurrentPageReference, NavigationMixin } from 'lightning/navigation';

export default class CantAssignReadOnlyProperty1 extends NavigationMixin(LightningElement) {
    @api recordId;
    columns = [
        { label: 'Id', fieldName: 'Id' },
        { label: 'Label', fieldName: 'Name' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' }
    ];

    data = [];
    wrap = {};


    connectedCallback() {
        alert('This is LWC. Account Id -> ' + this.recordId);
        getAccountList()
            .then(result => {
                this.wrap = result;
                let tempData = [];

                for (let i = 0; i < result.selectableAccounts.length; ++i) {
                    tempData.push({
                        Id: result.selectableAccounts[i].account.Id,
                        Name: result.selectableAccounts[i].account.Name,
                        Phone: result.selectableAccounts[i].account.Phone
                    });
                }

                this.data = tempData;
            })
            .catch(result => {
                console.log('Error -> ' + result);
            })
    }

    convertClick1() {
        try {
            let row = this.template.querySelector('lightning-datatable').getSelectedRows();
            let accountId = row[0].Id;
            let tempWrap = this.wrap;

            for (let i = 0; i < tempWrap.selectableAccounts.length; ++i) {
                if (accountId == tempWrap.selectableAccounts[i].account.Id) {
                    tempWrap.selectableAccounts[i].selected = true;
                    alert(tempWrap.selectableAccounts[i].selected);
                }
            }

            this.wrap = tempWrap;
            console.log('this.wrap -> ' + this.wrap);
        } catch (err) {
            console.log(err.message);
        }
    }

    convertClick() {
        let row = this.template.querySelector('lightning-datatable').getSelectedRows();
        let accountId = row[0].Id;

        // This is right solution. it can solve nested objects through deep cloning.
        let tempWrap = JSON.parse(JSON.stringify(this.wrap));

        //Note: the solution is: we can assign or spread operator. but they do sallow cloning. so it will fail for nested objects.
        for (let i = 0; i < tempWrap.selectableAccounts.length; ++i) {
            if (accountId == tempWrap.selectableAccounts[i].account.Id) {
                tempWrap.selectableAccounts[i].selected = true;
                alert(tempWrap.selectableAccounts[i].selected);
            }
        }

        this.wrap = tempWrap;
        console.log('this.wrap -> ' + this.wrap);
    }

}