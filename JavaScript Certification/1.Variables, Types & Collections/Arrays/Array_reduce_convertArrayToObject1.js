let users = [
    { id: 1, name: 'John', age: 25, occupation: 'gardener' },
    { id: 2, name: 'Lenny', age: 51, occupation: 'programmer' },
    { id: 3, name: 'Andrew', age: 43, occupation: 'teacher' },
    { id: 4, name: 'Peter', age: 52, occupation: 'gardener' },
    { id: 5, name: 'Anna', age: 43, occupation: 'teacher' },
    { id: 6, name: 'Albert', age: 46, occupation: 'programmer' },
    { id: 7, name: 'Adam', age: 47, occupation: 'teacher' },
    { id: 8, ame: 'Robert', age: 32, occupation: 'driver' }
];


let obj = users.reduce((total, e) => {

    const { id, ...attrs } = e;

    return { ...total, [id]: attrs, };
}, {});


console.log(obj);