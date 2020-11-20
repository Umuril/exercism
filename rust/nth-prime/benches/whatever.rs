#![feature(test)]
extern crate test;
use nth_prime as np;
use test::Bencher;

#[bench]
fn test_big_prime(b: &mut Bencher) {
    b.iter(|| np::nth(10_000));
}
