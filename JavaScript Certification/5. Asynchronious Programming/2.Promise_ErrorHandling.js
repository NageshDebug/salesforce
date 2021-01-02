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

delayedLog('first', 1000)
    .then(() => delayedLog('third', 6000))
    .then(() => delayedLog('fourth', 4000))  //It will skip. 
    .catch((error) => console.log('An error has occurred: ' + error)); // it will execute
//----------------------------------------------------------------------------------------------
function delayedLog1(message, milliseconds) {
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
    }).catch(function (error) {
        //The error thrown is properly caught
        console.error("Error during promise:");
        console.error(error);
    });
}

delayedLog1('first', 1000)
    .then(() => delayedLog1('third', 6000))
    .then(() => delayedLog1('fourth', 4000)) // it will execute
    .catch((error) => console.log('An error has occurred: ' + error)); // it will skip, because of catch block during promise declaration


