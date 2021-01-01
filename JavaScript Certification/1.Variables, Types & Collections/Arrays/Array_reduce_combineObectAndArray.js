//Case-1:Combining data from two sources into an array
var wizards = [
    {
        name: 'Harry Potter',
        house: 'Gryfindor'
    },
    {
        name: 'Cedric Diggory',
        house: 'Hufflepuff'
    },
    {
        name: 'Tonks',
        house: 'Hufflepuff'
    },
    {
        name: 'Ronald Weasley',
        house: 'Gryfindor'
    },
    {
        name: 'Hermione Granger',
        house: 'Gryfindor'
    }
];
var points = {
    HarryPotter: 500,
    CedricDiggory: 750,
    RonaldWeasley: 100,
    HermioneGranger: 1270
};

let reducer = (arr, wizard) => {
    // Get the key for the points object by removing spaces from the wizard's name
    var key = wizard.name.replace(' ', '');

    // If the wizard has points, add them
    // Otherwise, set them to 0
    if (points[key]) {
        wizard.points = points[key];
    } else {
        wizard.points = 0;
    }

    // Push the wizard object to the new array
    arr.push(wizard);

    // Return the array
    return arr;

}
var wizardsWithPoints = wizards.reduce(reducer, []);
console.log(wizardsWithPoints);

//Case-2: Combining data from two sources into an object
let reducer1 = (obj, wizard) => {

    // Get the key for the points object by removing spaces from the wizard's name
    var key = wizard.name.replace(' ', '');

    // If the wizard has points, add them
    // Otherwise, set them to 0
    if (points[key]) {
        wizard.points = points[key];
    } else {
        wizard.points = 0;
    }

    // Remove the name property
    delete wizard.name;

    // Add wizard data to the new object
    obj[key] = wizard;

    // Return the array
    return obj;

}
var wizardsAsAnObject1 = wizards.reduce(reducer1, {});
console.log(wizardsAsAnObject1);
//-------------------------------------------------------------------------------------------------------------------
const pokemon = [
    { name: "charmander", type: "fire" },
    { name: "squirtle", type: "water" },
    { name: "bulbasaur", type: "grass" }
]
const getMapFromArray = data =>
    data.reduce((acc, item) => {
        // add object key to our object i.e. charmander: { type: 'water' }
        acc[item.name] = { type: item.type };
        return acc;
    }, {});

console.log(getMapFromArray(pokemon));
/**
 {
    charmander: { type: "fire" },
    squirtle: { type: "water" },
    bulbasaur: { type: "grass" }
}
 */
//---------------------------------------------------------------------------------------------------------
function voterResults(arr) {
    const initialVotes = {
        youngVotes: 0,
        youth: 0,
        midVotes: 0,
        mids: 0,
        oldVotes: 0,
        olds: 0,
    }
    const peersToVotePeers = {
        youth: "youngVotes",
        mids: "midVotes",
        olds: "oldVotes",
    }
    return arr.reduce((acc, voter) => {
        if (voter.age < 26)
            peers = "youth"
        else if (voter.age < 36) {
            peers = "mids"
        } else {
            peers = "olds"
        }
        if (!voter.voted) {
            return { ...acc, [peers]: acc[peers] + 1 }
        } else {
            const votePeers = peersToVotePeers[peers];
            return {
                ...acc,
                [peers]: acc[peers] + 1,
                [votePeers]: acc[votePeers] + 1,
            }
        }
    }, initialVotes)
}
const voters = [
    { name: "Bob", age: 30, voted: true },
    { name: "Jake", age: 32, voted: true },
    { name: "Kate", age: 25, voted: false },
    { name: "Sam", age: 20, voted: false },
    { name: "Phil", age: 21, voted: true },
    { name: "Ed", age: 55, voted: true },
    { name: "Tami", age: 54, voted: true },
    { name: "Mary", age: 31, voted: false },
    { name: "Becky", age: 43, voted: false },
    { name: "Joey", age: 41, voted: true },
    { name: "Jeff", age: 30, voted: true },
    { name: "Zack", age: 19, voted: false },
]
console.log(voterResults(voters));