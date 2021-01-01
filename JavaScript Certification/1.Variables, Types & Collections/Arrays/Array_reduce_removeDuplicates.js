//https://javascriptio.com/view/889090/return-ternary-operator-in-javascript-reduce
let ageGroup = [18, 21, 1, 1, 51, 18, 21, 5, 18, 7, 10];

let reducer = (accumulator, currentValue) => {
    if (accumulator.indexOf(currentValue) === -1) {
        accumulator.push(currentValue);
    }
    return accumulator;
};

let uniqueAgeGroup = ageGroup.reduce(reducer, []);
console.log(uniqueAgeGroup); // [ 18, 21, 1, 51, 5, 7, 10 ]
//-------------------------------------------------------------------------------------------------------
const uniqueValues = [...new Set(ageGroup)];
console.log(uniqueValues);// [ 18, 21, 1, 51, 5, 7, 10 ]
//-------------------------------------------------------------------------------------------------------
const filtered = ageGroup.filter((item, index) => ageGroup.indexOf(item) === index);
console.log(filtered);// [ 18, 21, 1, 51, 5, 7, 10 ]

