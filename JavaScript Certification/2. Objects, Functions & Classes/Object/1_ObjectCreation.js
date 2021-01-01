var main = () => {
    //Object Creation
    objectCreation();
}
main();



function objectCreation() {
    //objectCreation_method1();
    //objectCreation_method2();
    //objectCreation_method3();
    //objectCreation_method4();
    //objectCreation_method5();
    //objectCreation_method6();
    //objectCreation_method7();
    //objectsAreMutable();
    addNewProprtiesToExistingObject();
}

function objectCreation_method1() {
    let person = {
        firstName: "Nagesh",
        lastName: "Siripurapu",
        age: 34,
        eyeColor: "blue"
    };
    console.log(person);
    console.log(typeof person);
}

function objectCreation_method2() {
    let person = new Object();
    person.firstName = "Nagesh";
    person.lastName = "Siripurapu";
    person.age = 34;
    person.eyeColor = "blue";
    console.log(person);
    console.log(typeof person);
}


function objectCreation_method3() {
    let person = Object.create({}, {
        'firstName': {
            value: "Nagesh",
            writable: true,
            enumerable: true
        },
        'lastName': {
            value: "Siripurapu",
            writable: true,
            enumerable: true
        },
        'age': {
            value: "34",
            writable: true,
            enumerable: true
        },
        'eyeColor': {
            value: "blue",
            writable: true,
            enumerable: true
        }
    });
    console.log(person);
}


function objectCreation_method4() {
    let person = {
        firstName: "Nagesh",
        lastName: "Siripurapu",
        age: 34
    };

    let person1 = Object.create(person);
    let person2 = Object.create(person, {});
    let person3 = Object.create(person, {
        'eyeColor': {
            value: "blue",
            writable: true,
            enumerable: true
        }
    });
    console.log(person1);
    console.log(person1.firstName);
    console.log(person1.lastName);
    console.log(person1.age);
    console.log(person1.eyeColor);
    console.log('-------------------------------');
    console.log(person2);
    console.log(person2.firstName);
    console.log(person2.lastName);
    console.log(person2.age);
    console.log(person2.eyeColor);
    console.log('-------------------------------');
    console.log(person3);
    console.log(person3.firstName);
    console.log(person3.lastName);
    console.log(person3.age);
    console.log(person3.eyeColor);
}

function objectCreation_method5() {
    const orgObject = { company: 'ABC Corp' }
    const carObject = { carName: 'Ford' }
    const employee = Object.assign({}, orgObject, carObject);
    console.log(employee);
}

function objectCreation_method6() {
    function Person(fname, lname) {
        this.firstName = fname;
        this.lastName = lname;
    }
    const personOne = new Person('Nagesh', 'Siripurapu');
    const personTwo = new Person('Sanvi', 'Siripurapu');

    console.log(personOne);
    console.log(personTwo);
}

function objectCreation_method7() {
    class Person {
        constructor(fname, lname) {
            this.firstName = fname;
            this.lastName = lname;
        }
    }

    const person = new Person('Nagesh', 'Siripurapu');
    console.log(person);
}

function objectsAreMutable() {
    let person = {
        firstName: "Nagesh",
        lastName: "Siripurapu",
        age: 34,
        eyeColor: "blue"
    }
    console.log(person);

    let x = person;
    x.age = 35;           // This will change both x.age and person.age
    console.log(x);
    console.log(person);
    console.log(x == person);
    console.log(x === person);
}

function addNewProprtiesToExistingObject() {
    let person = {
        firstName: "Nagesh",
        lastName: "Siripurapu",
        age: 34,
    }
    console.log(person);

    //Method-1
    person.eyeColor = 'blue';
    console.log(person);

    //Method-2
    person['eyeColor'] = 'black';
    console.log(person);

    //Method-3
    person = Object.assign({}, person, { sex: 'M' });
    console.log(person);

    //Method-4
    Object.defineProperty(person, "grade", { value: "CSE" });
    console.log(person.grade);
}