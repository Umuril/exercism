pub fn square(s: u32) -> u64 {
    match (1..65).contains(&s) {
        true => 1 << (s - 1),
        false => panic!("Square must be between 1 and 64"),
    }
}

pub fn total() -> u64 {
    (0u64/* same as 2u64 ** 64 & u64::max_value() */).wrapping_sub(1)
}
