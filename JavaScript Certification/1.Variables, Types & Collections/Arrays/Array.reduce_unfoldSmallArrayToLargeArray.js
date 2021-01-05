const fileLines = [
    'Inspector Algar,Inspector Bardle,Mr. Barker,Inspector Barton',
    'Inspector Baynes,Inspector Bradstreet,Inspector Sam Brown',
    'Monsieur Dubugue,Birdy Edwards,Inspector Forbes,Inspector Forrester',
    'Inspector Gregory,Inspector Tobias Gregson,Inspector Hill',
    'Inspector Stanley Hopkins,Inspector Athelney Jones'
];

function splitLineReducer(acc, line) {
    return acc.concat(line.split(/,/g));
}
const investigators = fileLines.reduce(splitLineReducer, []);
//console.log(investigators);

//---------------------------------------------------------
function flatMap(f, arr) {
    const reducer = (acc, item) => acc.concat(f(item));
    return arr.reduce(reducer, []);
}

const investigators1 = flatMap(x => x.split(','), fileLines);
console.log(investigators1);