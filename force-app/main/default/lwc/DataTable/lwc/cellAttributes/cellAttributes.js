import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccountList'
const COLUMNS = [
    {
        label: 'Account Name', fieldName: 'Name', cellAttributes: {
            class: { fieldName: 'accountColor' }
        }
    },
    {
        label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency', cellAttributes: {
            class: { fieldName: 'amountColor' },
            iconName: { fieldName: 'iconName' }, iconPosition: 'right'
        }
    },
    {
        label: 'Industry', fieldName: 'Industry', type: 'text', cellAttributes: {
            class: { fieldName: 'industryColor' }
        }
    },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
]
export default class CellAttributes extends LightningElement {
    tableData
    columns = COLUMNS

    @wire(getAccounts)
    accountsHandler({ data, error }) {
        if (data) {
            this.tableData = data;
            /*this.tableData = data.map(item => {
                let amountColor = item.AnnualRevenue < 500000 ? "slds-text-color_error" : "slds-text-color_success"
                let iconName = item.AnnualRevenue < 500000 ? "utility:down" : "utility:up"
                return {
                    ...item,
                    "amountColor": amountColor,
                    "iconName": iconName,
                    "industryColor": "slds-icon-custom-custom12 slds-text-color_default",
                    "accountColor": "datatable-orange"
                }
            })*/
            console.log(this.tableData)
        }
        if (error) {
            console.error(error)
        }
    }

}