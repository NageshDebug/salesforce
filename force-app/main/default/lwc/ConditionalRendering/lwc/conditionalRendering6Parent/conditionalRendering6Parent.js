import { LightningElement, track } from 'lwc';

export default class ConditionalRendering6Parent extends LightningElement {
    currentAccount;

    @track lstAccounts = [
        {
            'Name': 'Cristiano Ronaldo',
            'Email': 'abc@example.com'
        },
        {
            'Name': 'Lionel Messi',
            'Email': 'xyz@exmaple.com'
        },
        {
            'Name': 'Sachin Tendulkar',
            'Email': 'pqr@example.com'
        }
    ];

    @track listValues = [
        { label: 'Cristiano Ronaldo', value: 'Cristiano Ronaldo' },
        { label: 'Lionel Messi', value: 'Lionel Messi' },
        { label: 'Sachin Tendulkar', value: 'Sachin Tendulkar' }
    ];

    accountChanged(event) {
        this.currentAccount = event.detail.value;
    }

}