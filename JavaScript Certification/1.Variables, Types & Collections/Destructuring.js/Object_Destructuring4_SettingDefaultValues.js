let person = {
    firstName: 'Nagesh',
    lastName: 'Siripurapu',
    currentAge: 28
};

let {
    firstName,
    lastName,
    middleName = '', // assign new value
    currentAge: newAge = 18 //Alias and assign together
} = person;

console.log(firstName);
console.log(lastName);
console.log(middleName); // ''
console.log(newAge); // 18