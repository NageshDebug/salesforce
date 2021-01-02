let myArr = [9, 3, 7, 4, 9, 11, 19];

let fn = v => v % 2 === 0;
let result = myArr.find(fn);  // returns first matched element
console.log(result);


let index = myArr.findIndex(fn);  // returns first matched element
console.log(index);
