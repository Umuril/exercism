// This stub file contains items which aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

use std::collections::HashMap;

pub fn can_construct_note(magazine: &[&str], note: &[&str]) -> bool {
    let mut map = HashMap::new();
    for word in magazine {
        if let Some(v) = map.get_mut(word) {
            *v = *v + 1u32;
        } else {
            map.insert(word, 1);
        }
    };
    for word in note {
        if let Some(v) = map.get_mut(word) {
            if *v == 0 {
                return false;
            }
            *v = *v - 1;
        } else {
            return false;
        }
    }
    return true;
}
