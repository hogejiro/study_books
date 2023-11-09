export class AiueoUtil {
    public static swap<T>(a: T, b: T): [T, T] {
        return [b, a];
    }

    public static luhn(num: string): boolean {
        const reversedNums = num.split('').reverse().map(c => parseInt(c));
        const oddSum = reversedNums.filter((_, i) => i % 2 === 0).reduce((acc, cur) => acc + cur, 0);
        const evenSum = reversedNums.filter((_, i) => i % 2 === 1).reduce((acc, cur) => {
            let double = cur * 2;
            if (double >= 10) {
                double = double - 9;
            }
            return acc + double;
        }, 0);
        const sum = oddSum + evenSum;
        return sum % 10 === 0;
    }
}