let person1 = {
    firstName: "Nagesh",
    lastName: "Siripurapu",
    age: 34,
}

//Method-1: Deep Clone
let person2 = person1;
person2.age = 35;

console.log(person1);
console.log(person2);


//Method-2: if we want to skip functions during cloning.
let person3 = JSON.parse(JSON.stringify(person1));
person3.age = 36;

console.log(person1);
console.log(person3);


//Method-3: Shallow Copy
let person4 = Object.assign({}, person1);
person4.age = 37;

console.log(person1);
console.log(person4);


