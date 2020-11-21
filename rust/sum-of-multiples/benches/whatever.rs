#![feature(test)]
extern crate test;
use sum_of_multiples::sum_of_multiples;
use test::Bencher;

#[bench]
fn solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3(b: &mut Bencher) {
    b.iter(|| sum_of_multiples(10_000, &[2, 3, 5, 7, 11]));
}
