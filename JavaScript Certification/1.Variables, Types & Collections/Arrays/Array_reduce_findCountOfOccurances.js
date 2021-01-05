const words = ['sky', 'forest', 'wood', 'sky', 'rock', 'cloud',
    'sky', 'forest', 'rock', 'sky'];

const tally = words.reduce((total, next) => {

    total[next] = (total[next] || 0) + 1;

    return total;
}, {});


console.log(tally);