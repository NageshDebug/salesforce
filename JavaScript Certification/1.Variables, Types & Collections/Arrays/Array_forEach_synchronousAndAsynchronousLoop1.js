function print(n) {
    console.log(n);
}

function test() {
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].forEach(print);
}

//test();  // prints 0 to 9
//-----------------------------------------------------------
async function print1(n) {
    // Wait 1 second before printing 0, 0.9 seconds before printing 1, etc.
    await new Promise(resolve => setTimeout(() => resolve(), 1000 - n * 100));
    // Will usually print 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 but order is not strictly
    // guaranteed.
    console.log(n);
}
async function test() {
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].forEach(print);
}

//test(); // prints 9 to 0
//----------------------------------------------------------------------------
async function print(n) {
    await new Promise(resolve => setTimeout(() => resolve(), 1000 - n * 100));
    console.log(n);
}

async function test() {
    // This is where the magic happens. Each `print()` call returns a promise,so calling `then()` chains them together in order and prints 0-9 in order.
    await [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].reduce((promise, n) => promise.then(() => print(n)), Promise.resolve());
}
test();
