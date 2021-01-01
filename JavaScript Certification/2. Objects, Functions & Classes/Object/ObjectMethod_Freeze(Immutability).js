let person = {
    firstName: "Nagesh",
    lastName: "Siripurapu",
    age: 34,
}
console.log(person);
Object.freeze(person);
console.log(Object.isFrozen(person));

person.age = 35;
console.log(person);


//Alternate Way
let person1 = Object.create({}, {
    'firstName': {
        value: "Nagesh",
        writable: false,
        enumerable: true,
        configurable: false
    },
    'lastName': {
        value: "Siripurapu",
        writable: false,
        enumerable: true,
        configurable: false
    },
    'age': {
        value: "34",
        writable: false,
        enumerable: true,
        configurable: false
    }
});
person1.firstName = 'Haritha';
person1.lastName = 'Sappa';
person1.age = 36;
console.log(person1);