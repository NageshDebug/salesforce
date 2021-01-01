let person = {
    firstName: "Nagesh",
    lastName: "Siripurapu",
    age: 34,
}

//method-1
person = {};
console.log(person);


//Method-2
person = undefined;
console.log(person);


//Method-3
person = null;
console.log(person);


//Method-4
delete person;
console.log(person);


