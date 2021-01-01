var pets = ['dog', 'chicken', 'cat', 'dog', 'chicken', 'chicken', 'rabbit'];

var petCounts = pets.reduce((obj, pet) => {
    if (obj[pet]) {
        obj[pet]++;
    } else {
        obj[pet] = 1;
    }
    return obj;
}, {});

console.log(petCounts);//{ dog: 2, chicken: 3, cat: 1, rabbit: 1 }
//--------------------------------------------------------------------------------
var petCount = pets.reduce((acc, word) => {
    acc[word] = (acc[word] || 0) + 1;
    return acc;
}, {});
console.log(petCount); //{ dog: 2, chicken: 3, cat: 1, rabbit: 1 }