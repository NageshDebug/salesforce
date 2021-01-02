var person = {
    firstName: 'Nagesh',
    lastName: 'Siripurapu',
    age: 34,
    course: 'CSE',
    company: 'paypal'
};

var address = {
    city: 'SanJose',
    state: 'California',
}
//Add 'country' property to Address
var address = { ...address, country: 'USA' }


//Add 'address' property newPerson
var newPerson = { ...person, address: address }
console.log(newPerson);

//----------------------------------------------------------------

var person = {
    firstName: "Nagesh",
    lastName: "Siripurapu",
    homeTown: "USA"
};

var overwritten = {
    ...person,
    homeTown: "INDIA"
};

console.log(overwritten);