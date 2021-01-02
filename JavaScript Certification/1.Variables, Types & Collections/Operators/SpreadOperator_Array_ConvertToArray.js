//Example-1
//Convert NodeList to Array
var divs = [...document.querySelectorAll('div')]

//OR

//Convert arguments to Array
var divs = Array.from(document.querySelectorAll('div'));

//OR

const nodeList = document.querySelectorAll("div");
const classNames = Array.from(nodeList, node => node.className);


//Example-2
const nodeList = document.getElementsByClassName("pokemon");
const array = [...nodeList];

console.log(nodeList); //Result: HTMLCollection [ div.pokemon, div.pokemon ]
console.log(array); //Result: Array [ div.pokemon, div.pokemon ]


//Example-3
//Convert Arguments to Array
function something() {
    var args = Array.from(arguments);

    // Array['yes', 1, {}]
}
something('yes', 1, {});



//Example-4
const nodeList = document.querySelectorAll("div");
const array = [].slice.call(nodeList);