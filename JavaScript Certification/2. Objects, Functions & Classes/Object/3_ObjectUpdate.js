let person = {
    firstName: "Nagesh",
    lastName: "Siripurapu",
    age: 34,
}
console.log(person);

//Method-1
person.age = 35;
console.log(person);


//Method-2
person['age'] = 36;
console.log(person);


//Method-3
Object.defineProperty(person, "age", { value: 37 });
console.log(person);