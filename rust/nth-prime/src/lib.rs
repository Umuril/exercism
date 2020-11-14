pub fn nth(n: u32) -> u32 {
    (2..)
        .filter(|n: &u32| (2..n - 1).all(|x| n % x != 0))
        .nth(n as usize)
        .unwrap()
}
