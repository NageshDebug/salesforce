let vals = [88, 28, 0, 9, 389, 420];

let reversed = vals.reduce((total, next) => { return [next, ...total] }, []);

console.log(reversed);