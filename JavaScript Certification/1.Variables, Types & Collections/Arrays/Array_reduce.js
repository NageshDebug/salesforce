var pilots = [
    {
        id: 10,
        name: "Poe Dameron",
        years: 14,
    },
    {
        id: 2,
        name: "Temmin 'Snap' Wexley",
        years: 30,
    },
    {
        id: 41,
        name: "Tallissan Lintra",
        years: 16,
    },
    {
        id: 99,
        name: "Ello Asty",
        years: 22,
    }
];
//How to get total years
const totalYears = pilots.reduce((acc, pilot) => acc + pilot.years, 0);
//console.log(totalYears);


//Find most experienced pilot
var mostExpPilot = pilots.reduce((oldest, pilot) => (oldest.years || 0) > pilot.years ? oldest : pilot, {});
//console.log(mostExpPilot);

//-------------------------------------------------------------------------------------------------------
const posts = [
    { id: 1, category: "frontend", title: "All About That Sass" },
    { id: 2, category: "backend", title: "Beam me up, Scotty: Apache Beam tips" },
    { id: 3, category: "frontend", title: "Sanitizing HTML: Going antibactirial on XSS attacks" }
];

const categoryPosts = posts.reduce((acc, post) => {
    let { id, category } = post;
    return { ...acc, [category]: [...(acc[category] || []), id] };
}, {});
console.log(categoryPosts);
//--------------------------------------------------------------------------
const people = [
    { id: "1", name: "Leigh", age: 35 },
    { id: "2", name: "Jenny", age: 30 },
    { id: "3", name: "Heather", age: 28 },
];
let result = people.reduce((acc, person) => [...acc, person.name], []);
console.log(result);

let result1 = people.reduce((acc, person) => {
    return { ...acc, [person.id]: person };
}, {});
console.log(result1);
