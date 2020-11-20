#![feature(test)]
extern crate test;
use test::Bencher;
use std::collections::HashSet;
use std::iter::FromIterator;

#[bench]
fn test_multiple_anagrams(b: &mut Bencher) {
    let word = "allergy";

    let inputs = [
        "gallery",
        "ballerina",
        "regally",
        "clergy",
        "largely",
        "leading",
    ];

    let outputs = vec!["gallery", "regally", "largely"];

    b.iter(|| process_anagram_case(word, &inputs, &outputs))
}

fn process_anagram_case(word: &str, inputs: &[&str], expected: &[&str]) {
    let result = anagram::anagrams_for(word, inputs);

    let expected: HashSet<&str> = HashSet::from_iter(expected.iter().cloned());

    assert_eq!(result, expected);
}