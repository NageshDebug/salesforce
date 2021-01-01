var main = () => {
    //Assign
    assign();
};
main();

function assign() {
    assign_mergeObjects();
    //assign_cloneObject();
    //assign_convertArrayToObject();
}

//Merge multiple objects (N number of objects)
function assign_mergeObjects() {
    let person1 = { firstName: 'Nagesh', lastName: 'Siripurapu' };
    let person2 = { qualification: 'B.Tech', course: 'CSE', grade: 'A' };
    let person3 = { age: '34', eyeColor: 'Blue' };
    let person = Object.assign(person1, person2, person3);
    console.log(person);
}

//Clone objects
function assign_cloneObject() {
    let person1 = { firstName: 'Nagesh', lastName: 'Siripurapu' };
    let person2 = Object.assign({}, person1);
    console.log(person1);
    console.log(person2);

    person1.lastName = 'Sappa';
    person2.firstName = 'Haritha';
    console.log(person1);
    console.log(person2);
}

//Convert Array To Object
function assign_convertArrayToObject() {
    let array = ['Nagesh', 'Sanvi', 'Haritha'];
    let names = Object.assign({}, array);
    console.log(names);
}