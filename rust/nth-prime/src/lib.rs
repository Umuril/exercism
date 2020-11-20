use std::iter::repeat_with;

pub fn nth(n: u32) -> u32 {
    let mut a = vec![2u32];

    repeat_with(|| {
        let &lst = a.last().unwrap();
        a.push(
            ((lst + 1)..)
                .find(|&x| a.iter().take_while(|&&q| q * q <= x).all(|&y| x % y != 0))
                .unwrap(),
        );
        lst
    })
    .nth((n) as usize)
    .unwrap()
}
