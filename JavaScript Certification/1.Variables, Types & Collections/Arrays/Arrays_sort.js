let users = [{ name: "John", age: 30, car: null },
{ name: "Carlos", age: 25, car: "Toyota" },
{ name: "Brendan", age: 65, car: "BMW" },
{ name: "Carol", age: 34, car: "Mercedez" },
{ name: "Conway", age: 36, car: "Mazda" }]

users
    .filter(user => user.age > 30)
    .sort((c1, c2) => c1.name - c2.name)
    .map(user => console.log(user.name + ': ' + user.car));
/*
Brendan: BMW
Carol: Mercedez
Conway: Mazda
*/