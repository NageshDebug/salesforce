const arrA = [1, 4, 3, 2];
const arrB = [5, 2, 6, 7, 1];

let newArray = arrA.filter(it => arrB.includes(it)); // returns [1, 2]
console.log(newArray);