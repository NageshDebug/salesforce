function inc(val) {
    return val + 1;
}
function dec(val) {
    return val - 1;
}

function doubled(val) {
    return val * 2;
}

function halve(val) {
    return val / 2;
}

let pipeline = [inc, halve, dec, doubled];
let res = pipeline.reduce((total, fn) => {
    return fn(total);
}, 9);

// Best Approach
const double = x => x * 2
const triple = x => x * 3
const quadruple = x => x * 4

const pipe = (...funs) => input => funs.reduce(
    (total, fn) => fn(total),
    input
)

const fun1 = pipe(double)
const fun2 = pipe(double, triple)
const fun3 = pipe(triple, triple)
const fun4 = pipe(double, triple, quadruple)

console.log(fun1(2))
console.log(fun2(5))
console.log(fun3(7))
console.log(fun4(9))