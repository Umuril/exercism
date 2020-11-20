// The code below is a stub. Just enough to satisfy the compiler.
// In order to pass the tests you can add-to or change any of this code.

#[derive(Debug)]
pub struct Duration {
    sec: u64,
}

impl Duration {
    fn years(&self) -> f64 {
        self.sec as f64 / 31_557_600.0
    }
}

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Duration { sec: s }
    }
}

pub trait Planet {
    fn years_during(d: &Duration) -> f64 {
        d.years() / Self::ratio_to_earth()
    }

    fn ratio_to_earth() -> f64;
}

pub struct Mercury;
pub struct Venus;
pub struct Earth;
pub struct Mars;
pub struct Jupiter;
pub struct Saturn;
pub struct Uranus;
pub struct Neptune;

impl Planet for Mercury {
    fn ratio_to_earth() -> f64 {
        0.2408467
    }
}

impl Planet for Venus {
    fn ratio_to_earth() -> f64 {
        0.61519726
    }
}
impl Planet for Earth {
    fn ratio_to_earth() -> f64 {
        1.0
    }
}
impl Planet for Mars {
    fn ratio_to_earth() -> f64 {
        1.8808158
    }
}
impl Planet for Jupiter {
    fn ratio_to_earth() -> f64 {
        11.862615
    }
}
impl Planet for Saturn {
    fn ratio_to_earth() -> f64 {
        29.447498
    }
}
impl Planet for Uranus {
    fn ratio_to_earth() -> f64 {
        84.016846
    }
}
impl Planet for Neptune {
    fn ratio_to_earth() -> f64 {
        164.79132
    }
}
