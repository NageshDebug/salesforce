/**
 Another scenario is when you have multiple promises and you need to run them all. Only after ALL are done, 
 you want to do something. However, the promises are not dependent and can run in parallel with each other.

 What's important to note is that even though promises resolve in order 2,1,3 (because of the different timeouts set), 
 the result array is in the same order as what you put in Promise.all(), that is 1,2,3. 
 Otherwise, it would be hard to tell which result belongs to which promise.
 */
const promise1 = new Promise(resolve => setTimeout(() => {
    console.log("Promise 1 resolved!");
    resolve(1)
}, 1000));
const promise2 = new Promise(resolve => setTimeout(() => {
    console.log("Promise 2 resolved!");
    resolve(2)
}, 500));
const promise3 = new Promise(resolve => setTimeout(() => {
    console.log("Promise 3 resolved!");
    resolve(3)
}, 1500));

Promise.all([
    promise1,
    promise2,
    promise3
]).then((results) => {
    console.log("All DONE!")
    console.log(results);
});