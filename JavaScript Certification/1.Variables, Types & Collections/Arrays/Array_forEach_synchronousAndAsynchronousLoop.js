//Synchronous loop
let array = [];
for (var i = 0; i < array.length; i++) {
    var item = array[i];
    // do something with item
}

//OR

array.forEach((item) => {
    // do something with item
});
//-----------------------------------------------------------------------------------------------
//Asynchronous loop
function delay() {
    return new Promise(resolve => setTimeout(resolve, 300));
}

async function delayedLog(item) {
    // notice that we can await a function that returns a promise
    await delay();
    console.log(item);
}
async function processArray(array) {
    array.forEach(async (item) => { await delayedLog(item); })
    console.log('Done!');
}
//processArray([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
//--------------------------------------------------------------------------------------------------------------
//Process array in sequence
async function processArray1(array) {
    for (const item of array) {
        await delayedLog(item);
    }
    console.log('Done!');
}
//processArray1([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
//--------------------------------------------------------------------------------------------------
//Method-1: Process array in parallel
async function processArray2(array) {
    // map array to promises
    const promises = array.map(delayedLog);
    // wait until all promises are resolved
    await Promise.all(promises);
    console.log('Done!');
}
//processArray2([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
//---------------------------------------------------------------------------------------------------
//Method-2: Process array in parallel
async function processArray3(array) {
    // This is where the magic happens. Each `delayedLog()` call returns a promise,so calling `then()` chains them together in order and prints 0-9 in order.
    await array.reduce((promise, n) => promise.then(() => delayedLog(n)), Promise.resolve());
    console.log('Done!');
}
processArray3([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);

//Note
/**
 This code will run many delayLog tasks in parallel. But be careful with very large array (too many tasks in parallel can be too heavy for CPU or memory).

 Also don’t confuse “parallel” here with real threads and paralleling. That code will not guarantee real parallelism of execution.
 It depends on your item function (delayedLog in this demo). Network requests, webworkers and some other tasks can be executed in parallel.
 */
