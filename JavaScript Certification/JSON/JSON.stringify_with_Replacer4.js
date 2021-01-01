function replacer(key, value) {
    if (value < 1000) {
        return undefined;
    }
    return value;
}

var reviews = {
    books: 5000,
    cars: 3000,
    house: 999,
    boat: 2000
};
json = JSON.stringify(reviews, replacer);
console.log(json);
//{"books":5000,"cars":3000,"boat":2000}

json = JSON.stringify(json, ['books', 'house', 'boat']);
console.log(json);
//{"books":5000,"house":999,"boat":2000}