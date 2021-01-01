let person = {
    firstName: "Nagesh",
    lastName: "Siripurapu",
    age: 34,
}
Object.seal(person);
console.log(Object.isSealed(person)); // return true

//I can update the values
person.age = 35;
console.log(person.age);

// In strict mode this will throw a `TypeError`. we can't add new properties
person.grade = "CSE";
console.log(person);

//we can't delete properties
delete person.age;
console.log(person); 