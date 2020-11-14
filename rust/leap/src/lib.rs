pub fn is_leap_year(year: u64) -> bool {
    year & 3 == 0 && (year % 25 != 0 || year & 15 == 0)
}
