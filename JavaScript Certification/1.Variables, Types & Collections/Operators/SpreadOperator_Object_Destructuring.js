let { x, y, ...z } = { x: 1, y: 2, a: 3, b: 4 };
console.log(x); // 1
console.log(y); // 2
console.log(z); // { a: 3, b: 4 }

const person = {
    firstName: "Nagesh",
    lastName: "Siripurapu",
    homeTown: "Gowripatnam"
};

const { firstName, ...restPerson } = person;

console.log(firstName); //Nagesh
console.log(restPerson); //{ lastName: 'Siripurapu', homeTown: 'Gowripatnam' }