// aiueoUtil のjestテスト
import { AiueoUtil } from './aiueoUtil';

test('swap test', () => {
    // swap
    expect(AiueoUtil.swap(1, 2)).toEqual([2, 1]);
});

test('luhn test', () => {
    // swap
    expect(AiueoUtil.luhn('3566002020360505')).toEqual(true);
    expect(AiueoUtil.luhn('4242424242424242')).toEqual(true);
    expect(AiueoUtil.luhn('378282246310005')).toEqual(true);
    expect(AiueoUtil.luhn('1234567812345675')).toEqual(false);
    expect(AiueoUtil.luhn('1234567812345670')).toEqual(true);  
});