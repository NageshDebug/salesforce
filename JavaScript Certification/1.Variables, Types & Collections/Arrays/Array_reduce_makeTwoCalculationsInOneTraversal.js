const readings = [0.3, 1.2, 3.4, 0.2, 3.2, 5.5, 0.4];
const maxReading = readings.reduce((x, y) => Math.max(x, y), Number.MIN_VALUE);
const minReading = readings.reduce((x, y) => Math.min(x, y), Number.MAX_VALUE);
console.log({ minReading, maxReading });
//-----------------------------------------------
function minMaxReducer(acc, reading) {
    return {
        minReading: Math.min(acc.minReading, reading),
        maxReading: Math.max(acc.maxReading, reading),
    };
}
const initMinMax = {
    minReading: Number.MAX_VALUE,
    maxReading: Number.MIN_VALUE,
};
const minMax = readings.reduce(minMaxReducer, initMinMax);
console.log(minMax);
// ⦘ {minReading: 0.2, maxReading: 5.5}