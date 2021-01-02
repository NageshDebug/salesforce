let callback1 = (x) => x + 8;
let callback2 = (x) => x * 2;
let callback3 = (x) => console.log("The total result is: " + x);
let errorCallback = (x) => console.log(x);

function PromiseChaining(num) {
    return new Promise(function (resolve, reject) {
        if (isNaN(num)) {
            throw Error('Input is Invalid.');
        }
        resolve(num);
    })
}

//Case-1
PromiseChaining(42).then(callback1).then(callback2).then(callback3);

//Case-2
let promise = PromiseChaining(42);
promise = promise.then(callback1);
promise = promise.then(callback2);
promise.then(callback3);

//Note: v.v.v imp
let promise1 = PromiseChaining(42);
promise1.then((result) => {
    return result + 8;
});

promise1.then((result) => {
    return result * 2;
});

promise1.then((result) => {
    console.log("The total result is: " + result);
});
/**
 Any guess what will happen? Instead of running promises one after another, you just provide multiple handlers to the same promise.
 Each of them will be executed independently after the promise resolves. The total result will still be 42.
 */



//Case-3
PromiseChaining('fdfdfdfdfgg').then(callback1).then(callback2).then(callback3).catch(x => errorCallback(x));


//Note: What will happen???
new Promise(function (resolve, reject) {
    setTimeout(() => resolve(1), 2000);
}).then((result) => {
    alert(result);
    return result + 2;
}).then((result) => {
    throw new Error('FAILED HERE');
    alert(result);
    return result + 2;
}).then((result) => {
    alert(result);
    return result + 2;
}).catch((e) => {
    console.log('error: ', e)
});

/**
 Here’s what happens:
        Our Promise resolves after 2 seconds with a value of 1

        This value is passed to the first .then() and alerted to the screen. 2 is added and a new value of 3 is passed to the second .then()

        A new Error is thrown. Execution stops immediately and the Promise resolves to a rejected state.

        .catch() receives our error value and logs it to the screen.
 */