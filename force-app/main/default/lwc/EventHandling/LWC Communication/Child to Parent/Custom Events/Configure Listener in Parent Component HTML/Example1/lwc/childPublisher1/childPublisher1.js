import { LightningElement } from 'lwc';

export default class ChildPublisher1 extends LightningElement {
    handleResponse(event) {
        event.target.disabled = true;
        const btnName = event.target.label;
        const answerEvent = new CustomEvent("answer", { detail: btnName });
        this.dispatchEvent(answerEvent);
    }
}