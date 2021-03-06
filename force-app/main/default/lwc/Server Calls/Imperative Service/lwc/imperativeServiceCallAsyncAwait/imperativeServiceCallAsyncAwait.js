import { LightningElement } from 'lwc';

import getTextMethod1 from '@salesforce/apex/ContactController.getTextMethod1';
import getTextMethod4 from '@salesforce/apex/ContactController.getTextMethod4';
import getTextMethod5 from '@salesforce/apex/ContactController.getTextMethod5';

export default class ImperativeServiceCallAsyncAwait extends LightningElement {

    connectedCallback() {
        this.invokeApexMethods();
    }

    async invokeApexMethods() {
        try {
            const result1 = await getTextMethod1();
            console.log('Method1 result: ' + result1);
            const result2 = await getTextMethod4({
                message1: result1
            });
            console.log('Method4 result: ' + result2);
            const result3 = await getTextMethod5({
                message2: result2
            });
            console.log('Method5 result: ' + result3);
        } catch (error) {
            console.log(error);
        } finally {
            console.log('Finally Block');
        }
    }
}