const cities = {
    Lyon: 'France',
    Berlin: 'Germany',
    Paris: 'France'
};

let countries = Object.keys(cities).reduce((acc, k) => (acc[cities[k]] = [...(acc[cities[k]] || []), k], acc), {});
console.log(countries);
/*
{
    France: ["Lyon", "Paris"],
        Germany: ["Berlin"]
}*/