import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import SAMPLEMC from '@salesforce/messageChannel/NageshMessageChannel__c';

export default class MessageChannelPublisher1 extends LightningElement {
    @wire(MessageContext)
    messageContext;

    handleClick() {
        try {
            const message = {
                recordId: '001xx000003NGSFAA4' + Date.now(),
                message: "This is simple message from LWC",
                source: "LWC",
                recordData: { accountName: 'Burlington Textiles Corp of America' }
            };

            publish(this.messageContext, SAMPLEMC, message);
            console.log('Publisher-------------->' + message);

        } catch (err) {
            console.log(err.message);
        }
    }
}