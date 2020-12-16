import { LightningElement } from 'lwc';
import throwUncommitedError from '@salesforce/apex/LightningUncommitedWorkPendingExample.throwUncommitedError';
import performDML from '@salesforce/apex/LightningUncommitedWorkPendingExample.performDML';
import performHttpCallout from '@salesforce/apex/LightningUncommitedWorkPendingExample.performHttpCallout';

export default class ThrowUncommitedError extends LightningElement {
    performCallout() {
        throwUncommitedError({})
            .then(result => {
                if (result) {
                    console.log(result);
                }
            })
            .catch(error => {
                console.log('Error: ', error);
            })
    }

    performAllCallouts() {
        performDML({})
            .then(result => {
                if (result) {
                    //Now that the dml Apex call has passed we can perform the Http callout
                    performHttpCallout({})
                        .then(result => {
                            //Callout is complete
                            console.log('Return from callout: ', result);
                        })
                        .catch(error => {
                            console.log('Error Occured: performHttpCallout' + JSON.stringify(error));
                        })
                }
            })
            .catch(error => {
                console.log('Error Occured: performDML' + JSON.stringify(error));
            })
    }
}