let numbers = [25, 49, 36, 4];
let newarray = numbers.map(myFunction)
console.log(newarray);

function myFunction(num) {
    return num * 10;
}


let fun1 = num => num * 10;
newarray = numbers.map(fun1)
console.log(newarray);

newarray = numbers.map(num => num * 10)
console.log(newarray);

//--------------------------------------------------------------------------------
newarray = numbers.map(Math.sqrt);
console.log(newarray);

//newarray = numbers.map(Math.floor(Math.sqrt)); wont work
newarray = numbers.map(element => Math.floor(Math.PI * element * element));
console.log(newarray);
//--------------------------------------------------------------------------------
const celsius = [-15, -5, 0, 10, 16, 20, 24, 32]
const fahrenheit = celsius.map(t => t * 1.8 + 32);
console.log(fahrenheit); // fahrenheit is [5, 23, 32, 50, 60.8, 68, 75.2, 89.6]
//------------------------------------------------------------------------------
let persons = [
    { firstname: "Nagesh", lastname: "Siripurapu" },
    { firstname: "Haritha", lastname: "Sappa" },
    { firstname: "Sanvi", lastname: "Siripurapu" }
];

let fullName = person => `${person.firstname} ${person.lastname}`;
persons = persons.map(fullName);
console.log(persons);
//-----------------------------------------------------------------------------------------------------------------
const myUsers = [
    { name: 'shark', likes: 'ocean' },
    { name: 'turtle', likes: 'pond' },
    { name: 'otter', likes: 'fish biscuits' }
]

const usersByLikes = myUsers.map(item => {
    const container = {};

    container[item.name] = item.likes;
    container.age = item.name.length * 10;

    return container;
})

console.log(usersByLikes);
//-----------------------------------------------------------------------------------------------------------------
// What you have
var officers = [
    { id: 20, name: 'Captain Piett' },
    { id: 24, name: 'General Veers' },
    { id: 56, name: 'Admiral Ozzel' },
    { id: 88, name: 'Commander Jerjerrod' }
];
//How do we get only ids
//Solution-1:
let officersList = [];
officers.forEach(officer => officersList.push(officer.id));
console.log(officersList);

//Solution-2: No need to create array explicitly
let officersIds = officers.map(officer => officer.id);
console.log(officersIds);
//-----------------------------------------------------------------------------------------------------------------
const employees = [
    { name: "Adam", salary: 5000, bonus: 500, tax: 1000 },
    { name: "Noah", salary: 8000, bonus: 1500, tax: 2500 },
    { name: "Fabiano", salary: 1500, bonus: 500, tax: 200 },
    { name: "Alireza", salary: 4500, bonus: 1000, tax: 900 },
];

// calculate the net amout to be given to the employees
const calcAmt = obj => {
    newObj = {};
    newObj.name = obj.name;
    newObj.netEarning = obj.salary + obj.bonus - obj.tax;
    return newObj;
};

let newArr = employees.map(calcAmt);
console.log(newArr);
