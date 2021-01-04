import { LightningElement, wire } from 'lwc';
import {
    subscribe,
    unsubscribe,
    APPLICATION_SCOPE,
    MessageContext
} from "lightning/messageService";

import SAMPLEMC from "@salesforce/messageChannel/NageshMessageChannel__c";

export default class MessageChannelSubscriber1 extends LightningElement {
    @wire(MessageContext)
    messageContext;

    subscription = null;
    receivedMessage;
    isDisabled = false;
    isDisabledUnsb = true;
    subscribeMC() {
        try {
            this.isDisabled = true;
            this.isDisabledUnsb = false;
            console.log('Subscriber1----------------->' + this.subscription);
            if (this.subscription) {
                return;
            }

            this.subscription = subscribe(this.messageContext, SAMPLEMC, message => {
                console.log('Subscriber2----------------->' + message);
                this.handleMessage(message);
            },
                { scope: APPLICATION_SCOPE }
            );
        } catch (err) {
            console.log(err.message);
        }
    }

    unsubscribeMC() {
        unsubscribe(this.subscription);
        this.subscription = null;
        this.isDisabled = false;
        this.isDisabledUnsb = true;
    }

    handleMessage(message) {
        let payload = JSON.stringify(message);
        console.log('Received Message------------->' + payload);
        this.receivedMessage = payload ? payload : 'Not Received';
        console.log('Display Message------------->' + this.receivedMessage);
    }
}