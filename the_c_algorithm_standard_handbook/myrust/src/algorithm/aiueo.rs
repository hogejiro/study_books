pub fn swap<T>(a: T, b: T) -> (T, T) {
    return (b, a);
}

pub fn luhn(s: &str) -> bool {
    let mut d: i32;
    let mut w: i32 = 1;
    let mut t: i32 = 0;
    for c in s.chars().rev() {
        d = w * (c as i32 - '0' as i32);
        if d > 9 {
            d -= 9;
        }
        t += d;
        w = 3 - w;
    }
    return (t % 10) == 0
}

#[cfg(test)]
mod tests{
    use super::swap;
    use super::luhn;
    #[test]
    fn test_swap() {
        assert_eq!(swap(1, 2), (2, 1));
        assert_eq!(swap("a", "b"), ("b", "a"));
        assert_eq!(swap(1.0, 2.0), (2.0, 1.0));
    }
    #[test]
    fn test_luhn() {
        assert_eq!(luhn("3566002020360505"), true);
        assert_eq!(luhn("4242424242424242"), true);
        assert_eq!(luhn("378282246310005"), true);
        assert_eq!(luhn("1234567812345675"), false);
        assert_eq!(luhn("1234567812345670"), true);
    }
}


