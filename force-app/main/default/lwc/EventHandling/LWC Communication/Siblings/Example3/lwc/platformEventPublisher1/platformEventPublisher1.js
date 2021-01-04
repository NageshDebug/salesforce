import { LightningElement } from 'lwc';

import publishEvent from '@salesforce/apex/PlatformEvent.publishEvent';

export default class PlatformEventPublisher1 extends LightningElement {
    message;

    handleChange(event) {
        this.message = event.detail.value;
    }

    firePlatformEvent() {
        if (!this.message) {
            return;
        }
        publishEvent({
            message: this.message
        }).then((result) => {
            console.log('Apex Called. Platform Event Fired.');
        }).catch((error) => {
            console.log('Apex error = ' + error);
        })
    }
}