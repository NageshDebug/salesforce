let nums = [1, 2, 3, 4, 5];
let average = nums.reduce((a, b) => (a + b)) / nums.length;
console.log(average);

const victorianSlang = [
    {
        term: 'doing the bear',
        found: true,
        popularity: 108,
    },
    {
        term: 'katterzem',
        found: false,
        popularity: null,
    },
    {
        term: 'bone shaker',
        found: true,
        popularity: 609,
    },
    {
        term: 'smothering a parrot',
        found: false,
        popularity: null,
    },
    {
        term: 'damfino',
        found: true,
        popularity: 232,
    },
    {
        term: 'rain napper',
        found: false,
        popularity: null,
    },
    {
        term: 'donkey’s breakfast',
        found: true,
        popularity: 787,
    },
    {
        term: 'rational costume',
        found: true,
        popularity: 513,
    },
    {
        term: 'mind the grease',
        found: true,
        popularity: 154,
    },

];

//Method-1
let popularitySum = 0;
let itemsFound = 0;
const len = victorianSlang.length;
let item = null;
for (let i = 0; i < len; i++) {
    item = victorianSlang[i];
    if (item.found) {
        popularitySum = item.popularity + popularitySum;
        itemsFound = itemsFound + 1;
    }
}
const averagePopularity = popularitySum / itemsFound;
console.log("Average popularity:", averagePopularity);


// Method-2
let isFound = item => item.found;
let getPopularity = item => item.popularity;
let addScores = (runningTotal, popularity) => runningTotal + popularity;

// Filter out terms that weren't found in books.
const foundSlangTerms = victorianSlang.filter(isFound);

// Extract the popularity scores so we just have an array of numbers.
const popularityScores = foundSlangTerms.map(getPopularity);

// Add up all the scores total. Note that the second parameter tells reduce to start the total at zero.
const scoresTotal = popularityScores.reduce(addScores, 0);

// Calculate the average and display.
const averagePopularity2 = scoresTotal / popularityScores.length;
console.log("Average popularity:", averagePopularity2);
//-----------------------------------------------------------------------------------------------
//Method-3
let addScores3 = ({ totalPopularity, itemCount }, popularity) => {
    return {
        totalPopularity: totalPopularity + popularity,
        itemCount: itemCount + 1,
    };
}
const initialInfo = { totalPopularity: 0, itemCount: 0 };
const popularityInfo = victorianSlang
    .filter(isFound)
    .map(getPopularity)
    .reduce(addScores3, initialInfo);

// Calculate the average and display.
const { totalPopularity, itemCount } = popularityInfo;
const averagePopularity3 = totalPopularity / itemCount;
console.log("Average popularity:", averagePopularity3);
//------------------------------------------------------------------------------------------------------
//Method-4
// Helpers
const filter = p => a => a.filter(p);
const map = f => a => a.map(f);
const prop = k => x => x[k];
const reduce = r => i => a => a.reduce(r, i);
const compose = (...fns) => (arg) => fns.reduceRight((arg, fn) => fn(arg), arg);

// Lift for functions.
// See: https://jrsinclair.com/articles/2019/compose-js-functions-multiple-parameters/
const lift = f => g => h => x => f(g(x))(h(x));

// Calculations
// ----------------------------------------------------------------------------

// We'll create a sum function that adds all the items of an array together.
const sum = reduce((a, i) => a + i)(0);

// A function to get the length of an array.
const length = a => a.length;

// A function to divide one number by another.
const div = a => b => a / b;

// We use compose() to piece our function together using the small helpers.
// With compose() you read from the bottom up.
const calcPopularity = compose(
    lift(div)(sum)(length),
    map(prop('popularity')),
    filter(prop('found')),
);

const averagePopularity4 = calcPopularity(victorianSlang);
console.log("Average popularity:", averagePopularity4);
//----------------------------------------------------------------------------------------------------
//Method-5
// Average function
// ----------------------------------------------------------------------------
function averageScores({ avg, n }, slangTermInfo) {
    if (!slangTermInfo.found) {
        return { avg, n };
    }
    return {
        avg: (slangTermInfo.popularity + n * avg) / (n + 1),
        n: n + 1,
    };
}

// Calculations
// ----------------------------------------------------------------------------
// Calculate the average and display.
const initialVals = { avg: 0, n: 0 };
const averagePopularity5 = victorianSlang.reduce(averageScores, initialVals).avg;
console.log("Average popularity:", averagePopularity5);