import { LightningElement } from 'lwc';

import getTextMethod1 from '@salesforce/apex/ContactController.getTextMethod1';
import getTextMethod2 from '@salesforce/apex/ContactController.getTextMethod2';
import getTextMethod3 from '@salesforce/apex/ContactController.getTextMethod3';

export default class ImperativeServiceCallPromiseChainingHell extends LightningElement {

    connectedCallback() {
        this.invokeApexMethods();
    }

    invokeApexMethods() {
        getTextMethod1()
            .then((result1) => {
                console.log('Method1 result: ' + result1);
                getTextMethod2({
                    message1: result1
                }).then((result2) => {
                    console.log('Method2 result: ' + result2);
                    getTextMethod3({
                        message2: result2
                    }).then((result3) => {
                        console.log('Method3 result: ' + result3);
                    }).catch((error => {
                        console.log(error);
                    }));
                }).catch((error => {
                    console.log(error);
                }));
            })
            .catch((error) => {
                console.log(error);
            })
            .finally(() => {
                console.log('Finally Block');
            })
    }
}