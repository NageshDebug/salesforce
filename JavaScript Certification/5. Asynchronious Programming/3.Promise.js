// using CommonJS modules
const fetch = require('node-fetch');

const targetUrl = "http://www.example.com/persons";
const invalidTargetUrl = "http://www.exampile.com/persons";

// Callback function to be called when successfully finished
const callbackSuccessFunction = (x) => console.log("Received Success Response!" + JSON.stringify((x)));

// Callback function to be called when successfully finished
const callbackErrorFunction = (x) => console.log("Error Occured." + x);

// Callback function to be called when successfully finished
const callbackFinallyFunction = () => console.log("All Done!");

// Call the backend. httpClient.get returns a promise
fetch(targetUrl)
    .then(x => callbackSuccessFunction(x))
    .catch(x => callbackErrorFunction(x))
    .finally(callbackFinallyFunction);


// Call the backend. httpClient.get returns a promise
fetch(invalidTargetUrl)
    .then(callbackSuccessFunction)
    .catch(x => callbackErrorFunction(x))
    .finally(callbackFinallyFunction);


