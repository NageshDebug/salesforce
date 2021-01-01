let dishList = [
    {
        dish: "MARGHERITA",
        description: "Napoli style"
    },
    {
        dish: "CAPRICCIOSA",
        description: "Napoli style"
    }
]

let restaurant = {
    name: "Prego",
    location: "Ponsonby",
    city: "Auckland",
    country: "New Zealand",
    staff: { fullTime: 15, partTime: 6 },
    //menu: dishList 
}
restaurant.menu = dishList;

//Check the difference
console.log(JSON.stringify(restaurant, ['name', 'location', 'country'], 2));
console.log(JSON.stringify(restaurant, ['name', 'location', 'country', 'dish', 'description'], 2));
console.log(JSON.stringify(restaurant, ['name', 'location', 'country', 'menu', 'dish', 'description'], 2));