//https://www.bayanbennett.com/posts/sequential-and-parallel-asynchronous-functions

const fetch = require('node-fetch');

async function getValueA() {
    let json = await fetch('https://tutorialzine.com/misc/files/example.json').then(response => response.json());
    return json;
}

async function getValueB() {
    let json = await fetch('https://tutorialzine.com/misc/files/example.json').then(response => response.json());
    return json;
}

async function getValueC() {
    let json = await fetch('https://tutorialzine.com/misc/files/example.json').then(response => response.json());
    return json;
}

async function getABC_SequenceCall() {
    let A = await getValueA().then(x => x); // let getValueA takes 5 second to finish
    let B = await getValueB().then(x => x); // let getValueB takes 4 second to finish
    let C = await getValueC().then(x => x); // let getValueC takes 3 second to finish  (total time=12 seconds)

    let totalRecords = A.length + B.length + C.length;
    return totalRecords;
}
//getABC_SequenceCall().then(x => console.log('Sync Total Records----->' + x));

async function getABC_ParallelCall() {
    // Promise.all() allows us to send all requests at the same time. 
    let results = await Promise.all([getValueA, getValueB, getValueC]);
    return results.reduce((total, value) => total + value);
}

//getABC_ParallelCall().then(x => console.log('Async Total Records----->' + x));
