let vals = [1, 2, 3, 4, 5];

let mapped = vals.reduce((total, next) => { total.push(next * 2); return total }, []);
console.log(mapped);