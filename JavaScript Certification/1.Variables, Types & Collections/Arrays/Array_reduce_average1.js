let vals = [1, 2, 3, 4, 5];

let average = vals.reduce((total, next, idx, array) => {

    total += next;

    if (idx === array.length - 1) {
        return total / array.length;
    } else {
        return total;
    }
});

console.log(average);