let people = [
    { name: "John", age: 21 },
    { name: "Oliver", age: 55 },
    { name: "Michael", age: 55 },
    { name: "Dwight", age: 19 },
    { name: "Oscar", age: 21 },
    { name: "Kevin", age: 55 },
];

let groupBy = (objectArray, property) => {
    let reducer = (accumulator, currentObject) => {
        let key = currentObject[property];
        if (!accumulator[key]) {
            accumulator[key] = [];
        }
        accumulator[key].push(currentObject);
        return accumulator;
    }
    return objectArray.reduce(reducer, {});
}

let groupedPeople = groupBy(people, "age");
console.log(groupedPeople);
//-----------------------------------------------------------------------------------
const users = [
    { id: 11, name: 'Adam', age: 23, group: 'editor' },
    { id: 47, name: 'John', age: 28, group: 'admin' },
    { id: 85, name: 'William', age: 34, group: 'editor' },
    { id: 97, name: 'Oliver', age: 28, group: 'admin' }
];

const groupByAge = users.reduce((acc, it) => {
    acc[it.age] = acc[it.age] + 1 || 1;
    return acc;
}, {});
console.log(groupByAge);// groupByAge is {23: 1, 28: 2, 34: 1}
//--------------------------------------------------------------------------------------------
const uTable = users.reduce((acc, it) => (acc[it.id] = it, acc), {})
console.log(uTable)
/*
{
    11: { id: 11, name: 'Adam', age: 23, group: 'editor' },
    47: { id: 47, name: 'John', age: 28, group: 'admin' },
    85: { id: 85, name: 'William', age: 34, group: 'editor' },
    97: { id: 97, name: 'Oliver', age: 28, group: 'admin' }
}*/
//----------------------------------------------------------------------------------------------
const orders = [
    { id: "1", status: "pending" },
    { id: "2", status: "pending" },
    { id: "3", status: "cancelled" },
    { id: "4", status: "shipped" },
];

let result = orders.reduce((acc, order) => {
    return { ...acc, [order.status]: (acc[order.status] || 0) + 1 };
}, {});
console.log(result);