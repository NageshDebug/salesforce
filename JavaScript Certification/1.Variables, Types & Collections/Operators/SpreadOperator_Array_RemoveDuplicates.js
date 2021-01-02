let array = [1, 2, 3, 4, 4, 1, 5, 2, 3, 6, 7, 8, 3, 5];
const uniqueElements = [...new Set(array)];
console.log(uniqueElements);



let array1 = [1, 2, 3, 4];
let array2 = [4, 2, 6, 1];
let array3 = [3, 6, 5, 1]
let mergedArray = [...array3, ...array1, ...array2];    //It maintains the order
const uniqueList = [...new Set(mergedArray)]
console.log(uniqueList);