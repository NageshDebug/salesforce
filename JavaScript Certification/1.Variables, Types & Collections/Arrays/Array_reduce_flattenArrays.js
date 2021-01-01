const nested = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
let flat = nested.reduce((acc, it) => [...acc, ...it], []);
console.log(flat);

//we can omit default array
let flat1 = nested.reduce((acc, it) => [...acc, ...it]);
console.log(flat1);

//-----------------------------------------------------------------------------------------------
function flattenArray(data) {
    // our initial value this time is a blank array
    const initialValue = [];

    // call reduce on our data
    return data.reduce((total, value) => {
        // if the value is an array then recursively call reduce
        // if the value is not an array then just concat our value
        return total.concat(Array.isArray(value) ? flattenArray(value) : value);
    }, initialValue);
}
console.log(flattenArray(nested));
//----------------------------------------------------------------------------------------------------------
let flatten = (acc, element) => {
    if (Array.isArray(element)) {
        return element.reduce(flatten, acc);
    }
    return [...acc, element];
}

let result = nested.reduce(flatten, []);
console.log(result);