let array1 = [1, 2, 3];
let array2 = [4, 5, 6];
let array3 = [7, 8, 9, 10]

let mergedArray = [...array3, ...array1, ...array2];    //It maintains the order
console.log(mergedArray);