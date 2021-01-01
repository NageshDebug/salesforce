const people = [
    { id: "1", name: "Leigh", age: 35 },
    { id: "2", name: "Jenny", age: 30 },
    { id: "3", name: "Heather", age: 28 },
];
let result = people.reduce((acc, person) => {
    if (acc) return true;
    return person.age > 18;
}, false);
console.log(result);