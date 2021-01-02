const person = {
    firstName: 'Nagesh',
    lastName: 'Siripurapu',
    country: 'USA',
    city: 'SanJose',
    blog: 'nagesh625.blogspot.com'
};
//Old Style
var lastName = person.lastName;
var country = person.country;
var blog = person.blog;

console.log(lastName);
console.log(country);
console.log(blog);


//New Style
var { lastName, country, blog } = person;
console.log(lastName);
console.log(country);
console.log(blog);