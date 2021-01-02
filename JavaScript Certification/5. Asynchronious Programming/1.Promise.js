//Syntax
new Promise((resolved, rejected) => {
    /*
    # do your asynchronous work here
    # call resolved() when you are done
    # call rejected() if there is an error
    */
}).catch(function (error) {
    //The error thrown is properly caught
    console.error("Error during promise:");
    console.error(error);
});
//Note:
/**
    As you can see, the error is properly caught and can be handled inside the catch() clause. 
    So if you don't need special error handling logic directly inside the promise, you don't necessarily need to include try-catch in it.
 */

//Example-1
function delayedLog(message, milliseconds) {
    return new Promise((resolved, rejected) => {
        if (milliseconds < 0) {
            rejected('timeout cannot be negative!');
        } else if (milliseconds > 5000) {
            throw new Error("Oh dear! Something terrible happened!");
        } else {
            setTimeout(() => {
                console.log(message);
                resolved();
            }, milliseconds);
        }
    });
}

//Case-1: Resolved
delayedLog('first', 1000)
    .then(() => delayedLog('second', 2000))
    .then(() => delayedLog('third', 3000))
    .then(() => delayedLog('fourth', 4000))
    .catch((error) => console.log('An error has occurred: ' + error));


//Case-2: Rejected
delayedLog('first', 1000)
    .then(() => delayedLog('second', 2000))
    .then(() => delayedLog('third', -3000))
    .then(() => delayedLog('fourth', 4000))
    .catch((error) => console.log('An error has occurred: ' + error));
