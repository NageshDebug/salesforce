const double = [1, 2, 3, 4].map(x => x * 2)
console.log(double)

//Map Implementation
const doubleFn = item => item * 2
const map = (mappingFunction, array) => array.reduce((acc, item) => {
    return acc.concat(mappingFunction(item))
}, [])
const doubleWithReduce = map(doubleFn, [1, 2, 3, 4])
console.log(doubleWithReduce)
//--------------------------------------------------------------------------------------
const prices = [2.99, 5.99, 7.2, 15, 2000, 0.99]
const priceHigherThan6 = prices.filter(price => price > 6);
console.log(priceHigherThan6);

//Filter Implementation
const filter = (filterFunction, array) => array.reduce((newArray, item) => {
    return filterFunction(item) ? newArray.concat(item) : newArray
}, [])

const pricesOver6 = filter(price => price > 6, prices)
console.log(pricesOver6)
//-----------------------------------------------------------------------------------------------
var wizards = [
    {
        name: 'Harry Potter',
        house: 'Gryfindor'
    },
    {
        name: 'Cedric Diggory',
        house: 'Hufflepuff'
    },
    {
        name: 'Tonks',
        house: 'Hufflepuff'
    },
    {
        name: 'Ronald Weasley',
        house: 'Gryfindor'
    },
    {
        name: 'Hermione Granger',
        house: 'Gryfindor'
    }
];
// Get the names of the wizards in HufflepuffUsing filter and map (2 method calls)
var hufflepuff = wizards.filter(function (wizard) {
    return wizard.house === 'Hufflepuff';
}).map(function (wizard) {
    return wizard.name;
});
console.log(hufflepuff);

// using only reduce method (single call)
var hufflepuff = wizards.reduce(function (newArr, wizard) {
    if (wizard.house === 'Hufflepuff') {
        newArr.push(wizard.name);
    }
    return newArr;
}, []);
console.log(hufflepuff);