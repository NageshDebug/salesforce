import { LightningElement } from 'lwc';

/**
    Note-1: we can configure listeners in both HTML and Javascript together. But constructor will execute first.
            So Javascript listener will execute first than HTML listener.

    Note-2: In Child component bubble attribute should be true. parent component didnt receive the event to listen.
 */
export default class ParentSubscriber2 extends LightningElement {
    answer = "Child: ";
    question = "Parent: Have you completed study for today?";

    constructor() {
        super();
        this.template.addEventListener('answer', this.handleAnswer.bind(this));
    }

    handleAnswer(event) {
        /*eslint-disable-next-line*/
        console.log("res--&gt;" + event.detail);
        const res = event.detail;
        this.answer = this.answer + res;
    }
}