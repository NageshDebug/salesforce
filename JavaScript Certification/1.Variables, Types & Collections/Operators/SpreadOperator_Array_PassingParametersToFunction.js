let calculateSum = (...array) => array.reduce((sum, value) => sum + value);

console.log(calculateSum(1));
console.log(calculateSum(1, 2));
console.log(calculateSum(1, 2, 3));
console.log(calculateSum(1, 2, 3, 4));
console.log(calculateSum(1, 2, 3, 4, 5));



const numbers = [1, 2, 3]
const addThreeNumbers = (p1, p2, p3) => console.log(p1 + p2 + p3);
addThreeNumbers(...numbers); // 6

const numbers1 = [1, 2, 3, 4, 5]
addThreeNumbers(...numbers1); // 6  consider first 3 and ignore last 2 numbers