
/**
                                Prevent Extension vs Seal Vs Freeze
--------------------------------------------------------------------------------------------------------------------
Feature	                        default	            preventExtensions	        seal	            freeze
--------------------------------------------------------------------------------------------------------------------
add new properties	                ✓                   X                         X                   X
remove existing properties	        ✓	                ✓                         X                   X
change existing property values     ✓                   ✓                         ✓                   X
 */
let person = {
    name: "Nagesh",
    age: 34,
};

Object.preventExtensions(person);
console.log(Object.isExtensible(person)); // return false

person.surname = "Siripurapu";
console.log(person.surname); // return undefined

person.name = "Haritha";
console.log(person);

delete person.age;
console.log(person);

