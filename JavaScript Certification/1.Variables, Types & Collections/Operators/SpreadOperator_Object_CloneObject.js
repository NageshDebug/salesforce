const obj = { name: 'Nagesh', age: 34 };
const newObj = { ...obj }
console.log(newObj) // { name: 'Nagesh', age: 34 }

newObj.name = 'Haritha';
newObj.course = 'CSE';

console.log(obj);          //original obj doesn't modify
console.log(newObj);
