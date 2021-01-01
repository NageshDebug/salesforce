let person = {
    firstName: "Nagesh",
    lastName: "Siripurapu",
    age: 34,
}

//Method-1
console.log(person.firstName);
console.log(person.lastName);
console.log(person.age);


//Method-2
console.log(person['firstName']);
console.log(person['lastName']);
console.log(person['age']);


//Method-3
Object.keys(person).forEach(property => console.log(person[property]));
//Object.keys(person).forEach(property => console.log(Object.getOwnPropertyDescriptor(person, property)));
//Object.getOwnPropertyNames(person).forEach(property => console.log(person[property]));
//Object.getOwnPropertyNames(person).forEach(property => console.log(Object.getOwnPropertyDescriptor(person, property)));


//Method-4
Object.entries(person).forEach(element => console.log(person[element[0]]));



//Method-5
Object.values(person).forEach(value => console.log(value));

