const plus3 = x => x + 3

const double = x => x * 2

const minus5 = x => x - 5

const result = [plus3, double, minus5].reduce((value, nextFunction) => nextFunction(value), 0)
console.log(result)

const reduceRight = [plus3, double, minus5].reduceRight((value, nextFunction) => nextFunction(value), 0)
console.log(reduceRight)
