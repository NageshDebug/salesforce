//Static way
const noPassword = ({ password, ...rest }) => rest
const user = {
    id: 100,
    name: 'Nagesh',
    password: 'Password!'
}

let objWithoutPassword = noPassword(user) //=> { id: 100, name: 'Nagesh' }
console.log(objWithoutPassword);
//---------------------------------------------------------------
//Dynamic Way
const removeProperty = prop => ({ [prop]: _, ...rest }) => rest

const removePassword = removeProperty('password');
objWithoutPassword = removePassword(user) //=> { id: 100, name: 'Nagesh' }
console.log(objWithoutPassword);

const removeId = removeProperty('id');
let objWithoutId = removeId(user) //=> { name: 'Nagesh', password: 'Password!' }
console.log(objWithoutId);