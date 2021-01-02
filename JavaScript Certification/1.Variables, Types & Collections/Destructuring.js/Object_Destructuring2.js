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