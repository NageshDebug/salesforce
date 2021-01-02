//Copy Array
let array = [1, 2, 3, 4, 5];
let duplicatedArray = [...array];
console.log(duplicatedArray);

duplicatedArray[2] = 6;
console.log(array);
console.log(duplicatedArray);       //So, Spread Operator doesn't modify the original Array
//------------------------------------------------------------------------------------------
duplicatedArray1 = array;
duplicatedArray1[2] = 7;
console.log(array);
console.log(duplicatedArray1);       //So, This is pass by reference. It will modify the original Array
//-------------------------------------------------------------------------------------------
duplicateArray2 = [];
for (var i = 0; i < array.length; i++) {
    duplicateArray2[i] = array[i];
}

duplicateArray2[2] = 8;
console.log(array);
console.log(duplicateArray2);       //So, it is same as spread operator
