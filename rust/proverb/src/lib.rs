use std::iter::once;

pub fn build_proverb(list: &[&str]) -> String {
    list.windows(2)
        .map(|window| {
            format!(
                "For want of a {} the {} was lost.",
                window.get(0).unwrap(),
                window.get(1).unwrap()
            )
        })
        .chain(once(match list.is_empty() {
            true => String::new(),
            false => format!("And all for the want of a {}.", list.get(0).unwrap()),
        }))
        .collect::<Vec<String>>()
        .join("\n")
}

