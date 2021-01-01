//Link to Install FETCH and run locally: https://codemag.com/article/2003031
//Other useful links
//https://stackabuse.com/making-http-requests-in-node-js-with-node-fetch/
//



//https://stackfive.io/blog/using-async-await-with-reduce
//https://css-tricks.com/why-using-reduce-to-sequentially-resolve-promises-works/
//https://medium.com/@thakur.khyati70/using-reduce-with-nested-async-await-8fc9c4dcbff1
//https://gyandeeps.com/array-reduce-async-await/

const fetch = require('node-fetch');

const asyncThingsToDo = [
    { task: 'wait', duration: 1000 },
    { task: 'fetch', url: 'https://httpstat.us/200' },
    { task: 'wait', duration: 2000 },
    { task: 'fetch', url: 'https://urlecho.appspot.com/echo?body=Awesome!' },
];

function asyncTimeout(delay) {
    return (new Promise(resolve => { setTimeout(() => resolve(delay), delay) }))
        .then(d => `Waited ${d} seconds`);
}

function asyncFetch(url) {
    return fetch(url)
        .then(response => (response.text()))
        .then(text => `Fetched ${url}, and got back ${text}`);
}

function runTask(spec) {
    return (spec.task === 'wait')
        ? asyncTimeout(spec.duration)
        : asyncFetch(spec.url);
}

//Parallel Solution
async function executeInParallel() {
    const tasks = asyncThingsToDo.map(runTask); // Run all our tasks in parallel.
    const results = await Promise.all(tasks);     // Gather up the results.
    results.forEach(x => console.log(x));         // Print them out on the console.   
}
executeInParallel();

//Sequential Solution
async function executeInSequence() {
    const starterPromise = Promise.resolve(null);
    const log = result => console.log(result);
    await asyncThingsToDo.reduce(
        (p, spec) => p.then(() => runTask(spec).then(log)),
        starterPromise
    );
}
executeInSequence();

//Another way - Sequence calls
const getFirstUserData = () => {
    return fetch('/users.json') // get users list
        .then(response => response.json()) // parse JSON
        .then(users => users[0]) // pick first user
        .then(user => fetch(`/users/${user.name}`)) // get user data
        .then(userResponse => userResponse.json()) // parse JSON
}
//getFirstUserData()

//Another Way -  Sequence
const getFirstUserDataAsync = async () => {
    const response = await fetch('/users.json') // get users list
    const users = await response.json() // parse JSON
    const user = users[0] // pick first user
    const userResponse = await fetch(`/users/${user.name}`) // get user data
    const userData = await userResponse.json() // parse JSON
    return userData
}
//getFirstUserDataAsync()
//------------------------------------------------------------------------------------------------------------

//Multiple async functions in series
const promiseToDoSomething = () => {
    return new Promise(resolve => {
        setTimeout(() => resolve('I did something'), 10000)
    })
}

const watchOverSomeoneDoingSomething = async () => {
    const something = await promiseToDoSomething()
    return something + '\nand I watched'
}

const watchOverSomeoneWatchingSomeoneDoingSomething = async () => {
    const something = await watchOverSomeoneDoingSomething()
    return something + '\nand I watched as well'
}

watchOverSomeoneWatchingSomeoneDoingSomething().then(res => {
    console.log(res)
})
//--------------------------------------------------
const functions = [
    async function () { return 1; },
    async function () { return 2; },
    async function () { return 3; }
];

// Chain the function calls in order, starting with an empty promise.
// In the end, `res` is equivalent to
// `Promise.resolve().then(fn1).then(fn2).then(fn3)`
async function asyncChaining() {
    const res = await functions.reduce((promise, fn) => promise.then(fn), Promise.resolve());
    console.log(res);
}
asyncChaining();