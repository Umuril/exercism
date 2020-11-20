use itertools::Itertools;
use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &'a [&str]) -> HashSet<&'a str> {
    let lower_word : String = word.to_lowercase();
    let sorted_word : String = lower_word.sort();
    possible_anagrams
        .iter()
        .cloned()
        .filter(|&w| w.len() == word.len())
        .filter(|&w| {
            let c = w.to_lowercase();
            w.to_lowercase() != lower_word && c.sort() == sorted_word
        })
        .collect::<HashSet<&'a str>>()
}

pub trait Sortable {
    fn sort(&self) -> Self;
}

impl Sortable for String {
    fn sort(&self) -> Self {
        self.chars().sorted().collect::<String>()
    }
}