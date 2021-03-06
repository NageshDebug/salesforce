let st = 'Nagesh';
let reverseString = '';
for (let i = st.length - 1; i >= 0; i--) {
    reverseString += st[i];
}
console.log(reverseString);



let stArray = st.split('');
reverseString = '';
for (let i = stArray.length - 1; i >= 0; i--) {
    reverseString += stArray[i];
}
console.log(reverseString);


stArray = [...st];;
reverseString = '';
for (let i = stArray.length - 1; i >= 0; i--) {
    reverseString += stArray[i];
}
console.log(reverseString);


reverseString = st.split('').reverse().join('');
console.log(reverseString);


reverseString = st.split('').reduce((x, y) => y + x);
console.log(reverseString);
