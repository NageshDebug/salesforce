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
//-----------------------------------------------------------------------------------------------------------
const student = {
    name: 'John Doe',
    age: 16,
    scores: {
        maths: 74,
        english: 63
    }
};

// We define 3 local variables: name, maths, science
const { name, scores: { maths, science = 50 } } = student;
console.log(`${name} scored ${maths} in Maths and ${science} in Elementary Science.`);