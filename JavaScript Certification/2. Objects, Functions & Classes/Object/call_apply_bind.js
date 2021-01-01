//The first parameter in call() method sets the "this" value, which is the object, on which the function is invoked upon.
//The rest of the parameters are the arguments to the actual function.


//Similarly to call() method the first parameter in apply() method sets the "this" value which is the object upon which the function is invoked.
//The only difference of apply() with the call() method is that the second parameter of the apply() method accepts the arguments to the actual function as an array.

function personIntro() {
    console.log(`${this.firstName} ${this.lastName}`);
};

const person = {
    firstName: 'Nagesh',
    lastName: 'Siripurapu'
};

personIntro(); // Output 1: undefined undefined
personIntro.call(person); // Output 2: Nagesh Siripurapu
personIntro.call({ firstName: 'Haritha', lastName: 'Sappa' }); // Output 3: Haritha Sappa
//----------------------------------------------------------------------------------------------------------------
function personIntro1(city, state) {
    console.log(`${this.lastName} is from ${city}, ${state}`);
};
personIntro1.call(person, 'Los Angeles', 'California'); // Output: Max is from Los Angeles, California
//-----------------------------------------------------------------------------------------------------------------
function sum(num1, num2) {
    console.log(this + num1 + num2);
}

sum.call(2, 3, 4); // Output: 9
sum.apply(2, [3, 4]); // Output: 9
//-----------------------------------------------------------------------------------------------------------------
var update = function (name, age, size) {
    this.name = name;
    this.age = age;
    this.size = size;
    console.log(this.name + '---' + this.age + '---' + this.size);
};

update.call(person, 'Nagesh', 34, 'M'); //Here person object is ignored


var dispatch = function (person, method, args) {
    method.apply(person, args);
};

dispatch(person, update, ['Sanvi', 4, 'Toddler']);
//-----------------------------------------------------------------------------------------------------------------
var obj = { name: "Nagesh" };
var greeting = function (a, b, c) {
    return "welcome " + this.name + " to " + a + " " + b + " in " + c;
};
//creates a bound function that has same body and parameters 
var bound = greeting.bind(obj);   // this will return a function bound()
// calling bound()
console.log("Output using .bind() below ");
console.log(bound("SanJose", "California", "USA")); //call the bound function
/* will output
welcome Nagesh to SanJose California in USA */