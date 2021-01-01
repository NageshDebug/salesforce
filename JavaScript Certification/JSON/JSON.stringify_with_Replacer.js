let reducer = (key, value) => {
    if (key === "age") {
        return value + ' years';
    }
    return value;
}

var obj = { name: "foo", id: 1, age: 45 };
let jsonString = JSON.stringify(obj, reducer);
console.log(jsonString); // outputs: "{"name":"foo","id":1,"age":"45 years"}"
//-----------------------------------------------------------------------------------
const user = {
    id: 229,
    name: 'Sammy',
    email: 'Sammy@domain.com'
};

let replacer1 = (key, value) => {
    if (key === 'email') {
        return undefined;
    }
    return value;
}

const userStr = JSON.stringify(user, replacer1, 2);
console.log(userStr);// "{"id":229,"name":"Sammy"}"
//--------------------------------------------------------------------------------------
const obj1 = { a: 1, b: 2, c: 3, d: { e: 4 } };

// `replacer` increments every number value by 1. The output will be:
// '{"a":2,"b":3,"c":4,"d":{"e":5}}'
let str = JSON.stringify(obj1, function replacer(key, value) {
    if (typeof value === 'number') {
        return value + 1;
    }
    return value;
});
console.log(str);
//------------------------------------------------------------------------------------------
const obj2 = {
    name: 'Nagesh',
    password: 'stargazer',
    nested: {
        hashedPassword: 'c3RhcmdhemVy'
    }
};

// '{"name":"Nagesh","nested":{}}'
let str1 = JSON.stringify(obj2, function replacer(key, value) {
    console.log('Replacer Function Called With Key:' + key);
    // This function gets called 5 times. `key` will be equal to:
    // '', 'name', 'password', 'nested', 'hashedPassword'
    if (key.match(/password/i)) {
        return undefined;
    }
    return value;
});
console.log(str1);

