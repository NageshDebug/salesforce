const arrA = [1, 4, 3, 2];
const arrB = [5, 2, 6, 7, 1];

let newArray = [...new Set([...arrA, ...arrB])]; // returns [1, 4, 3, 2, 5, 6, 7]
console.log(newArray);