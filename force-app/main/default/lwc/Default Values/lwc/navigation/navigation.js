import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class Navigation extends NavigationMixin(LightningElement) {

    createRecordWithDefaultValues() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'new'
            },
            state: {
                nooverride: '1',
                defaultFieldValues: "Name=Test LWC Acc,AccountNumber=123456,Rating=Hot,Phone=1234568975"
            }
        });
    }
}