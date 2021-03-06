const person = {
    firstName: 'Nagesh',
    lastName: 'Siripurapu',
    country: 'USA',
    city: 'SanJose',
    links: {
        social: {
            twitter: 'https://twitter.com/nagesh',
            facebook: 'https://facebook.com/nagesh.developer',
        },
        web: {
            blog: 'https://nagesh625.blogspot.com'
        }
    }
};

var twitter = person.links.social.twitter;
var facebook = person.links.social.facebook;
console.log(twitter, facebook); // logs the 2 variables


var { twitter, facebook } = person.links.social;
console.log(twitter, facebook); // logs the 2 variables


var { social: { twitter, facebook }, web: { blog } } = person.links;
console.log(twitter, facebook, blog); // logs the 3 variables

//one more techinque to extract the nodes from the JSON payload
console.log(JSON.stringify(person, ['links', 'social', 'web', 'twitter', 'facebook', 'blog'], 2));
//----------------------------------------------------------------------------------------------------
props = {
    actions: 'create',
    dirty: false,
    form: "Statement",
    action: function () { },
    statement: {
        firstName: "John",
        lastName: "Peter",
        isConfirmed: true
    }
}
const { statement: { isConfirmed }, statement } = props;
console.log(isConfirmed);
console.log(statement);
//----------------------------------------------------------------------------------------------------
// Object for testing
const x = { y: { z: { a: 1, b: 2 } } }

// Get "b"
//const { y: { z: { b } } } = x;

//console.log(b); // 2
//console.log(z); // z is not defined
//console.log(y); // y is not defined

const { y, y: { z: { b } } } = x;

console.log(b); // 2
console.log(y); // {z: {…}}