let str = "The rain in SPAIN stays mainly in the plain";
let res = str.match(/ain/g);
console.log(res.length > 0);


res = str.includes('ain');
console.log(res);


res = str.indexOf('ain');
console.log(res > 0);


res = str.lastIndexOf('ain');
console.log(res > 0);


res = str.search('ain');
console.log(res > 0);


