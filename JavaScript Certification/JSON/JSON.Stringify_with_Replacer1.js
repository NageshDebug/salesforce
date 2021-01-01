const replacer = (key, value) =>
    value instanceof Object && !(value instanceof Array) ?
        Object.keys(value)
            .sort()
            .reduce((sorted, key) => {
                sorted[key] = value[key];
                return sorted
            }, {}) :
        value;

// Usage
console.log(JSON.stringify({ c: 1, a: { d: 0, c: 1, e: { a: 0, 1: 4 } } }, replacer, 2));