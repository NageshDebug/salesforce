const obj1 = { firstName: 'Nagesh', age: 34 };
const obj2 = { lastName: 'Siripurapu', gender: 'M' };
const newObj = { ...obj1, ...obj2, course: 'CSE', company: 'Paypal' };
console.log(newObj)
/**
    {
        firstName: 'Nagesh',
        age: 34,
        lastName: 'Siripurapu',
        gender: 'M',
        course: 'CSE',
        company: 'Paypal'
    }
 */


//Overwrite the deuplicate values during merging objects
const foo = {
    english: 'hello',
    french: 'bonjour',
    japanese: 'konnichiwa'
};
const bar = {
    english: 'howdy',
    german: 'gutentag'
};
const baz = {
    ...foo,   //Here foo values are modified by bar values if any key matches. because ... operator maintaing order.
    ...bar,
    canadian: 'hello-ey',
    korean: 'annyeong'
};
console.log(baz);
/**
    {
        english: 'howdy',
        french: 'bonjour',
        japanese: 'konnichiwa',
        german: 'gutentag',
        canadian: 'hello-ey',
        korean: 'annyeong'
    }
 */

 //-------------------------------------------------------------------------------------
