const hero = {
    name: 'Captain America',
    email: 'captainamerica@mcu.com',
    designation: 'Super Hero'
};

const heroStr = JSON.stringify(hero);

let obj = JSON.parse(heroStr, (key, value) => {
    if (typeof value === 'string') {
        return value.toUpperCase();
    }
    return value;
});

console.log(obj);