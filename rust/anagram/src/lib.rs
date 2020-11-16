use std::collections::HashSet;
use std::iter::FromIterator;
use itertools::Itertools;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &'a [&str]) -> HashSet<&'a str> {
    let lower_word = word.to_lowercase();
    HashSet::from_iter(
        possible_anagrams
            .iter()
            .filter(|&w| is_anagram(&w.to_lowercase(), &lower_word))
            .map(|&w| w)
        ,
    )
}

pub fn is_anagram(word: &String, other: &String) -> bool {
    word != other && word.chars().sorted().collect::<String>() == other.chars().sorted().collect::<String>()
}