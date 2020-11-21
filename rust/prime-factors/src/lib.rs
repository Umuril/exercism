pub fn factors(n: u64) -> Vec<u64> {
    let mut primes = 2..;
    let mut result: Vec<u64> = Vec::new();
    let mut num = n;

    while num > 1 {
        let factor = primes.next().unwrap();
        while num % factor == 0 {
            num /= factor;
            result.push(factor);
        }
    }
    result

    /*
    TEST:
    let mut num = n.clone();

    (2..)
        .flat_map(|factor| {
            let mut v = Vec::new();
            while num % factor == 0 {
                v.push(factor);
                num /= factor;
            }
            v.into_iter()
        })
        .take_while(|_| num > 1)
        .collect::<Vec<u64>>()
    */
}
