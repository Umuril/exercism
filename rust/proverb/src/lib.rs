pub fn build_proverb(list: &[&str]) -> String {
    if list.is_empty() {
        return String::new();
    };
    let mut result: Vec<String> = list
        .windows(2)
        .map(|window| {
            format!(
                "For want of a {} the {} was lost.",
                window.get(0).unwrap(),
                window.get(1).unwrap()
            )
        })
        .collect();

    result.push(format!(
        "And all for the want of a {}.",
        list.get(0).unwrap()
    ));

    result.join("\n")
}