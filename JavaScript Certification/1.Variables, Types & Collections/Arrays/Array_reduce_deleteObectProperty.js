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