// This stub file contains items which aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

pub fn production_rate_per_hour(speed: u8) -> f64 {
    221f64 * speed as f64 * match speed {
        x if 0 < x && x < 5 => 1f64,
        x if 4 < x && x < 9 => 0.9f64,
        x if 8 < x && x < 11 => 0.77f64,
        _ => 0f64,
    }
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    production_rate_per_hour(speed) as u32 / 60u32
}
