/**
 The last scenario is when you want to call multiple similar promises, but you are interested just in whatever 
 comes first.

The syntax is similar to Promise.any(), but you use Promsie.race() instead.

Only the result of the first resolved promise is passed into then() but all the promises still resolve. 
But their result is just ignored.
 */
let promise1 = new Promise(resolve => setTimeout(() => {
    console.log("Promise 1 resolved!");
    resolve(1)
}, 1000));
let promise2 = new Promise(resolve => setTimeout(() => {
    console.log("Promise 2 resolved!");
    resolve(2)
}, 500));
let promise3 = new Promise(resolve => setTimeout(() => {
    console.log("Promise 3 resolved!");
    resolve(3)
}, 1500));

Promise.race([
    promise1,
    promise2,
    promise3
]).then((result) => {
    console.log("All DONE!")
    console.log(result);
});