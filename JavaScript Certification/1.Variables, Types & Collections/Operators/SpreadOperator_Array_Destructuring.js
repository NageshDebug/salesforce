const myArray = ["Nagesh", "Sanvi", "Haritha"];
const [firstName, ...restOfTheNames] = myArray;

console.log(firstName); // Nagesh
console.log(restOfTheNames); // ["Sanvi", "Haritha"]