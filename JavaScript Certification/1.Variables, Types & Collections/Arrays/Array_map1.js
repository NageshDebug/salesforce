const users = [
    { id: 11, name: 'Adam', age: 23, group: 'editor' },
    { id: 47, name: 'John', age: 28, group: 'admin' },
    { id: 85, name: 'William', age: 34, group: 'editor' },
    { id: 97, name: 'Oliver', age: 28, group: 'admin' }
];

let newUsers = users.map(({ id, age, group }) => `\n${id} ${age} ${group}`).join('')
console.log(newUsers);
/*
"
11 23 editor
47 28 admin
85 34 editor
97 28 admin"*/