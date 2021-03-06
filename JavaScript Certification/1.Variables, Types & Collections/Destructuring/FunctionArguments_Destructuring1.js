const student = {
    name: 'Nagesh Siripurapu',
    age: 34,
    scores: {
        maths: 74,
        english: 63,
        science: 85
    }
};

function displaySummary(student) {
    console.log('Hello, ' + student.name);
    console.log('Your Maths score is ' + (student.scores.maths || 0));
    console.log('Your English score is ' + (student.scores.english || 0));
    console.log('Your Science score is ' + (student.scores.science || 0));
}
displaySummary(student);
// Hello, Nagesh Siripurapu
// Your Maths score is 74
// Your English score is 63
// Your Science score is 85

function displaySummary1({ name, scores: { maths = 0, english = 0, science = 0 } }) {
    console.log('Hello, ' + name);
    console.log('Your Maths score is ' + maths);
    console.log('Your English score is ' + english);
    console.log('Your Science score is ' + science);
}
displaySummary1(student);