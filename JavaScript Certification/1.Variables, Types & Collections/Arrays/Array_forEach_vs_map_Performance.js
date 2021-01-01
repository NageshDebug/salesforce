let numbers = Array(1000000);
numbers.fill(2);

console.time('Map');
let mapArray = numbers.map(element => element * element);
console.timeEnd('Map');

console.time('ForEach-1');
let forEachArray = [];
numbers.forEach((element, index) => forEachArray[index] = element * element);
console.timeEnd('ForEach-1');

console.time('ForEach-2');
numbers.forEach((element, index) => numbers[index] = element * element);
console.timeEnd('ForEach-2');

/**
Which is the best?
----------------------
That depends on the result you want to get.

forEach() may be preferable when you’re not trying to change the data in your array, but instead want to just do something with it – like save it to a database or just display the data:
Example:
                    let names = ['Elon', 'Jeff', 'Mark'];
                    names.forEach((name) => {
                        console.log(name);
                    });
                    // Elon
                    // Jeff
                    // Mark


map() method may be the best way to change the data because it returns a new Array with the data.
And since the return is an Array we can take advantage of this to chain other methods like ( map(), filter(), reduce(), etc.).
Example:
                    let arr = [1, 2, 3, 4, 5];
                    let arr2 = arr.map(num => num * 2).filter(num => num > 5);
                    // arr2 = [6, 8, 10

*/