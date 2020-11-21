pub fn is_armstrong_number(num: u32) -> bool {
    let num_as_str = num.to_string();
    let total = num_as_str.chars().count();
    num_as_str
        .chars()
        .map(|digit| digit.to_digit(10).unwrap())
        .map(|n| n.pow(total as u32))
        .sum::<u32>()
        == num
}
