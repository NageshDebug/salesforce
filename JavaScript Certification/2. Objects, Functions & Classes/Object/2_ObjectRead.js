let person = {
    firstName: "Nagesh",
    lastName: "Siripurapu",
    age: 34,
}

//Method-1
console.log(person.firstName);
console.log(person.lastName);
console.log(person.age);

//Problem with Method-1
const myObject = {
    "title": "Debug",
    "$title": "Debug",
    "_title": "Debug",
    "title9": "Debug",
    "title.name": "Debug",
    "title-name": "Debug",
    "5title": "Debug",
}
//valid identifiers
console.log(myObject.title); //Debug
console.log(myObject.$title); //Debug
console.log(myObject._title); //Debug
console.log(myObject.title9); //Debug

//not valid identifiers
console.log(myObject.title.name); //undefined
//console.log(myObject.title-name); //NaN
//console.log(myObject.5title); // throws SyntaxError: Unexpected number


//Method-2
console.log(person['firstName']);
console.log(person['lastName']);
console.log(person['age']);

//Method-1 problem solved by Method-2
console.log(myObject['title.name']); //Debug
console.log(myObject['title-name']); //Debug
console.log(myObject['5title']); //Debug

//we can use this method when the property is dynamic, i.e. it can be changed during program execution.
const myForm = {
    input_1: "Name",
    input_2: "Last Name",
    input_3: "Age",
}

let size = Object.keys(myForm).length;
for (let i = 1; i < size + 1; i++) {
    console.log(myForm["input_" + i]);
}



//Method-3
Object.keys(person).forEach(property => console.log(person[property]));
//Object.keys(person).forEach(property => console.log(Object.getOwnPropertyDescriptor(person, property)));
//Object.getOwnPropertyNames(person).forEach(property => console.log(person[property]));
//Object.getOwnPropertyNames(person).forEach(property => console.log(Object.getOwnPropertyDescriptor(person, property)));


//Method-4
Object.entries(person).forEach(element => console.log(person[element[0]]));



//Method-5
Object.values(person).forEach(value => console.log(value));


//Method-6 Object Destructuring
const stu = { name: 'Nagesh', age: 34, course: 'CSE' };
const { course, age } = stu;
console.log(course);
console.log(age); 
