
import { LightningElement, api } from 'lwc';

export default class RecordEditForm extends LightningElement {
    @api recordId;
    cardTitle = 'New Contact';

    handleSuccess() {
        const evt = new ShowToastEvent({
            title: "Success!",
            message: "The Contact's record has been successfully saved.",
            variant: "success",
        });
        this.dispatchEvent(evt);
    }
}
