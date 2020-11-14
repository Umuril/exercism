pub fn verse(n: u32) -> String {
    let beer = Beer::new(n);
    let last_bear = Beer::new((n + 99) % 100);
    format!(
        "{} of beer on the wall, {} of beer.\n{}, {} of beer on the wall.\n",
        beer.get_num_as_str(),
        beer.get_num_as_str().to_ascii_lowercase(),
        last_bear.get_description(),
        last_bear.get_num_as_str().to_ascii_lowercase()
    )
}

struct Beer {
    num: u32,
}

impl Beer {
    fn new(num: u32) -> Beer {
        Beer { num }
    }
    fn get_num_as_str(&self) -> String {
        format!(
            "{} {}",
            match self.num {
                0 => "No more".to_string(),
                _ => self.num.to_string(),
            },
            match self.num {
                1 => "bottle",
                _ => "bottles",
            }
        )
    }
    fn get_description(&self) -> &'static str {
        match self.num {
            99 => "Go to the store and buy some more",
            0 => "Take it down and pass it around",
            _ => "Take one down and pass it around",
        }
    }
}

pub fn sing(start: u32, end: u32) -> String {
    (end..start + 1)
        .rev()
        .map(verse)
        .collect::<Vec<String>>()
        .join("\n")
}
