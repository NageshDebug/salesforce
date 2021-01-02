// Returning multiple default values using array
const func1 = (firstName = 'Nagesh', lastName = 'Siripurapu') => {
    return [firstName, lastName];
}
const [firstName, lastName] = func1();
console.log(firstName, lastName);


// Returning multiple default values using object
const func2 = (firstName = 'Nagesh', lastName = 'Siripurapu') => {
    return { firstName: firstName, lastName: lastName };
}
const { firstName: fName, lastName: lName } = func2();
console.log(fName, lName);