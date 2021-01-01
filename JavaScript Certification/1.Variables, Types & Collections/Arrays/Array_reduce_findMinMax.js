const people = [
    { id: "1", name: "Leigh", age: 35 },
    { id: "2", name: "Jenny", age: 30 },
    { id: "3", name: "Heather", age: 28 },
];

let maxValue = people.reduce((acc, person) => {
    if (acc === null || person.age > acc) return person.age;
    return acc;
}, null);

let minValue = people.reduce((acc, person) => {
    if (acc === null || person.age < acc) return person.age;
    return acc;
}, null);

console.log(maxValue);
console.log(minValue);


const dates = [
    '2019/06/01',
    '2018/06/01',
    '2019/09/01', // This is the most recent date, but how to find it?
    '2018/09/01'
];
const arrayDates = dates.map(v => new Date(v));
const maxDate = arrayDates.reduce((max, d) => d > max ? d : max, arrayDates[0]);
console.log(maxDate);