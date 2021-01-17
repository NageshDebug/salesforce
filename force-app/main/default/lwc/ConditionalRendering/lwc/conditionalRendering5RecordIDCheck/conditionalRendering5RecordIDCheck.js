import { LightningElement } from 'lwc';

export default class ConditionalRendering5RecordIDCheck extends LightningElement {
    strCaseId;

    // This is called once the Case is created successfully.
    handleSuccess(event) {
        try {
            event.preventDefault();
            this.strCaseId = event.detail.id;
        } catch (error) {
            console.log('Error occured::::' + error.message);
        }

    }
}