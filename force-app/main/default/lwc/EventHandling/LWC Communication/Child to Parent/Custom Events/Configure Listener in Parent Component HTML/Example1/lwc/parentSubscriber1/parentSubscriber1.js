import { LightningElement } from 'lwc';

export default class ParentSubscriber1 extends LightningElement {
    answer = "Child: ";
    question = "Parent: Have you completed study for today?";

    handleAnswer(event) {
        console.log("res-->" + event.detail);
        const res = event.detail;
        this.answer = this.answer + res;
    }
}