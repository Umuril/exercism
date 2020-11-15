pub fn square_of_sum(n: u32) -> u32 {
    n.pow(2) * (n * (n + 2) + 1) / 4
}

pub fn sum_of_squares(n: u32) -> u32 {
    n * (n * (4 * n + 6) + 2) / 12
}

pub fn difference(n: u32) -> u32 {
    n * (n * (n * (3 * n + 2) - 3) - 2) / 12
}
