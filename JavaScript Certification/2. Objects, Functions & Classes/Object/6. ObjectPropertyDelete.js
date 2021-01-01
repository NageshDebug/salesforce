//Method-1
const student = {
    name: "Nagesh",
    age: 34,
    score: {
        maths: 95,
        science: 90
    }
}
// Deleting a property from an object
delete student.age
delete student["score"]
console.log(student) // {name: "Nagesh"}

/*
console.log(student.age) // undefined

/*
if (delete student.age) {
    console.log("Removed 'age' property from student");
} else {
    console.log("Failed to remove 'age' property, perhaps it doesn't exist?");
}*/
//----------------------------------------------------------------------------------------
//Method-2
//This method returns the new object after deleting the property
const car = {
    brand: "Ford",
    color: "blue",
    yearOfManufacturing: 2019
}
const { yearOfManufacturing, ...rest } = car;
console.log(rest); // {brand: "Ford", color: "blue"}
//--------------------------------------------------------------------------------------------
//Method-3
//Remove all numeric value properties
const developer = {
    name: "Fred",
    dailyCoffeIntake: 2,
    favoriteLanguage: "Haskell",
    age: 27
};

const keysToKeep = Object.keys(developer).filter(
    (key) => {
        return !Number.isInteger(developer[key])
    });

const newDeveloper = {};
keysToKeep.forEach((key) => {
    newDeveloper[key] = developer[key]
});
console.log(newDeveloper); // {name: "Fred", favoriteLanguage: "Haskell"}
//---------------------------------------------------------------------------------------------------------
//Method-4
const dog = {
    name: "Sandy",
    age: 3,
    emoji: "🐶"
}

const newDog = Object.keys(dog).reduce((accumulator, key) => {
    // Copy all except emoji
    if (key !== "emoji") {
        accumulator[key] = dog[key]
    }
    return accumulator
}, {})
console.log(newDog) // {name: "Sandy", age: 3}
//----------------------------------------------------------------------------
//Method-5
const user = {
    id: 1234567890,
    name: 'Nagesh',
    blog: 'nagesh625.blogspot.com'
};

let replacer1 = (key, value) => {
    if (key === 'blog') {
        return undefined;
    }
    return value;
}

const userStr = JSON.stringify(user, replacer1, 2);
console.log(userStr);// "{"id":229,"name":"Sammy"}"
