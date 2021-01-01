let students = [
    { id: "001", name: "Anish", sports: "Cricket", tutionFee: 2500 },
    { id: "002", name: "Smriti", sports: "Basketball", tutionFee: 1500 },
    { id: "003", name: "Rahul", sports: "Cricket", tutionFee: 4500 },
    { id: "004", name: "Bakul", sports: "Basketball", tutionFee: 500 },
    { id: "005", name: "Nikita", sports: "Hockey", tutionFee: 3500 }
]

let basketballPlayers = students.filter(student => student.sports === "Basketball");
let basketballPlayerFees = basketballPlayers.map(player => player.tutionFee);
let basketballPlayerTotalFee = basketballPlayerFees.reduce((total, playerFee) => total + playerFee, 0);
console.log(basketballPlayerTotalFee);

let basketballPlayerTotalFee1 = students.reduce((total, student) => student.sports === "Basketball" ? total + student.tutionFee : total, 0);
console.log(basketballPlayerTotalFee1);