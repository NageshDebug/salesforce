const plus3 = x => x + 3

const double = x => x * 2

const minus5 = x => x - 5

const result = [plus3, double, minus5].reduce((value, nextFunction) => nextFunction(value), 0)
console.log(result)

const reduceRight = [plus3, double, minus5].reduceRight((value, nextFunction) => nextFunction(value), 0)
console.log(reduceRight)
//----------------------------------------------------------------------------------------------------
const peopleArr = [
    {
        username: 'glestrade',
        displayname: 'Inspector Lestrade',
        email: 'glestrade@met.police.uk',
        authHash: 'bdbf9920f42242defd9a7f76451f4f1d',
        lastSeen: '2019-05-13T11:07:22+00:00',
    },
    {
        username: 'mholmes',
        displayname: 'Mycroft Holmes',
        email: 'mholmes@gov.uk',
        authHash: 'b4d04ad5c4c6483cfea030ff4e7c70bc',
        lastSeen: '2019-05-10T11:21:36+00:00',
    },
    {
        username: 'iadler',
        displayname: 'Irene Adler',
        email: null,
        authHash: '319d55944f13760af0a07bf24bd1de28',
        lastSeen: '2019-05-17T11:12:12+00:00',
    },
];
function notEmptyEmail(x) {
    return (x.email !== null) && (x.email !== undefined);
}

function getLastSeen(x) {
    return x.lastSeen;
}

function greater(a, b) {
    return (a > b) ? a : b;
}

const peopleWithEmail = peopleArr.filter(notEmptyEmail);
const lastSeenDates = peopleWithEmail.map(getLastSeen);
const mostRecent = lastSeenDates.reduce(greater, '');

console.log(mostRecent);
//------------------------------------------------
/**
 Above code is perfectly readable and it works. For the sample data, it’s just fine. 
 But if we had an enormous array, then there’s a chance we might start running into memory issues. 
 
 This is because we use a variable to store each intermediate array. If we modify our reducer callback, 
 then we can do everything in one pass:
 * */
function notEmptyEmail(x) {
    return (x.email !== null) && (x.email !== undefined);
}

function greater(a, b) {
    return (a > b) ? a : b;
}
function notEmptyMostRecent(currentRecent, person) {
    return (notEmptyEmail(person))
        ? greater(currentRecent, person.lastSeen)
        : currentRecent;
}

const mostRecent1 = peopleArr.reduce(notEmptyMostRecent, '');

console.log(mostRecent1);
// ⦘ 2019-05-13T11:07:22+00:00