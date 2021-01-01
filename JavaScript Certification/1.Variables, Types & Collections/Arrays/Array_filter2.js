const users = [
    {
        firstName: 'Bob',
        lastName: 'Doe',
        age: 37,
    }, {
        firstName: 'Rita',
        lastName: 'Smith',
        age: 21,
    }, {
        firstName: 'Rick',
        lastName: 'Fish',
        age: 28,
    }, {
        firstName: 'Betty',
        lastName: 'Bird',
        age: 44,
    }, {
        firstName: 'Joe',
        lastName: 'Grover',
        age: 22,
    }, {
        firstName: 'Jill',
        lastName: 'Pill',
        age: 19,
    }, {
        firstName: 'Sam',
        lastName: 'Smith',
        age: 22,
    }
]

const isInTwenties = user => user.age >= 20 && user.age < 30;
const makeFullName = user => `${user.firstName} ${user.lastName}`;
const isAtLeastTenChars = fullName => fullName.length >= 10;

const twentySomethingsLongFullNames = users
    .filter(isInTwenties)
    .map(makeFullName)
    .filter(isAtLeastTenChars);
console.log(twentySomethingsLongFullNames);


const twentySomethingsLongFullNames1 = users

    //  First we filter only the users who are in their twenties:
    .filter(user => user.age >= 20 && user.age < 30)

    //  Concat first and last names:
    .map(user => `${user.firstName} ${user.lastName}`)

    //  Now remove any names that are 9 or less characters
    .filter(fullName => fullName.length >= 10);
console.log(twentySomethingsLongFullNames1);
