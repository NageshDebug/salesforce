const names = ['John', 'Peter', 'James', 'Pammy'];
const myName = names.filter(name => name.includes('am'));
console.log(myName)
//---------------------------------------------------------------
let cities = [
    { name: 'Los Angeles', population: 3792621 },
    { name: 'New York', population: 8175133 },
    { name: 'Chicago', population: 2695598 },
    { name: 'Houston', population: 2099451 },
    { name: 'Philadelphia', population: 1526006 }
];
let bigCities = cities.filter(city => city.population > 3000000);
console.log(bigCities);


cities
    .filter(city => city.population < 3000000)
    .sort((c1, c2) => c1.population - c2.population)
    .map(city => console.log(`${city.name} : ${city.population}`));
//------------------------------------------------------------------------------
var pilots = [
    {
        id: 2,
        name: "Wedge Antilles",
        faction: "Rebels",
    },
    {
        id: 8,
        name: "Ciena Ree",
        faction: "Empire",
    },
    {
        id: 40,
        name: "Iden Versio",
        faction: "Empire",
    },
    {
        id: 66,
        name: "Thane Kyrell",
        faction: "Rebels",
    }
];
//Filter the Rebels and Empires
const rebels = pilots.filter(pilot => pilot.faction === "Rebels");
console.log(rebels);

const empire = pilots.filter(pilot => pilot.faction === "Empire");
console.log(empire);
//----------------------------------------------------------------------------
const characters = [
    { name: 'James T. Kirk', series: ['Star Trek'] },
    { name: 'Spock', series: ['Star Trek', 'Star Trek: The Next Generation'] },
    { name: 'Jean-Luc Picard', series: ['Star Trek: The Next Generation'] },
    { name: 'Worf', series: ['Star Trek: The Next Generation', 'Star Trek: Deep Space Nine'] }
];

const tngCharacters = characters.filter(character => character.series.includes('Star Trek: The Next Generation'));
console.log(tngCharacters);
//---------------------------------------------------------------------------------------------------
var data = [
    { id: 1, string: "Lets go home" },
    { id: "John is better than me", string: "I'm ok" },
    { id: "last but not least", string: "for sure" },
];
data = data.filter(item => !item.string.includes("Lets"));
console.log(data);
//--------------------------------------------------------------------------------------------------
const places = ['Africa', 'Asia', 'Europe', 'Australia'];
const overIndex = places.filter((place, index) => index > 1);
console.log(overIndex);
//------------------------------------------------------------------------------------------------
const names = ['Victoria', 'Pearl', 'Olivia', 'Annabel', 'Sandra', 'Sarah'];
const filterItems = letters => names.filter(name => name.indexOf(letters) > -1);
console.log(filterItems('ia')); // ["Victoria", "Olivia"]