use phf::{phf_ordered_map, OrderedMap};

static RULES: OrderedMap<u32, &'static str> = phf_ordered_map! {
    3u32 => "Pling",
    5u32 => "Plang",
    7u32 => "Plong"
};

pub fn raindrops(n: u32) -> String {
    Some(
        RULES
            .entries()
            .filter(|(&k, _)| n % k == 0)
            .map(|(_, &v)| v.chars())
            .flatten()
            .collect::<String>(),
    )
    .filter(|s| !s.is_empty())
    .unwrap_or_else(|| n.to_string())
}
