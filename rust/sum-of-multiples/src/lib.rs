use itertools::Itertools;

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    factors
        .iter()
        .filter(|&&factor| factor > 0)
        .flat_map(|&factor| {
            (factor..)
                .step_by(factor as usize)
                .take_while(|&f| f < limit)
        })
        .sorted()
        .dedup()
        .sum()
}
