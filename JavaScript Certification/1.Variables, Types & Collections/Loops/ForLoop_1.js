let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];


//Method-1
let sum = 0;
for (let index = 0; index < array.length; index++) {
    sum += array[index];
}
console.log('Loop-1:', sum);

//Method-2
sum = 0;
for (let index in array) {
    sum += array[index];
}
console.log('Loop-2:', sum);


//Method-3
sum = 0;
for (let element of array) {
    sum += element;
}
console.log('Loop-3:', sum);


//Method-4
sum = 0;
array.forEach(x => sum = sum + x);
console.log('Loop-4:', sum);
