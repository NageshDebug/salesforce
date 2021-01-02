function delayedLog(message, milliseconds) {
    return new Promise((resolved, rejected) => {
        if (milliseconds < 0) {
            rejected('timeout cannot be negative!');
        }
        else {
            setTimeout(() => {
                console.log(message);
                resolved();
            }, milliseconds);
        }
    });
}

async function test() {
    try {
        await delayedLog('first', 1000);
        await delayedLog('second', 2000);
        await delayedLog('third', -3000);
        await delayedLog('fourth', 4000);
    } catch (error) {
        console.log('An error has occurred: ' + error);
    }
}
test();