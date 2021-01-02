//Method-1
console.log(Number.isInteger(123)) //true
console.log(Number.isInteger(-123)) //true
console.log(Number.isInteger(5 - 2)) //true
console.log(Number.isInteger(0)) //true
console.log(Number.isInteger(0.5)) //false
console.log(Number.isInteger('123')) //false
console.log(Number.isInteger(false)) //false
console.log(Number.isInteger(Infinity)) //false
console.log(Number.isInteger(-Infinity)) //false
console.log(Number.isInteger(0 / 0)) //false


//Method-2
console.log(isNaN(123)) //false
console.log(isNaN(-1.23)) //false
console.log(isNaN(5 - 2)) //false
console.log(isNaN(0)) //false
console.log(isNaN('123')) //false
console.log(isNaN('')) //false
console.log(isNaN(true)) //false
console.log(isNaN(null)) //false
console.log(isNaN('Hello')) //true
console.log(isNaN('2005/12/12')) //true
console.log(isNaN('NaN')) //true
console.log(isNaN(NaN)) //true
console.log(isNaN(0 / 0)) //true
console.log(isNaN(undefined)) //true